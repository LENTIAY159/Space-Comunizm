import 'mission_model.dart';

// -------------------- MISSION RULES (individual constants) --------------------
const chosenBattlefield = MissionRule(
  id: 'chosen_battlefield',
  name: 'CHOSEN BATTLEFIELD',
  short: '''В этой миссии маркеры целей не размещаются так, как показано на вытянутой карте Deployment. Вместо этого игроки делают бросок в начале этапа Place Objective Markers, затем поочередно устанавливают маркеры целей по одному за раз, начиная с победителя броска.

Один маркер цели должен быть размещен полностью в пределах каждой зоны развертывания, а оставшиеся маркеры целей должны быть размещены полностью в пределах No Man's Land, как показано на вытянутой карте Deployment. Маркеры целей должны быть размещены на расстоянии более 6" от любого края поля боя и более 9" от всех других маркеров целей.

Если по какой-либо причине невозможно установить маркер цели, как описано выше, он не размещается на поле боя.

Если какие-либо правила требуют от игроков установить дополнительные маркеры целей (например, Hidden Supplies) во время этапа Place Objective Markers, игроки устанавливают их, как описано на этой карте Mission Rule.

Если какие-либо правила указывают игрокам удалить один или несколько маркеров целей, делайте это после установки их всех.''',
);

const chillingRain = MissionRule(
  id: 'chilling_rain',
  name: 'CHILLING RAIN',
  short: '''В этой миссии никакие дополнительные правила миссии не применяются.''',
);

const sweepAndClear = MissionRule(
  id: 'sweep_and_clear',
  name: 'SWEEP AND CLEAR',
  short: '''В этой миссии, если игрок контролирует маркер цели в конце своей фазы Command, этот маркер цели остается под его контролем, даже если у него нет моделей в пределах досягаемости от него, если только его противник не контролирует его в конце любой последующей фазы Command.''',
);

const hiddenSupplies = MissionRule(
  id: 'hidden_supplies',
  name: 'HIDDEN SUPPLIES',
  short: '''В этой миссии игроки должны установить один дополнительный маркер цели в No Man's Land.

Если правило миссии Chosen Battlefield также не действует, перед установкой этого нового маркера цели игроки должны сначала переместить маркер цели в центре поля боя на 6" прямо в направлении одного из углов поля боя (если No Man's Land касается любого из углов поля боя, вы должны переместить маркер цели в направлении одного из этих углов). Затем игроки устанавливают новый маркер цели на 6" от центра поля боя в направлении диагонально противоположного угла поля боя к ранее перемещенному маркеру цели.''',
);

const minefields = MissionRule(
  id: 'minefields',
  name: 'MINEFIELDS',
  short: '''В этой миссии каждый раз, когда для юнита делается бросок Advance равный 6, этот юнит получает 1 mortal wound.''',
);

const targetsOfOpportunity = MissionRule(
  id: 'targets_of_opportunity',
  name: 'TARGETS OF OPPORTUNITY',
  short: '''В этой миссии, если игрок использует Tactical Missions, то каждый раз, когда этот игрок определяет, какие карты Secondary Mission активны для него, если у него менее 3 активных карт Secondary Mission, этот игрок тянет из своей колоды Secondary Mission до тех пор, пока у него не будет 3 карт Secondary Mission.

В этой миссии, если игрок использует Fixed Missions, то в дополнение к 2 картам Fixed Mission, этот игрок также будет тянуть карты из своей колоды Secondary Mission во время битвы. В конце этапа Select Secondary Missions этот игрок должен взять свою колоду Secondary Mission, удалить все карты Fixed Mission, которые он не выбрал в начале этого этапа, затем перемешать оставшиеся карты. Затем, в начале каждой фазы Command этого игрока, если у этого игрока менее 3 активных карт Secondary Mission (включая его карты Fixed Mission), он тянет из своей колоды Secondary Mission до тех пор, пока у него не будет 3 карт Secondary Mission. Этот игрок имеет доступ к стратагеме New Orders и может потратить CP для ее использования после тягу карт Secondary Mission, если пожелает (помните, что карты Fixed Mission не могут быть отброшены по любой причине).''',
);

const scramblerFields = MissionRule(
  id: 'scrambler_fields',
  name: 'SCRAMBLER FIELDS',
  short: '''В этой миссии:
Юниты игроков со способностью Infiltrators не могут быть установлены в пределах досягаемости маркера цели, который находится либо в No Man's Land, либо в зоне развертывания их противника.
Юниты игроков со способностью Scouts, которые делают движение перед началом первого хода, не могут закончить это движение в пределах досягаемости маркера цели, который находится либо в No Man's Land, либо в зоне развертывания их противника.
Если используется какое-либо правило для передислокации юнита, это правило не может быть использовано для установки этого юнита в пределах досягаемости маркера цели в No Man's Land.
Когда юниты Reserves и Strategic Reserves игрока устанавливаются на поле боя, они не могут быть установлены в пределах досягаемости маркера цели, который находится либо в No Man's Land, либо в зоне развертывания их противника.''',
);

