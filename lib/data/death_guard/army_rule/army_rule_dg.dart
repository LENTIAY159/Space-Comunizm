import '../../z_datachment_model/army_rule_model.dart';

const nurglesGift = ArmyRule(
    name: 'Nurgle’s Gift (Aura)',
description: '''
Если ваша Army Faction - DEATH GUARD, пока вражеский юнит находится в пределах Contagion Range одной или более моделей DEATH GUARD из вашей армии, он находится под воздействием Afflicted.

Contagion Range изменяется в ходе битвы:
• 1st Battle Round: Contagion Range = 3".
• 2nd Battle Round: Contagion Range = 6".
• 3rd Battle Round и далее: Contagion Range = 9".
\n\n
AFFLICTED
Во время шага Declare Battle Formations выберите одну из чум ниже. До конца сражения, пока вражеский отряд находится под воздействием Afflicted, вычитайте 1 из характеристики Toughness моделей в этом отряде, и этот отряд получает эффект выбранной вами чумы.

Skullsquirm Blight
Эта ужасающая язва постепенно изнутри разъедает разум и чувства жертвы.
Каждый раз, когда модель в этом отряде совершает атаку, вычитайте 1 из броска Hit.

Rattlejoint Ague
Конечности сотрясает лихорадочный паралич, кости становятся хрупкими как стекло, эти воины едва могут защищаться.
Ухудшите характеристику Save моделей в этом отряде на 1.

Scabrous Soulrot
Жертвы этого коварного недуга становятся тусклыми и безвольными, их сама сущность и дух разлагаются.
Ухудшите характеристики Move, Leadership и Objective Control моделей в этом отряде на 1 (это правило может ухудшить Objective Control модели только до минимума 1).
''',
);
const pactOfDecay = ArmyRule(
  name: 'Pact of Decay',
  description: '''
При формировании вашей армии, если не указано иное, вы не можете выбрать PLAGUE LEGIONS в качестве вашей Army Faction.
''',
);

List<ArmyRule> getArmyRulesDG() {
  return [
    nurglesGift,
    pactOfDecay,
  ];
}



