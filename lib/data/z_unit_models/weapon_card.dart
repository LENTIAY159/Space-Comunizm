import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'weapon_model.dart';
import 'core_abilities.dart';

class WeaponCard extends StatelessWidget {
  final Weapon weapon;
  final bool isRanged;

  const WeaponCard({
    super.key,
    required this.weapon,
    required this.isRanged,
  });

  void _showWeaponAbilityDialog(BuildContext context, dynamic rule, Map<String, dynamic>? parameters) {
    WeaponAbilityKey abilityKey;
    if (rule is WeaponAbilityKey) {
      abilityKey = rule;
    } else if (rule is WeaponAbility) {
      abilityKey = rule.key;
    } else {
      debugPrint('Unexpected rule type: ${rule.runtimeType}');
      return;
    }

    final description = WeaponAbilityConverter.getDescription(abilityKey, parameters);
    final displayName = WeaponAbilityConverter.toReadable(abilityKey, parameters);

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
              side: BorderSide(color: Colors.black, width: 2),
            ),
            title: Text(
              displayName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            content: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Text(
                  description,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text(
                  'Close',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[800],
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              weapon.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),

            // Если профилей больше одного — добавляем заголовок
            if (weapon.profiles.length > 1)
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  'Profiles:',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),
              ),

            // Отрисовываем профили с обводкой
            ...weapon.profiles.map((profile) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  border: Border.all(color: Colors.white24, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _buildProfileTable(context, profile),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTable(BuildContext context, WeaponProfile profile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (weapon.profiles.length > 1 && profile.name != null) ...[
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              profile.name!,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.lightBlueAccent,
                fontSize: 14,
              ),
            ),
          ),
        ],

        Table(
          columnWidths: const {
            0: FlexColumnWidth(2.5),
            1: FlexColumnWidth(1.5),
            2: FlexColumnWidth(1.2),
            3: FlexColumnWidth(1.2),
            4: FlexColumnWidth(1.2),
            5: FlexColumnWidth(1.5),
          },
          children: [
            TableRow(
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(4),
              ),
              children: [
                _buildHeaderCell('RANGE'),
                _buildHeaderCell('A'),
                _buildHeaderCell(isRanged ? 'BS' : 'WS'),
                _buildHeaderCell('S'),
                _buildHeaderCell('AP'),
                _buildHeaderCell('D'),
              ],
            ),
            TableRow(
              children: [
                _buildDataCell(isRanged ? profile.range : 'Melee'),
                _buildDataCell(profile.attacks),
                _buildDataCell(profile.hit),
                _buildDataCell(profile.strength),
                _buildDataCell(profile.ap),
                _buildDataCell(profile.damage),
              ],
            ),
          ],
        ),

        if (profile.specialRules.isNotEmpty) ...[
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: profile.specialRules.map((rule) {
              final parameters = profile.specialRuleDetails?[rule];

              WeaponAbilityKey abilityKey;
              if (rule is WeaponAbilityKey) {
                abilityKey = rule;
              } else if (rule is WeaponAbility) {
                abilityKey = rule.key;
              } else {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.red, width: 1),
                  ),
                  child: Text(
                    'Unknown: ${rule.toString()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }

              final displayName = WeaponAbilityConverter.toReadable(abilityKey, parameters);

              return GestureDetector(
                onTap: () => _showWeaponAbilityDialog(context, rule, parameters),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  child: Text(
                    displayName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ],
    );
  }

  Widget _buildHeaderCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildDataCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