const delayedReserves = MissionRule(
  id: 'delayed_reserves',
  name: 'DELAYED RESERVES',
  short: '''В этой миссии, до начала третьего боевого раунда, каждый раз, когда юнит Reserves или Strategic Reserves хочет прибыть на поле боя, контролирующий игрок должен сделать бросок Reserves для него. Для этого этот игрок бросает один D6: на 3+ этот юнит прибывает на поле боя; иначе бросок Reserves проваливается и этот юнит не прибывает в этом ходу.''',
);

const maelstromOfBattle = MissionRule(
  id: 'maelstrom_of_battle',
  name: 'MAELSTROM OF BATTLE',
  short: '''В этой миссии перемешайте оставшиеся карты Mission Rule вместе перед тягом 2 новых карт Mission Rule.

Если любая из этих новых карт Mission Rule - Chilling Rain, отбросьте эту карту Mission Rule и вытяните 2 дополнительные новые карты Mission Rule (в общей сложности 3 новые карты Mission Rule).

Примените все вытянутые карты Mission Rule к битве.''',
);

const supplyLines = MissionRule(
  id: 'supply_lines',
  name: 'SUPPLY LINES',
  short: '''В этой миссии, если игрок контролирует маркер цели в своей собственной зоне развертывания в начале своей фазы Command, он бросает один D6: на 4+ этот игрок получает 1CP.''',
);

const secretIntel = MissionRule(
  id: 'secret_intel',
  name: 'SECRET INTEL',
  short: '''В этой миссии, в каждой фазе Command игрока, первый раз, когда этот игрок тянет карты Secondary Mission в этой фазе, этот игрок может вытянуть одну дополнительную карту Secondary Mission, а затем отбросить одну из своих активных карт Secondary Mission.''',
);

const voxStatic = MissionRule(
  id: 'vox_static',
  name: 'VOX STATIC',
  short: '''В этой миссии стратагемы Command Re-roll и New Orders стоят 2CP для использования.''',
);

// -------------------- PRIMARY MISSIONS (individual constants) --------------------
const takeAndHold = PrimaryMission(
  id: 'take_and_hold',
  name: 'TAKE AND HOLD',
  description: '''Во втором, третьем и четвертом боевых раундах:
В конце каждой фазы Command игрок, чей ход идет, получает 5VP за каждый контролируемый им маркер цели (до 15VP за ход).

В пятом боевом раунде:
Игрок, у которого первый ход, получает VP как описано выше.
Игрок, у которого второй ход, получает VP как описано выше, но делает это в конце своего хода вместо конца своей фазы Command.''',
);

const scorchedEarth = PrimaryMission(
  id: 'scorched_earth',
  name: 'SCORCHED EARTH',
  description: '''Начиная со второго боевого раунда, в каждой фазе Shooting игрока, игрок, чей ход идет, может выбрать один юнит из своей армии, который не является Battle-shocked и имеет право стрелять. До конца этого хода этот юнит не имеет права стрелять или объявлять атаку. В начале фазы Command контролирующего игрока в следующем ходу, если этот юнит находится в пределах 1" от маркера цели, который контролирует игрок, чей ход идет, этот маркер цели сжигается и удаляется с поля боя.

Во втором, третьем и четвертом боевых раундах:
В конце каждой фазы Command игрок, чей ход идет, получает 5VP за каждый контролируемый им маркер цели (до 10VP за ход).

В пятом боевом раунде:
Игрок, у которого первый ход, получает VP как описано выше.
Игрок, у которого второй ход, получает VP как описано выше, но делает это в конце своего хода вместо конца своей фазы Command.

В конце битвы:
Каждый игрок получает 5VP, если один или несколько маркеров целей в No Man's Land были сожжены юнитом из его армии, и 10VP, если маркер цели в зоне развертывания его противника был сожжен.''',
);

const purgeTheFoe = PrimaryMission(
  id: 'purge_the_foe',
  name: 'PURGE THE FOE',
  description: '''Во втором, третьем и четвертом боевых раундах:
В конце каждой фазы Command игрок, чей ход идет, получает 4VP, если он контролирует один или несколько маркеров целей, и дополнительные 4VP, если он контролирует больше маркеров целей, чем контролирует его противник.

В пятом боевом раунде:
Игрок, у которого первый ход, получает VP как описано выше.
Игрок, у которого второй ход, получает VP как описано выше, но делает это в конце своего хода вместо конца своей фазы Command.

В конце каждого боевого раунда:
В конце боевого раунда каждый игрок получает 4VP, если один или несколько вражеских юнитов были уничтожены в этом боевом раунде, и дополнительные 4VP, если больше вражеских юнитов, чем дружественных юнитов, было уничтожено в этом боевом раунде.

Обратите внимание, что юнит может, если он возвращается на поле боя по любой причине, потенциально способствовать этой Primary Mission несколько раз (при условии, что он возвращается и впоследствии уничтожается несколько раз).''',
);

