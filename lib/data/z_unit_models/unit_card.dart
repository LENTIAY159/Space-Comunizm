import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'weapon_card.dart';
import 'unit_model.dart';
import 'keyword_converter.dart';
import 'weapon_model.dart';
import 'keyword_list.dart';
import 'core_abilities.dart';
import '../z_datachment_model/army_rule_model.dart';
import '../space_marines/army_rule/army_rule_sm.dart';
import '../tyranids/army_rule/army_rule_tyranids.dart';
import '../necrons/army_rule/army_rule_necrons.dart';
import '../chaos_space_marines/army_rule/army_rule_csm.dart';

class UnitCard extends StatefulWidget {
  final Unit unit;
  final Widget? topRightButton;
  final String? selectedCompositionId;
  final Function(String compositionId)? onCompositionSelected;
  final String? currentCompositionId;
  final Function(String compositionId)? onCompositionChange;

  const UnitCard({
    super.key,
    required this.unit,
    this.topRightButton,
    this.selectedCompositionId,
    this.onCompositionSelected,
    this.currentCompositionId,
    this.onCompositionChange,
  });

  @override
  State<UnitCard> createState() => _UnitCardState();
}

class _UnitCardState extends State<UnitCard> {
  Color _getFactionColor() {
    final factionKeywords = widget.unit.factionKeywords.map((k) => KeywordConverter.factionToReadable(k)).toList();
    final keywords = widget.unit.keywordObjects.map((k) => KeywordConverter.toReadable(k)).toList();

    if (factionKeywords.contains('Adeptus Astartes')) {
      return Colors.blue.shade900;
    } else if (factionKeywords.contains('Heretic Astartes') || factionKeywords.contains('Chaos')) {
      return Colors.black;
    } else if (factionKeywords.contains('Necrons')) {
      return Colors.green.shade900;
    } else if (factionKeywords.contains('Tyranids')) {
      return Colors.purple.shade900;
    }

    if (keywords.contains('Space Marines')) {
      return Colors.blue.shade900;
    } else if (keywords.contains('Chaos')) {
      return Colors.black;
    }

    return Colors.grey.shade900;
  }

