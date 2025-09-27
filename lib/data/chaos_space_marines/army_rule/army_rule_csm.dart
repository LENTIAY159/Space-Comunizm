import '../../z_datachment_model/army_rule_model.dart';


const darkPacts = ArmyRule(
    name: 'Dark Pacts',
    description: '''
Если ваша Army Faction — HERETIC ASTARTES, каждый раз, когда юнит с этой способностью выбирается для стрельбы или ближнего боя, он может заключить Dark Pact. Если он это делает, сначала он должен пройти Leadership test перед применением любых эффектов этого Dark Pact: если тест провален, этот юнит получает D3 mortal wounds. Затем выберите одну из следующих способностей, которую оружие этого юнита получит до конца фазы:\n
- [LETHAL HITS]\n
- [SUSTAINED HITS 1]\n
'''
);

const cultOfTheDarkGods = ArmyRule(
    name: 'Cult of the Dark Gods',
    description: '''
Если ваша Army Faction — HERETIC ASTARTES, вы можете включить в свою армию любой из следующих юнитов, и при этом их Faction keywords заменяются на HERETIC ASTARTES:\n
KHORNE BERZERKERS (см. World Eaters)\n
RUBRIC MARINES (см. Thousand Sons)\n
PLAGUE MARINES (см. Death Guard)\n
NOISE MARINES (см. Emperor’s Children)\n
Общая стоимость в очках таких юнитов, которые вы можете включить в армию, зависит от размера сражения:\n
Incursion: до 250 очков\n
Strike Force: до 500 очков\n
Onslaught: до 750 очков\n
'''
);



List<ArmyRule> getArmyRulesCSM() {
  return [
    darkPacts,
    cultOfTheDarkGods,
  ];
}