const sitesOfPower = PrimaryMission(
  id: 'sites_of_power',
  name: 'SITES OF POWER',
  description: '''Маркеры целей в No Man's Land являются местами силы. В конце каждой фазы Command игрок, чей ход идет, наделяет силой все места силы, которые он контролирует и которые имеют одну или несколько моделей CHARACTER из его армии в пределах досягаемости; каждое место силы остается наделенным силой этим игроком, пока одна или несколько его моделей CHARACTER остаются в пределах досягаемости от него.

Во втором, третьем и четвертом боевых раундах:
В конце каждой фазы Command игрока, игрок, чей ход идет, получает VP следующим образом (до 15VP за ход):
3VP за каждый контролируемый им маркер цели.
3VP за каждое место силы, которое он наделил силой.
Обратите внимание, что это накопительно, поэтому игрок, который контролирует один маркер цели, который он также наделил силой, получит 6VP в этом ходу.

В пятом боевом раунде:
Игрок, у которого первый ход, получает VP как описано выше.
Игрок, у которого второй ход, получает VP как описано выше, но делает это в конце своего хода вместо конца своей фазы Command.''',
);

const theRitual = PrimaryMission(
  id: 'the_ritual',
  name: 'THE RITUAL',
  description: '''При установке поля боя удалите все маркеры целей в No Man's Land, кроме того, который ближе всего к центру поля боя.

В каждой фазе Shooting игрока, игрок, чей ход идет, может выбрать один юнит из своей армии, который не является Battle-shocked и имеет право стрелять. До конца этого хода этот юнит не имеет права стрелять или объявлять атаку. В конце этого хода игрок, чей ход идет, может установить один маркер цели полностью в пределах No Man's Land и в пределах 1" от этого юнита, при условии, что он может быть установлен точно на 9" от одного другого маркера цели и не в пределах 6" от любого другого маркера цели.

Во втором, третьем и четвертом боевых раундах:
В конце каждой фазы Command игрок, чей ход идет, получает 5VP за каждый маркер цели в No Man's Land, который он контролирует (до 15VP за ход).

В пятом боевом раунде:
Игрок, у которого первый ход, получает VP как описано выше.
Игрок, у которого второй ход, получает VP как описано выше, но делает это в конце своего хода вместо конца своей фазы Command.''',
);

const priorityTargets = PrimaryMission(
  id: 'priority_targets',
  name: 'PRIORITY TARGETS',
  description: '''Во втором, третьем, четвертом и пятом боевых раундах:
В конце каждой фазы Command игрок, чей ход идет, получает 5VP за каждый контролируемый им маркер цели (до 10VP за ход).

В конце битвы:
Каждый игрок получает 5VP за каждый контролируемый им маркер цели (до 15VP на игрока).''',
);

const supplyDrop = PrimaryMission(
  id: 'supply_drop',
  name: 'SUPPLY DROP',
  description: '''В начале битвы игроки случайным образом выбирают два разных маркера целей в No Man's Land: первый выбранный является целью Alpha, второй выбранный является целью Omega. В начале четвертого боевого раунда цель Alpha удаляется с поля боя. В начале пятого боевого раунда все маркеры целей в No Man's Land, кроме цели Omega, также удаляются.

Во втором и третьем боевых раундах:
В конце каждой фазы Command игрок, чей ход идет, получает 5VP за каждый контролируемый им маркер цели в No Man's Land.

В четвертом боевом раунде:
В конце каждой фазы Command игрок, чей ход идет, получает 8VP за каждый контролируемый им маркер цели в No Man's Land.

В пятом боевом раунде:
Игрок, у которого первый ход, получает 15VP в конце своей фазы Command, если он контролирует маркер цели в No Man's Land.
Игрок, у которого второй ход, получает 15VP в конце своего хода, если он контролирует маркер цели в No Man's Land.''',
);

const deployServoSkulls = PrimaryMission(
  id: 'deploy_servo_skulls',
  name: 'DEPLOY SERVO-SKULLS',
  description: '''Маркеры целей, которые начинают битву в No Man's Land, являются servo-skulls. В конце каждого хода каждый из этих маркеров целей может быть перемещен до 6" в любом направлении игроком, который его контролирует. При перемещении маркеров целей они не могут закончить это движение поверх любого другого маркера цели или модели, или внутри непроходимых частей элементов местности (таких как стены руин).

Во втором, третьем, четвертом и пятом боевых раундах:
В конце каждого хода игрок, чей ход идет, получает VP следующим образом:
2VP за каждый servo-skull, который полностью находится в пределах 12" от зоны развертывания их противника.
5VP за каждый servo-skull, который полностью находится в пределах 6" от зоны развертывания их противника.
8VP за каждый servo-skull, который полностью находится в зоне развертывания их противника.

Обратите внимание, что эти условия не являются накопительными; если применяется более одного, игрок, чей ход идет, получает применимое условие, которое несет наивысшую награду VP.''',
);