  void _showInfoDialog(BuildContext context, String title, Widget content) {
    final factionColor = _getFactionColor();

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      pageBuilder: (context, animation, secondaryAnimation) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.fastOutSlowIn,
          ),
          child: AlertDialog(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: factionColor, width: 2),
            ),
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            content: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: content,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Close',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red.shade700,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAbilityDescriptionDialog(BuildContext context, String title, String description) {
    _showInfoDialog(context, title, Text(
      description,
      style: const TextStyle(color: Colors.white, fontSize: 16),
    ));
  }

  void _showSpecialRuleDialog(BuildContext context) {
    if (widget.unit.specialName == null || widget.unit.specialText == null) return;

    _showInfoDialog(
      context,
      widget.unit.specialName!,
      _buildSpecialTextContent(widget.unit.specialText!),
    );
  }

  Widget _buildSpecialTextContent(String specialText) {
    if (specialText.trim().isEmpty) {
      return const Text(
        'No special rule description available',
        style: TextStyle(color: Colors.white70, fontSize: 16),
      );
    }

    final lines = specialText.split('\n');
    List<Widget> widgets = [];

    for (int i = 0; i < lines.length; i++) {
      final line = lines[i].trim();

      if (line.isEmpty) {
        continue;
      }

      final colonIndex = line.indexOf(':');

      if (colonIndex != -1) {
        String title = line.substring(0, colonIndex).trim();
        String description = line.substring(colonIndex + 1).trim();

        widgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$title: ',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: description,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        widgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              line,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        );
      }

      if (i < lines.length - 1) {
        widgets.add(const SizedBox(height: 8));
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  void _showTransportDialog(BuildContext context) {
    if (!widget.unit.hasTransport) return;

    _showInfoDialog(
      context,
      'Transport',
      Text(
        widget.unit.transport!,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  /// NEW: Commander dialog - IMPROVED VERSION
  void _showCommanderDialog(BuildContext context) {
    final data = widget.unit.commander;
    if (data == null || data.isEmpty) return;

    final String title = data.length > 0 && data[0] != null
        ? data[0].toString()
        : 'Commander';

    final bool mustBeWarlord = data.length > 1 && data[1] == true;

    final String body = mustBeWarlord
        ? 'Если эта модель в вашей армии, она должна быть вашим Warlord.'
        : 'Эта модель не может быть вашим Warlord';

    _showInfoDialog(
      context,
      title,
      Text(body, style: const TextStyle(color: Colors.white, fontSize: 16)),
    );
  }

  void _showModelProfilesDialog(BuildContext context) {
    _showInfoDialog(
      context,
      'Model Profiles',
      _buildModelProfilesDialogContent(),
    );
  }

  Widget _buildWeaponsDialogContent(List<Weapon> weapons, bool isRanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: weapons.map((weapon) =>
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: WeaponCard(weapon: weapon, isRanged: isRanged),
          )
      ).toList(),
    );
  }

  Widget _buildAbilitiesDialogContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.unit.coreAbilities.isNotEmpty) ...[
          const Text(
            'Core:',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: widget.unit.coreAbilities.map((coreAbility) {
              final parameters = widget.unit.coreRuleDetails?[coreAbility];
              final coreData = coreAbilitiesList.firstWhere(
                    (data) => data.id == coreAbility,
                orElse: () => CoreAbilityData(
                  id: coreAbility,
                  name: coreAbility.toString(),
                  description: 'No description available',
                ),
              );
              final displayName = CoreAbilityConverter.toReadable(coreAbility, parameters);

              return ActionChip(
                label: Text(displayName),
                onPressed: () => _showAbilityDescriptionDialog(
                    context,
                    displayName,
                    CoreAbilityConverter.getDescription(coreAbility)
                ),
                backgroundColor: Colors.grey.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
        ],

        if (widget.unit.factionAbilities.isNotEmpty) ...[
          const Text(
            'Faction:',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: widget.unit.factionAbilities.map((factionAbility) {
              final displayName = factionAbility.displayName;

              return ActionChip(
                label: Text(displayName),
                onPressed: () => _showAbilityDescriptionDialog(context, displayName, factionAbility.description),
                backgroundColor: Colors.grey.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
        ],

        if (widget.unit.abilities.isNotEmpty) ...[
          const Text(
            'Abilities:',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.unit.abilities.map((ability) {
              final parts = ability.split(':');
              final name = parts[0].trim();
              final description = parts.length > 1 ? parts.sublist(1).join(':').trim() : '';
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '• $name: ',
                        style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => _showAbilityDescriptionDialog(context, name, description),
                      ),
                      TextSpan(
                        text: description,
                        style: const TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ],
    );
  }

  Widget _buildModelProfilesDialogContent() {
    final profiles = widget.unit.effectiveProfiles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.unit.hasMultipleProfiles)
          const Text(
            'This unit contains multiple model types with different characteristics:',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        const SizedBox(height: 12),

        ...profiles.asMap().entries.map((entry) {
          final index = entry.key;
          final profile = entry.value;
          final isLastProfile = index == profiles.length - 1;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _getFactionColor().withOpacity(0.2),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  border: Border.all(color: _getFactionColor()),
                ),
                child: Text(
                  profile.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  border: Border(
                    left: BorderSide(color: _getFactionColor()),
                    right: BorderSide(color: _getFactionColor()),
                    bottom: BorderSide(color: _getFactionColor()),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildProfileCharacteristic('M', profile.move),
                        _buildProfileCharacteristic('T', profile.toughness),
                        _buildProfileCharacteristic('SV', profile.save),
                        _buildProfileCharacteristic('W', profile.wounds),
                        _buildProfileCharacteristic('LD', profile.leadership),
                        _buildProfileCharacteristic('OC', profile.objectiveControl),
                      ],
                    ),

                    if (profile.invulnerableSave != null) ...[
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Invulnerable Save: ',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            profile.invulnerableSave!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],

                    if (profile.baseSize != null && widget.unit.hasMultipleProfiles) ...[
                      const SizedBox(height: 4),
                      Text(
                        'Base Size: ${profile.baseSize}',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              if (!isLastProfile) const SizedBox(height: 16),
            ],
          );
        }).toList(),
      ],
    );
  }

  Widget _buildProfileCharacteristic(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white70),
          ),
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLeaderDialogContent() {
    if (widget.unit.leader == null || widget.unit.leader!.isEmpty) {
      return const Text(
        'No leader information available',
        style: TextStyle(color: Colors.white, fontSize: 16),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...widget.unit.leader!.map((leaderItem) {
          final displayText = leaderItem is Keyword
              ? KeywordConverter.toReadable(leaderItem)
              : leaderItem is FactionKeyword
              ? KeywordConverter.factionToReadable(leaderItem)
              : leaderItem.toString();

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              "• $displayText",
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        }).toList(),

        if (widget.unit.leaderDescription != null && widget.unit.leaderDescription!.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(
            widget.unit.leaderDescription!,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildUnitCompositionDialogContent() {
    final bool isInteractive = widget.onCompositionChange != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.unit.unitComposition.isNotEmpty) ...[
          Text(
            isInteractive ? 'Select Unit Composition:' : 'Available Unit Compositions:',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          ...widget.unit.unitComposition.map((composition) {
            final isSelected = widget.currentCompositionId == composition.id;

            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: isInteractive
                  ? InkWell(
                onTap: () {
                  widget.onCompositionChange!(composition.id);
                  Navigator.pop(context);
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.green.withOpacity(0.2) : Colors.grey.shade700,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected ? Colors.green : _getFactionColor(),
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              composition.displayText,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            if (composition.modelCount > 0)
                              Text(
                                '${composition.modelCount} models',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.green[700],
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              '${composition.points} pts',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          if (isSelected) ...[
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 20,
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              )
                  : Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: _getFactionColor(), width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      composition.displayText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green[700],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '${composition.points} pts',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),

          const SizedBox(height: 16),
        ],

        if (widget.unit.unitCompositionDescription != null &&
            widget.unit.unitCompositionDescription!.isNotEmpty) ...[
          const Text(
            'Unit Equipment:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.unit.unitCompositionDescription!,
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ],
      ],
    );
  }

  Widget _buildKeywordsDialogContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.unit.factionKeywords.isNotEmpty) ...[
          const Text(
            'Faction Keywords:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: widget.unit.factionKeywords.map(
                  (factionKeyword) => Chip(
                label: Text(
                  KeywordConverter.factionToReadable(factionKeyword),
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.grey.shade700,
              ),
            ).toList(),
          ),
          const SizedBox(height: 16),
        ],

        if (widget.unit.keywords.isNotEmpty) ...[
          const Text(
            'Keywords:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          _buildMixedKeywordsContent(),
        ],
      ],
    );
  }

  Widget _buildMixedKeywordsContent() {
    List<Widget> widgets = [];

    for (int i = 0; i < widget.unit.keywords.length; i++) {
      final item = widget.unit.keywords[i];

      if (item is String) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              item,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        );
      } else if (item is Keyword) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Chip(
              label: Text(
                KeywordConverter.toReadable(item),
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.grey.shade700,
            ),
          ),
        );
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  Widget _buildDamagedDialogContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.unit.damaged.entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "${entry.key} WOUNDS: ",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: entry.value,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  bool _hasSpecialRule() {
    return widget.unit.specialName != null &&
        widget.unit.specialName!.isNotEmpty &&
        widget.unit.specialText != null &&
        widget.unit.specialText!.isNotEmpty;
  }

  Widget _buildAllProfiles(Color accentColor) {
    final profiles = widget.unit.effectiveProfiles;

    return Column(
      children: profiles.asMap().entries.map((entry) {
        final index = entry.key;
        final profile = entry.value;
        final isLastProfile = index == profiles.length - 1;

        return Column(
          children: [
            if (widget.unit.hasMultipleProfiles)
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  profile.name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: accentColor,
                  ),
                ),
              ),

            if (profile.baseSize != null && widget.unit.hasMultipleProfiles)
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  'Base size: ${profile.baseSize}',
                  style: TextStyle(
                    fontSize: 12,
                    color: accentColor.withOpacity(0.8),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCharacteristic('M', profile.move, accentColor),
                  _buildCharacteristic('T', profile.toughness, accentColor),
                  _buildCharacteristic('SV', profile.save, accentColor),
                  _buildCharacteristic('W', profile.wounds, accentColor),
                  _buildCharacteristic('LD', profile.leadership, accentColor),
                  _buildCharacteristic('OC', profile.objectiveControl, accentColor),
                ],
              ),
            ),

            if (profile.invulnerableSave != null)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Invulnerable Save ',
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      profile.invulnerableSave!,
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

            if (!isLastProfile) ...[
              const SizedBox(height: 8),
              Container(
                height: 1,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                color: accentColor.withOpacity(0.3),
              ),
              const SizedBox(height: 8),
            ],
          ],
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final factionColor = _getFactionColor();
    final accentColor = factionColor.computeLuminance() > 0.3
        ? Colors.black
        : Colors.white;

    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: factionColor, width: 1),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade900,
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.unit.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: accentColor,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (!widget.unit.hasMultipleProfiles &&
                                widget.unit.primaryProfile.baseSize != null &&
                                widget.unit.primaryProfile.baseSize!.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Text(
                                  'Base size: ${widget.unit.primaryProfile.baseSize}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: accentColor.withOpacity(0.8),
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  _buildAllProfiles(accentColor),

                  const SizedBox(height: 10),

                  _buildSectionButtons(context, accentColor),
                ],
              ),
            ),
            if (widget.topRightButton != null) widget.topRightButton!,
          ],
        ),
      ),
    );
  }

  Widget _buildSectionButtons(BuildContext context, Color accentColor) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          if (widget.unit.rangedWeapons.isNotEmpty) ...[
            _buildSectionButton(
              context,
              'Ranged Weapon',
              accentColor,
                  () => _showInfoDialog(
                context,
                'Ranged Weapon',
                _buildWeaponsDialogContent(widget.unit.rangedWeapons, true),
              ),
            ),
            const SizedBox(width: 6),
          ],
          if (widget.unit.meleeWeapons.isNotEmpty) ...[
            _buildSectionButton(
              context,
              'Melee Weapon',
              accentColor,
                  () => _showInfoDialog(
                context,
                'Melee Weapon',
                _buildWeaponsDialogContent(widget.unit.meleeWeapons, false),
              ),
            ),
            const SizedBox(width: 6),
          ],
          if (_hasAnyAbilities()) ...[
            _buildSectionButton(
              context,
              'Abilities',
              accentColor,
                  () => _showInfoDialog(
                context,
                'Abilities',
                _buildAbilitiesDialogContent(),
              ),
            ),
            const SizedBox(width: 6),
          ],
          if (_hasSpecialRule()) ...[
            _buildSectionButton(
              context,
              widget.unit.specialName!,
              accentColor,
                  () => _showSpecialRuleDialog(context),
            ),
            const SizedBox(width: 6),
          ],
          if (widget.unit.hasTransport) ...[
            _buildSectionButton(
              context,
              'Transport',
              accentColor,
                  () => _showTransportDialog(context),
            ),
            const SizedBox(width: 6),
          ],
          if (widget.unit.leader != null && widget.unit.leader!.isNotEmpty) ...[
            _buildSectionButton(
              context,
              'Leader',
              accentColor,
                  () => _showInfoDialog(
                context,
                'Leader',
                _buildLeaderDialogContent(),
              ),
            ),
            const SizedBox(width: 6),
          ],
          if (widget.unit.keywords.isNotEmpty || widget.unit.factionKeywords.isNotEmpty) ...[
            _buildSectionButton(
              context,
              'Keywords',
              accentColor,
                  () => _showInfoDialog(
                context,
                'Keywords',
                _buildKeywordsDialogContent(),
              ),
            ),
            const SizedBox(width: 6),
          ],
          _buildSectionButton(
            context,
            'Unit Composition',
            accentColor,
                () => _showInfoDialog(
              context,
              'Unit Composition',
              _buildUnitCompositionDialogContent(),
            ),
          ),
          const SizedBox(width: 6),
          if (widget.unit.wargearAbilities != null && widget.unit.wargearAbilities!.isNotEmpty) ...[
            _buildSectionButton(
              context,
              'Wargear Abilities',
              accentColor,
                  () => _showInfoDialog(
                context,
                'Wargear Abilities',
                Text(
                  widget.unit.wargearAbilities!,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(width: 6),
          ],
          if (widget.unit.wargearOptions != null && widget.unit.wargearOptions!.isNotEmpty) ...[
            _buildSectionButton(
              context,
              'Wargear Options',
              accentColor,
                  () => _showInfoDialog(
                context,
                'Wargear Options',
                Text(
                  widget.unit.wargearOptions!,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(width: 6),
          ],
          if (widget.unit.damaged.isNotEmpty) ...[
            _buildSectionButton(
              context,
              'Damaged',
              accentColor,
                  () => _showInfoDialog(
                context,
                'Damaged',
                _buildDamagedDialogContent(),
              ),
            ),
          ],
          // NEW: Commander button goes first if provided
          if (widget.unit.commander != null && widget.unit.commander!.length >= 2) ...[
            _buildSectionButton(
              context,
              widget.unit.commander![0].toString(),
              accentColor,
                  () => _showCommanderDialog(context),
            ),
            const SizedBox(width: 6),
          ],
        ],
      ),
    );
  }

  bool _hasAnyAbilities() {
    return widget.unit.coreAbilities.isNotEmpty ||
        widget.unit.factionAbilities.isNotEmpty ||
        widget.unit.abilities.isNotEmpty;
  }

  Widget _buildSectionButton(
      BuildContext context,
      String label,
      Color accentColor,
      VoidCallback onPressed) {
    return ActionChip(
      label: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          color: accentColor,
        ),
      ),
      onPressed: onPressed,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: accentColor),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      labelPadding: const EdgeInsets.symmetric(horizontal: 4),
    );
  }

  Widget _buildCharacteristic(
      String label, String value, Color accentColor) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: accentColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 28,
          height: 28,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            shape: BoxShape.circle,
            border: Border.all(color: accentColor),
          ),
          child: Text(
            value,
            style: TextStyle(
              color: accentColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
