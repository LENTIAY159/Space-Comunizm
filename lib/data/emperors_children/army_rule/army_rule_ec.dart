import '../../z_datachment_model/army_rule_model.dart';

const thrillSeekers = ArmyRule(
  name: 'Thrill Seekers',
  description: '''
Если ваша Army Faction - EMPEROR'S CHILDREN, этот юнит может стрелять и объявлять атаку в ходу, в котором он выполнил Advanced или Fell Back, но при этом:
- Он не может атаковать юнит, с которым находился в пределах Engagement Range в начале хода.
- Он не может атаковать юнит, который был целью атаки или charge другого юнита в эту фазу.
''',
);

const pactOfExcess = ArmyRule(
  name: 'Pact of Excess',
  description: '''
При формировании вашей армии, если не указано иное, вы не можете выбрать LEGIONS OF EXCESS в качестве вашей Army Faction.
''',
);


List<ArmyRule> getArmyRulesEC() {
  return[
    thrillSeekers,
    pactOfExcess,
  ];
}