const vitalGround = PrimaryMission(
  id: 'vital_ground',
  name: 'VITAL GROUND',
  description: '''Если вы вытягиваете это и карту Mission Rule Hidden Supplies, отбросьте эту карту и вытяните новую карту Primary Mission.

После установки поля боя удалите маркер цели в No Man's Land, который ближе всего к центру поля боя.

Во втором, третьем и четвертом боевых раундах:
В конце каждой фазы Command игрок, чей ход идет, получает VP следующим образом:
Если он контролирует маркер цели в своей собственной зоне развертывания, он получает 2VP.
За каждый маркер цели в No Man's Land, который он контролирует, он получает 5VP.
Если он контролирует маркер цели в зоне развертывания своего противника, он получает 6VP.

В пятом боевом раунде:
Игрок, у которого первый ход, получает VP как описано выше.
Игрок, у которого второй ход, получает VP как описано выше, но делает это в конце своего хода вместо конца своей фазы Command.''',
);

// -------------------- SECONDARY MISSIONS (individual constants) --------------------
const extendBattleLines = SecondaryMission(
  id: 'extend_battle_lines',
  name: 'EXTEND BATTLE LINES',
  description: '''В конце вашего хода, если вы контролируете один или несколько маркеров целей в вашей собственной зоне развертывания и вы также контролируете один или несколько маркеров целей в No Man's Land, эта Secondary Mission выполнена и вы получаете 5VP.

Если у вас остался только один юнит в вашей армии, то эта Secondary Mission выполняется в конце вашего хода, если этот юнит контролирует один маркер цели в No Man's Land, но в этом случае вы получаете 2VP вместо 5VP.''',
);

const behindEnemyLines = SecondaryMission(
  id: 'behind_enemy_lines',
  name: 'BEHIND ENEMY LINES',
  description: '''В конце вашего хода, если два или более юнитов из вашей армии (исключая AIRCRAFT) полностью находятся в зоне развертывания вашего противника, эта Secondary Mission выполнена и вы получаете 4VP (или 5VP, если вы используете Tactical Missions).

Если в конце вашего хода только один юнит из вашей армии (исключая AIRCRAFT) полностью находится в зоне развертывания вашего противника, то эта Secondary Mission все еще выполнена, но в этом случае вы получаете 3VP вместо 4VP (или вместо 5VP).''',
);

const assassination = SecondaryMission(
  id: 'assassination',
  name: 'ASSASSINATION',
  description: '''Если вы используете Fixed Missions, то пока эта Secondary Mission активна, каждый раз, когда вражеская модель CHARACTER уничтожается, вы получаете 4VP.

Если вы используете Tactical Missions, то в конце хода, если выполнено любое из условий ниже, эта Secondary Mission выполнена и вы получаете 5VP:
Один или несколько вражеских юнитов CHARACTER были уничтожены во время этого хода.
Все юниты CHARACTER из Army Roster вашего противника были уничтожены во время битвы.
Обратите внимание, что если вы используете Tactical Missions, эта Secondary Mission выполнена, даже если такой юнит был уничтожен, а затем впоследствии воскрешен по любой причине.''',
);

const bringItDown = SecondaryMission(
  id: 'bring_it_down',
  name: 'BRING IT DOWN',
  description: '''Пока эта Secondary Mission активна, каждый раз, когда вражеская модель MONSTER или VEHICLE уничтожается, вы получаете 2VP и дополнительные 1VP за каждое из условий ниже, которые выполнены (все накопительные):
Уничтоженная модель имела характеристику Wounds 10+.
Уничтоженная модель имела характеристику Wounds 15+.
Уничтоженная модель имела характеристику Wounds 20+.
Обратите внимание, что VP начисляются, даже если такая модель уничтожена, а затем впоследствии воскрешена по любой причине. Если вы получаете любые VP от этой Secondary Mission во время хода, то в конце этого хода эта Secondary Mission выполнена.

Если вы используете Tactical Missions, то когда эта Secondary Mission выполнена, вы получаете дополнительные 1VP. Однако, если вы используете Tactical Missions, вы не можете получить более 8VP в общей сложности от этой Secondary Mission.''',
);

const engageOnAllFronts = SecondaryMission(
  id: 'engage_on_all_fronts',
  name: 'ENGAGE ON ALL FRONTS',
  description: '''В конце вашего хода, если у вас есть один или несколько квалифицирующихся юнитов (см. ниже) из вашей армии, полностью находящихся в трех или более разных четвертях стола, и эти юниты находятся более чем в 3" от любой другой четверти стола, эта Secondary Mission выполнена и вы получаете 4VP, если у вас есть квалифицирующиеся юниты в четырех разных четвертях стола, или 2VP, если у вас есть квалифицирующиеся юниты в трех разных четвертях стола.

Пока юнит является Battle-shocked, он не является квалифицирующимся юнитом.

Если, когда вы тянете эту карту Secondary Mission, у вас остался только один или два квалифицирующихся юнита в вашей армии, вы можете отбросить эту карту Secondary Mission и вытянуть новую карту Secondary Mission.

Если вы используете Tactical Missions, то когда эта Secondary Mission выполнена, вы получаете дополнительные 1VP (максимум 5VP).''',
);

