import '../../z_datachment_model/army_rule_model.dart';


const oathOfMoment = ArmyRule(
    name: 'Oath of Moment',
    description: '''
Если ваша Army Faction — ADEPTUS ASTARTES, в начале вашей Command фазы выберите один юнит из армии противника. До начала вашей следующей Command фазы этот вражеский юнит является вашей целью Oath of Moment.
Каждый раз, когда модель с этой способностью совершает атаку по вашей цели Oath of Moment:
• Вы можете перебросить бросок на попадание.
• Если вы используете Codex: Space Marines Detachment и в вашей армии нет юнитов с ключевыми словами BLACK TEMPLARS, BLOOD ANGELS, DARK ANGELS, DEATHWATCH или SPACE WOLVES, добавляйте 1 к броску на ранение.
'''
);

const spaceMarineChapters = ArmyRule(
    name: 'Space Marine Chapters',
    description: '''
Если ADEPTUS ASTARTES юнит имеет второй фракционный ключевое слово в своём даташите, это ключевое слово является названием Чаптера этого юнита. Например, MARNEUS CALGAR имеет ключевые слова ADEPTUS ASTARTES и ULTRAMARINES, следовательно, он из Чаптера Ultramarines.
Вы не можете включать в армию юниты более чем из одного Чаптера.
Если ваша армия включает один или более BLACK TEMPLARS юнитов, она не может включать ADEPTUS ASTARTES PSYKER моделей, а также не может включать следующие модели, если у них нет ключевого слова Black Templars: GLADIATOR LANCER; GLADIATOR REAPER; GLADIATOR VALIANT; IMPULSOR; REPULSOR; REPULSOR EXECUTIONER.
Если ваша армия включает один или более DEATHWATCH юнитов, она не может включать следующие юниты: DEVASTATOR SQUAD; SCOUT SQUAD; TACTICAL SQUAD.
Если ваша армия включает один или более SPACE WOLVES юнитов, она не может включать следующие юниты: APOTHECARY; DEVASTATOR SQUAD; TACTICAL SQUAD.
'''
);

const deathwatch = ArmyRule(
    name: 'Deathwatch',
    description: '''
Ваша армия может включать ADEPTUS ASTARTES DEATHWATCH юниты, но не может включать ADEPTUS ASTARTES юниты из других Чаптеров.
За исключением KILL TEAM CASSIUS (см. Legends: Agents of the Imperium), ваша армия не может включать AGENTS OF THE IMPERIUM DEATHWATCH юниты.
Ваша армия не может включать следующие юниты: ASSAULT SQUAD; ASSAULT SQUAD WITH JUMP PACKS; ATTACK BIKE SQUAD; DEVASTATOR SQUAD; LAND SPEEDER STORM; RELIC TERMINATOR SQUAD; SCOUT BIKE SQUAD; SCOUT SQUAD; SCOUT SNIPER SQUAD; TACTICAL SQUAD; TERMINATOR ASSAULT SQUAD; TERMINATOR SQUAD.
'''
);


List<ArmyRule> getArmyRulesSM() {
  return [
    oathOfMoment,
    spaceMarineChapters,
    deathwatch,
  ];
}