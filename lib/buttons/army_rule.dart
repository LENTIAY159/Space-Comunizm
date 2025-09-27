import 'package:flutter/material.dart';
import '../data/z_datachment_model/army_rule_model.dart';
import '../../data/space_marines/army_rule/army_rule_sm.dart';
import '../../data/chaos_space_marines/army_rule/army_rule_csm.dart';
import '../../data/tyranids/army_rule/army_rule_tyranids.dart';
import '../../data/necrons/army_rule/army_rule_necrons.dart';
import '../data/z_datachment_model/detachment_model.dart';
import '../../data/death_guard/army_rule/army_rule_dg.dart';
import '../../data/emperors_children/army_rule/army_rule_ec.dart';

class ArmyRuleButton extends StatelessWidget {
  final String currentCategory;
  final VoidCallback onPressed;

  const ArmyRuleButton({
    super.key,
    required this.currentCategory,
    required this.onPressed,
  });

  // Функция для получения списка правил армии
  static List<ArmyRule> getArmyRules(String faction, Detachment? detachment) {
    List<ArmyRule> rules = [];

    try {
      switch (faction) {
        case 'Space Marines':
          rules = getArmyRulesSM();
          break;
        case 'Dark Angels':
          rules = getArmyRulesSM();
          break;
        case 'Space Wolves':
          rules = getArmyRulesSM();
          break;
        case 'Ultramarines':
          rules = getArmyRulesSM();
          break;
        case 'Chaos Space Marines':
          rules = getArmyRulesCSM();
          break;
        case 'Tyranids':
          rules = getArmyRulesTyranids();
          break;
        case 'Necrons':
          rules = getArmyRulesNecrons();
          break;
        case 'Emperor’s Children':
          rules = getArmyRulesEC();
          break;
        case 'Death Guard':
          rules = getArmyRulesDG();
          break;
        default:
          rules = [];
      }
    } catch (e) {
      rules = [];
    }

    // Добавляем правила детачмента
    if (detachment != null) {
      for (var rule in detachment.additionalRules) {
        rules.add(ArmyRule(
          name: rule.name,
          description: rule.description,
        ));
      }
    }

    return rules;
  }

  @override
  Widget build(BuildContext context) {
    final isSelected = currentCategory == 'Army Rule';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
            colors: [Colors.black, Colors.red[500]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
              : null,
          color: isSelected ? null : Colors.grey[850],
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(color: Colors.red[400]!, width: 1.5)
              : Border.all(color: Colors.grey[700]!, width: 1),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.red.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ]
              : null,
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.shield_outlined,
                size: 18,
                color: isSelected ? Colors.white : Colors.grey[300],
              ),
              const SizedBox(width: 8),
              Text(
                'Army Rule',
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}