const stormHostileObjective = SecondaryMission(
  id: 'storm_hostile_objective',
  name: 'STORM HOSTILE OBJECTIVE',
  description: '''В конце вашего хода, если выполнено любое из условий ниже, эта Secondary Mission выполнена и вы получаете 4VP, если используете Fixed Missions, или 5VP, если используете Tactical Missions:
Вы контролируете один или несколько маркеров целей, которые контролировались вашим противником в начале вашего хода.
Ваш противник не контролировал никаких маркеров целей в начале вашего хода и вы контролируете один или несколько маркеров целей, которые вы не контролировали в начале вашего хода.
Эта Secondary Mission не может быть выполнена в течение первого боевого раунда; если вы случайно вытянули эту карту Secondary Mission в течение первого боевого раунда, вытяните новую карту Secondary Mission и перемешайте эту карту Secondary Mission обратно в вашу колоду Secondary Mission.''',
);

const cleanse = SecondaryMission(
  id: 'cleanse',
  name: 'CLEANSE',
  description: '''В вашей фазе Shooting вы можете выбрать один или несколько юнитов из вашей армии, которые не являются Battle-shocked и имеют право стрелять. До конца вашего хода выбранные вами юниты не имеют права стрелять или объявлять атаку.

В конце вашего хода каждый маркер цели, который не находится в вашей зоне развертывания, который вы контролируете и который имеет один или несколько из этих выбранных юнитов в пределах досягаемости, очищается вашей армией.

Если один или несколько маркеров целей очищены вашей армией в этом ходу, эта Secondary Mission выполнена и вы получаете количество VP в зависимости от количества маркеров целей, очищенных вашей армией в этом ходу, следующим образом:
1 очищенный маркер цели = 2VP, если вы используете Fixed Missions, или 3VP, если вы используете Tactical Missions.
2 или более очищенных маркера целей = 4VP, если вы используете Fixed Missions, или 5VP, если вы используете Tactical Missions.''',
);

const deployTeleportHomer = SecondaryMission(
  id: 'deploy_teleport_homer',
  name: 'DEPLOY TELEPORT HOMER',
  description: '''В вашей фазе Shooting вы можете выбрать один юнит из вашей армии, который не является Battle-shocked и имеет право стрелять. До конца вашего хода этот юнит не имеет права стрелять или объявлять атаку.

В конце вашего хода, если этот юнит находится в зоне развертывания вашего противника или в пределах 6" от центра поля боя, он размещает teleport homer в этом месте, эта Secondary Mission выполнена и вы получаете количество VP в зависимости от того, где был размещен teleport homer, следующим образом:
Центр поля боя = 3VP.
Зона развертывания противника = 4VP, если вы используете Fixed Missions, или 5VP, если вы используете Tactical Missions.''',
);

const investigateSignals = SecondaryMission(
  id: 'investigate_signals',
  name: 'INVESTIGATE SIGNALS',
  description: '''В вашей фазе Shooting вы можете выбрать один или несколько юнитов из вашей армии, которые не являются Battle-shocked и имеют право стрелять. До конца вашего хода выбранные вами юниты не имеют права стрелять или объявлять атаку.

В конце вашего хода каждый угол поля боя, который имеет один или несколько из этих выбранных юнитов полностью в пределах 9" от него, сканируется вашей армией.

Если один или несколько углов сканируются вашей армией, эта Secondary Mission выполнена и вы получаете 2VP за каждый угол, отсканированный вашей армией в этом ходу.''',
);

const noPrisoners = SecondaryMission(
  id: 'no_prisoners',
  name: 'NO PRISONERS',
  description: '''Пока эта Secondary Mission активна, каждый раз, когда вражеский юнит уничтожается, вы получаете 2VP (максимум 5VP).

Обратите внимание, что VP начисляются, даже если такой юнит уничтожен, а затем впоследствии воскрешен по любой причине. Если вы получаете любые VP от этой Secondary Mission во время хода, то в конце этого хода эта Secondary Mission выполнена.''',
);

const defendStronghold = SecondaryMission(
  id: 'defend_stronghold',
  name: 'DEFEND STRONGHOLD',
  description: '''В конце хода вашего противника или в конце битвы (что наступит раньше), если вы контролируете один или несколько маркеров целей в вашей собственной зоне развертывания, эта Secondary Mission выполнена и вы получаете 3VP.

Эта Secondary Mission не может быть выполнена в течение первого боевого раунда; если вы тянете эту карту Secondary Mission в течение первого боевого раунда, вытяните новую карту Secondary Mission и перемешайте эту карту Secondary Mission обратно в вашу колоду Secondary Mission.''',
);

