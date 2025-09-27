import 'package:flutter/material.dart';
import '../buttons/datasheets.dart';
import '../data/z_unit_models/unit_model.dart';
import '../data/z_unit_models/selected_unit_model.dart';
import '../buttons/army_rule.dart' show ArmyRuleButton;
import '../data/z_datachment_model/army_rule_model.dart';
import '../data/z_core_stratagems/stratagems.dart';
import '../buttons/stratagems.dart';
import '../data/z_datachment_model/detachment_model.dart';
import '../data/z_datachment_model/enhancement_model.dart';
import '../data/z_datachment_model/stratagem_model.dart';
import '../data/z_datachment_model/restriction_model.dart';
import '../buttons/missions.dart' show MissionsContent;

class CategoryContent extends StatefulWidget {
  final String currentCategory;
  final List<SelectedUnit> selectedUnits;
  final Map<String, List<Unit>> unitsByCategory;
  final Function(Unit) onAddUnit;
  final Function(SelectedUnit) onRemoveUnit;
  final String selectedFaction;
  final Detachment? selectedDetachment;
  final List<Restriction> factionRestrictions;
  final Function(String instanceId, String compositionId) onCompositionChanged;

  const CategoryContent({
    super.key,
    required this.currentCategory,
    required this.selectedUnits,
    required this.unitsByCategory,
    required this.onAddUnit,
    required this.onRemoveUnit,
    required this.selectedFaction,
    required this.selectedDetachment,
    required this.factionRestrictions,
    required this.onCompositionChanged,
  });

  @override
  State<CategoryContent> createState() => _CategoryContentState();
}

class _CategoryContentState extends State<CategoryContent> {
  Map<int, bool> expandedRules = {};
  String? _currentDetachmentName;
  String? _currentFaction;

  @override
  void didUpdateWidget(CategoryContent oldWidget) {
    super.didUpdateWidget(oldWidget);

    final newDetachmentName = widget.selectedDetachment?.name;
    final newFaction = widget.selectedFaction;

    if (_currentDetachmentName != newDetachmentName || _currentFaction != newFaction) {
      setState(() {
        expandedRules.clear();
        _currentDetachmentName = newDetachmentName;
        _currentFaction = newFaction;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _currentDetachmentName = widget.selectedDetachment?.name;
    _currentFaction = widget.selectedFaction;
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.currentCategory) {
      case 'Datasheets':
        return DatasheetsSections(
          selectedUnits: widget.selectedUnits,
          unitsByCategory: widget.unitsByCategory,
          onAddUnit: widget.onAddUnit,
          onRemoveUnit: widget.onRemoveUnit,
          restrictions: [
            ...widget.factionRestrictions,
            ...(widget.selectedDetachment?.restrictions ?? []),
          ],
          onCompositionChanged: widget.onCompositionChanged,
        );
      case 'Army Rule':
        return _buildArmyRuleContent();
      case 'Stratagems':
        return _buildStratagemsContent();
      case 'Enhancements':
        return _buildEnhancementsContent();
      case 'Missions':
        return MissionsContent(currentFaction: widget.selectedFaction);
      default:
        return const Center(
          child: Text(
            'Select a category',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        );
    }
  }

  Widget _buildStratagemsContent() {
    final List<Stratagem> allStratagems = [];
    allStratagems.addAll(coreStratagems);

    if (widget.selectedDetachment != null) {
      allStratagems.addAll(widget.selectedDetachment!.stratagems);
    }

    return StratagemsContent(
      stratagems: allStratagems,
    );
  }

  Widget _buildEnhancementsContent() {
    final enhancements = widget.selectedDetachment?.enhancements ?? [];

    if (enhancements.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.extension_off,
              size: 64,
              color: Colors.white38,
            ),
            const SizedBox(height: 16),
            Text(
              widget.selectedDetachment == null
                  ? 'No detachment selected'
                  : 'No enhancements available\nfor current detachment',
              style: const TextStyle(color: Colors.white70, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: enhancements.length,
        itemBuilder: (context, index) {
          return _buildEnhancementCard(enhancements[index]);
        },
      ),
    );
  }

  Widget _buildEnhancementCard(Enhancement enhancement) {
    return Card(
      color: Colors.grey[900],
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: _getFactionColor(widget.selectedFaction),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              enhancement.name,
              style: TextStyle(
                color: Colors.blue[200],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              enhancement.description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArmyRuleContent() {
    if (widget.selectedFaction.isEmpty) {
      return const Center(
        child: Text(
          'Please select an army first to view its special rules',
          style: TextStyle(color: Colors.white70, fontSize: 18),
        ),
      );
    }

    final rules = ArmyRuleButton.getArmyRules(
      widget.selectedFaction,
      widget.selectedDetachment,
    );

    if (rules.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.rule_folder_outlined,
              size: 64,
              color: Colors.white38,
            ),
            SizedBox(height: 16),
            Text(
              'No army rules available',
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: rules.length,
        itemBuilder: (context, index) {
          expandedRules[index] = expandedRules[index] ?? false;
          return _buildRuleCard(index, rules[index]);
        },
      ),
    );
  }

  Widget _buildRuleCard(int index, ArmyRule rule) {
    return Card(
      color: Colors.grey[900],
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: _getFactionColor(widget.selectedFaction),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              rule.name,
              style: TextStyle(
                color: _getFactionColor(widget.selectedFaction),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Icon(
              expandedRules[index]! ? Icons.expand_less : Icons.expand_more,
              color: Colors.white70,
            ),
            onTap: () {
              setState(() {
                expandedRules[index] = !expandedRules[index]!;
              });
            },
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: expandedRules[index]!
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Text(
                rule.description,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ),
            secondChild: const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Color _getFactionColor(String faction) {
    switch (faction) {
      case 'Space Marines':
        return Colors.blue[700]!;
      case 'Chaos Space Marines':
        return Colors.grey;
      case 'Tyranids':
        return Colors.purple[700]!;
      case 'Necrons':
        return Colors.green[700]!;
      case 'Dark Angels':
        return Colors.green[700]!;
      case 'Space Wolves':
        return Colors.grey[700]!;
      case 'Ultramarines':
        return Colors.indigo[700]!;
      case 'Emperors Children':
      return Colors.pink[700]!;
      case 'Death Guard':
        return Colors.lime[700]!;
      default:
        return Colors.grey[700]!;
    }
  }

  Widget _buildPlaceholderContent(String categoryName) {
    return Center(
      child: Text(
        '$categoryName content will be available soon',
        style: const TextStyle(color: Colors.white70, fontSize: 18),
      ),
    );
  }
}