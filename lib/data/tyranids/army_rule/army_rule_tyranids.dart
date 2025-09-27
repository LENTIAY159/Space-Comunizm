// army_rule_tyranids.dart
import '../../z_datachment_model/army_rule_model.dart';

const synapse = ArmyRule(
    name: 'Synapse',
    description: '''
Если ваша Army Faction — TYRANIDS, пока отряд TYRANIDS из вашей армии находится в пределах 6" от одной или более дружественных моделей с ключевым словом SYNAPSE, считается, что этот отряд находится в Synapse Range этой модели и вашей армии. Пока отряд TYRANIDS из вашей армии находится в Synapse Range вашей армии:
• Каждый раз, когда этот отряд проходит тест Battle-shock, выполняйте этот тест с 3D6 вместо 2D6.
• Каждый раз, когда модель в этом отряде совершает атаку в ближнем бою, добавляйте 1 к характеристике Strength этой атаки.
'''
);

const shadowInTheWarp = ArmyRule(
    name: 'Shadow in the Warp',
    description: '''
Если ваша Army Faction — TYRANIDS, один раз за битву, в фазу Command любого игрока, если один или более отрядов из вашей армии с этой способностью находятся на поле боя, вы можете высвободить Shadow in the Warp. Когда вы это делаете, каждый вражеский отряд на поле боя должен пройти тест Battle-shock. Каждый раз, когда вражеский отряд проходит такой тест Battle-shock, если он находится в пределах 6" от одной или более моделей SYNAPSE из вашей армии, вычитайте 1 из этого теста.
'''
);


/// Функция для создания правила Synapse с дополнительным текстом
ArmyRule synapseWith(String additionalText) {
  return synapse.withAdditionalText(additionalText);
}

/// Функция для создания правила Shadow in the Warp с дополнительным текстом
ArmyRule shadowInTheWarpWith(String additionalText) {
  return shadowInTheWarp.withAdditionalText(additionalText);
}

/// Для обратной совместимости - можно вызывать правила как функции
ArmyRule Function(String) get synapseFunction => synapseWith;
ArmyRule Function(String) get shadowInTheWarpFunction => shadowInTheWarpWith;

List<ArmyRule> getArmyRulesTyranids() {
  return [
    synapse,
    shadowInTheWarp,
  ];
}