const overwhelmingForce = SecondaryMission(
  id: 'overwhelming_force',
  name: 'OVERWHELMING FORCE',
  description: '''Пока эта Secondary Mission активна, каждый раз, когда вражеский юнит, который начинал ход в пределах досягаемости маркера цели, уничтожается, вы получаете 3VP (максимум 5VP).

Обратите внимание, что VP начисляются, даже если такой юнит уничтожен, а затем впоследствии воскрешен по любой причине. Если вы получаете любые VP от этой Secondary Mission во время хода, то в конце этого хода эта Secondary Mission выполнена.''',
);

const secureNoMansLand = SecondaryMission(
  id: 'secure_no_mans_land',
  name: 'SECURE NO MANS LAND',
  description: '''В конце вашего хода, если вы контролируете два или более маркера целей в No Man's Land, эта Secondary Mission выполнена и вы получаете 5VP.

Если в конце вашего хода вы контролируете только один маркер цели в No Man's Land, эта Secondary Mission все еще выполнена, но в этом случае вы получаете 2VP вместо 5VP.''',
);

const areaDenial = SecondaryMission(
  id: 'area_denial',
  name: 'AREA DENIAL',
  description: '''В конце вашего хода, если один или несколько юнитов из вашей армии (исключая Battle-shocked юниты) полностью находятся в пределах 6" от центра поля боя, и нет вражеских юнитов полностью в пределах 6" от центра поля боя, эта Secondary Mission выполнена и вы получаете 5VP.

Если в конце вашего хода есть один или несколько вражеских юнитов полностью в пределах 6" от центра поля боя, но нет вражеских юнитов в пределах 3" от центра поля боя, то эта Secondary Mission все еще выполнена, но в этом случае вы получаете 3VP вместо 5VP.''',
);

const aTemptingTarget = SecondaryMission(
  id: 'a_tempting_target',
  name: 'A TEMPTING TARGET',
  description: '''Когда эта карта Secondary Mission тянется, ваш противник должен выбрать один маркер цели в No Man's Land.

В конце вашего хода, если вы контролируете этот выбранный маркер цели, эта Secondary Mission выполнена и вы получаете 5VP.''',
);

const captureEnemyOutpost = SecondaryMission(
  id: 'capture_enemy_outpost',
  name: 'CAPTURE ENEMY OUTPOST',
  description: '''В конце вашего хода, если вы контролируете один или несколько маркеров целей в зоне развертывания вашего противника, эта Secondary Mission выполнена и вы получаете 8VP.''',
);

// -------------------- GAMBITS (individual constants) --------------------
const proceedAsPlanned = Gambit(
  id: 'proceed_as_planned',
  name: 'PROCEED AS PLANNED',
  description: '''Если вы выбираете эту карту Gambit, вы решили не предпринимать попытку gambit.

До конца битвы вы продолжаете получать VP от вашей Primary Mission.''',
);

const delayingTactics = Gambit(
  id: 'delaying_tactics',
  name: 'DELAYING TACTICS',
  description: '''ОПРЕДЕЛИТЬ ЦЕЛЬ ОТВЛЕЧЕНИЯ: Ваша цель Отвлечения будет равна половине количества вражеских юнитов, которые находятся в пределах Engagement Range от одного или нескольких юнитов из вашей армии (округляя в большую сторону) в конце вашего пятого хода. Если ваша цель Отвлечения меньше 4, она увеличивается до 4.

ОТВЛЕЧЬ ВРАЖЕСКИЕ ЮНИТЫ: В конце вашего пятого хода бросьте один D6 за каждый вражеский юнит, который находится в пределах Engagement Range от одного или нескольких юнитов из вашей армии. Добавьте 1 к результату, если этот вражеский юнит является Battle-shocked, и вычтите 1, если один или несколько юнитов из вашей армии, которые находятся в пределах Engagement Range от него, являются Battle-shocked. На 4+ этот вражеский юнит был успешно задержан.

ОПРЕДЕЛИТЬ УСПЕХ GAMBIT: Если количество вражеских юнитов, которые были успешно задержаны, больше или равно вашей цели Отвлечения, этот Gambit успешно завершен и вы получаете 30VP.''',
);

const emergencyEvacuation = Gambit(
  id: 'emergency_evacuation',
  name: 'EMERGENCY EVACUATION',
  description: '''ОПРЕДЕЛИТЬ ЦЕЛЬ ЭВАКУАЦИИ: Ваша цель Эвакуации будет равна половине количества юнитов из вашей армии, которые находятся на поле боя в конце битвы (округляя в большую сторону), включая юниты, погруженные в модели TRANSPORT, которые находятся на поле боя. Если ваша цель Эвакуации меньше 4, она увеличивается до 4.

ЭВАКУИРОВАТЬ ЮНИТЫ: В конце вашего пятого хода бросьте один D6 за каждый юнит из вашей армии, который полностью находится в пределах 6" от центра поля боя, вычитая 1 из результата, если этот юнит является Battle-shocked. На 4+ этот юнит (и любые юниты, погруженные в него) помечается для эвакуации.

ОПРЕДЕЛИТЬ УСПЕХ GAMBIT: Если количество ваших юнитов, которые помечены для эвакуации, больше или равно вашей цели Эвакуации, этот Gambit успешно завершен и вы получаете 30VP.''',
);

const orbitalStrikeCoordinates = Gambit(
  id: 'orbital_strike_coordinates',
  name: 'ORBITAL STRIKE COORDINATES',
  description: '''В конце вашего пятого хода, если один или несколько юнитов из вашей армии, которые не являются Battle-shocked, полностью находятся в пределах 9" от угла поля боя, и эти юниты не находятся в вашей собственной зоне развертывания, бросьте 2D6.

Добавьте 1 к результату за каждый другой угол поля боя, который имеет один или несколько юнитов из вашей армии полностью в пределах 9" от него (исключая юниты, которые являются Battle-shocked или находятся в пределах Engagement Range от любых вражеских юнитов).

Если финальный результат 12 или больше, этот Gambit успешно завершен и вы получаете 30VP.''',
);


// -------------------- MISSION MAP --------------------
const searchAndDestroy = MissionMap(
  id: 'map_search_and_destroy',
  name: 'Search and Destroy',
  baseW: 44,
  baseH: 60,
  specialNumber: 9,
  points: [
    MapPoint(id: 'o_c', x: 22, y: 30, type: 'objective'),
    MapPoint(id: 'o_l', x: 10,  y: 14, type: 'objective'),
    MapPoint(id: 'o_r', x: 34, y: 46, type: 'objective'),
    MapPoint(id: 'o_t', x: 34, y: 14, type: 'objective'),
    MapPoint(id: 'o_b', x: 10, y: 46, type: 'objective'),
  ],
  attackerZones: [
    [
      MapPoint(id: 'a1', x: 0,  y: 30, type: 'attacker_zone'),
      MapPoint(id: 'a2', x: 22, y: 30, type: 'attacker_zone'),
      MapPoint(id: 'a3', x: 22, y: 60, type: 'attacker_zone'),
      MapPoint(id: 'a4', x: 0,  y: 60, type: 'attacker_zone'),
    ],
  ],
  defenderZones: [
    [
      MapPoint(id: 'd1', x: 22, y: 0,  type: 'defender_zone'),
      MapPoint(id: 'd2', x: 44, y: 0,  type: 'defender_zone'),
      MapPoint(id: 'd3', x: 44, y: 30, type: 'defender_zone'),
      MapPoint(id: 'd4', x: 22, y: 30, type: 'defender_zone'),
    ],
  ],
);

const sweepingEngagememnt = MissionMap(
  id: 'map_sweeping_engagement',
  name: 'Sweeping Engagement',
  baseW: 44,
  baseH: 60,
  points: [
    MapPoint(id: 'o_c', x: 22, y: 30, type: 'objective'),
    MapPoint(id: 'o_l', x: 14, y: 10, type: 'objective'),
    MapPoint(id: 'o_r', x: 38, y: 18, type: 'objective'),
    MapPoint(id: 'o_tr', x: 6, y: 42, type: 'objective'),
    MapPoint(id: 'o_bl', x: 31,  y: 50, type: 'objective'),
  ],
  defenderZones: [
    [
      MapPoint(id: 'd1', x: 0,  y: 0,  type: 'defender_zone'),
      MapPoint(id: 'd2', x: 22, y: 60,  type: 'defender_zone'),
      MapPoint(id: 'd3', x: 0,  y: 60, type: 'defender_zone'),
    ],
  ],
  attackerZones: [
    [
      MapPoint(id: 'a1', x: 22,  y: 0, type: 'attacker_zone'),
      MapPoint(id: 'a2', x:44, y: 60, type: 'attacker_zone'),
      MapPoint(id: 'a3', x: 44, y: 0,  type: 'attacker_zone'),
    ],
  ],
);

const dawnOfWar = MissionMap(
  id: 'map_dawn_of_war',
  name: 'Dawn of War',
  baseW: 44,
  baseH: 60,
  points: [
    MapPoint(id: 'o_c', x: 22, y: 30, type: 'objective'),
    MapPoint(id: 'o_l', x: 6,  y: 30, type: 'objective'),
    MapPoint(id: 'o_r', x: 38, y: 30, type: 'objective'),
    MapPoint(id: 'o_t', x: 22, y: 10, type: 'objective'),
    MapPoint(id: 'o_b', x: 22, y: 50, type: 'objective'),
  ],
  defenderZones: [
    [
      MapPoint(id: 'd1', x: 0,  y: 0,  type: 'defender_zone'),
      MapPoint(id: 'd2', x: 0, y: 60,  type: 'defender_zone'),
      MapPoint(id: 'd3', x: 10, y: 60, type: 'defender_zone'),
      MapPoint(id: 'd4', x: 10,  y: 0, type: 'defender_zone'),
    ],
  ],
  attackerZones: [
    [
      MapPoint(id: 'a1', x: 34,  y: 0, type: 'attacker_zone'),
      MapPoint(id: 'a2', x: 44, y: 0, type: 'attacker_zone'),
      MapPoint(id: 'a3', x: 44, y: 60, type: 'attacker_zone'),
      MapPoint(id: 'a4', x: 34,  y: 60, type: 'attacker_zone'),
    ],
  ],
);

const crucibleOfBattle = MissionMap(
  id: 'map_crucible_of_battle',
  name: 'Crucible of Battle',
  baseW: 44,
  baseH: 60,

  points: [
    MapPoint(id: 'o_c', x: 22, y: 30, type: 'objective'),
    MapPoint(id: 'o_l', x: 8, y: 20, type: 'objective'),
    MapPoint(id: 'o_r', x: 34, y: 14, type: 'objective'),
    MapPoint(id: 'o_t', x: 10, y: 46, type: 'objective'),
    MapPoint(id: 'o_b', x: 36, y: 40, type: 'objective'),
  ],

  defenderZones: [
    [
      MapPoint(id: 'd1', x: 0, y: 30, type: 'defender_zone'),
      MapPoint(id: 'd2', x: 0, y: 60, type: 'defender_zone'),
      MapPoint(id: 'd3', x: 44, y: 60, type: 'defender_zone'),
    ],
  ],
  attackerZones: [
    [
      MapPoint(id: 'a1', x: 0, y: 0, type: 'attacker_zone'),
      MapPoint(id: 'a2', x: 44, y: 0, type: 'attacker_zone'),
      MapPoint(id: 'a3', x: 44, y: 30, type: 'attacker_zone'),
    ],
  ],
);


const hammerAndAnvil = MissionMap(
  id: 'map_hammer_and_anvil',
  name: 'Hammer and Anvil',
  baseW: 44,
  baseH: 60,

  points: [
    MapPoint(id: 'o_c', x: 22, y: 30, type: 'objective'),
    MapPoint(id: 'o_t', x: 6, y: 30, type: 'objective'),
    MapPoint(id: 'o_b', x: 38, y: 30, type: 'objective'),
    MapPoint(id: 'o_l', x: 22, y: 10, type: 'objective'),
    MapPoint(id: 'o_r', x: 22,  y: 50, type: 'objective'),
  ],
  attackerZones: [
    [
      MapPoint(id: 'a1', x: 0,  y: 0,  type: 'attacker_zone'),
      MapPoint(id: 'a2', x: 0, y: 18,  type: 'attacker_zone'),
      MapPoint(id: 'a3', x: 44, y: 18, type: 'attacker_zone'),
      MapPoint(id: 'a4', x: 44,  y: 0, type: 'attacker_zone'),
    ],
  ],
  defenderZones: [
    [
      MapPoint(id: 'd1', x: 0, y: 60,  type: 'defender_zone'),
      MapPoint(id: 'd2', x: 0, y: 48,  type: 'defender_zone'),
      MapPoint(id: 'd3', x: 44, y: 48, type: 'defender_zone'),
      MapPoint(id: 'd4', x: 44, y: 60, type: 'defender_zone'),
    ],
  ],
);







// -------------------- MISSION PACK --------------------



const MissionPack leviathanPack = MissionPack(
  id: 'leviathan',
  title: 'Leviathan',
  primaries: [
    takeAndHold,
    scorchedEarth,
    purgeTheFoe,
    sitesOfPower,
    theRitual,
    priorityTargets,
    supplyDrop,
    deployServoSkulls,
    vitalGround,
  ],
  secondaries: [
    extendBattleLines,
    behindEnemyLines,
    assassination,
    bringItDown,
    engageOnAllFronts,
    stormHostileObjective,
    cleanse,
    deployTeleportHomer,
    investigateSignals,
    noPrisoners,
    defendStronghold,
    overwhelmingForce,
    secureNoMansLand,
    areaDenial,
    aTemptingTarget,
    captureEnemyOutpost,
  ],
  gambits: [
    proceedAsPlanned,
    delayingTactics,
    emergencyEvacuation,
    orbitalStrikeCoordinates,
  ],
  rules: [
    chosenBattlefield,
    chillingRain,
    sweepAndClear,
    hiddenSupplies,
    minefields,
    targetsOfOpportunity,
    scramblerFields,
    delayedReserves,
    maelstromOfBattle,
    supplyLines,
    secretIntel,
    voxStatic,
  ],
  maps: [
    searchAndDestroy,
    sweepingEngagememnt,
    dawnOfWar,
    crucibleOfBattle,
    hammerAndAnvil,
  ],
);