// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $FactionsTable extends Factions with TableInfo<$FactionsTable, Faction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'factions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Faction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Faction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Faction(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $FactionsTable createAlias(String alias) {
    return $FactionsTable(attachedDatabase, alias);
  }
}

class Faction extends DataClass implements Insertable<Faction> {
  final int id;
  final String name;
  final String? description;
  const Faction({required this.id, required this.name, this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  FactionsCompanion toCompanion(bool nullToAbsent) {
    return FactionsCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory Faction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Faction(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
    };
  }

  Faction copyWith({
    int? id,
    String? name,
    Value<String?> description = const Value.absent(),
  }) => Faction(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
  );
  Faction copyWithCompanion(FactionsCompanion data) {
    return Faction(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Faction(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Faction &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description);
}

class FactionsCompanion extends UpdateCompanion<Faction> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  const FactionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  FactionsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Faction> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
  }

  FactionsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? description,
  }) {
    return FactionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FactionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $UnitsTable extends Units with TableInfo<$UnitsTable, Unit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _factionIdMeta = const VerificationMeta(
    'factionId',
  );
  @override
  late final GeneratedColumn<int> factionId = GeneratedColumn<int>(
    'faction_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES factions (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitCompositionMeta = const VerificationMeta(
    'unitComposition',
  );
  @override
  late final GeneratedColumn<String> unitComposition = GeneratedColumn<String>(
    'unit_composition',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _moveMeta = const VerificationMeta('move');
  @override
  late final GeneratedColumn<String> move = GeneratedColumn<String>(
    'move',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _toughnessMeta = const VerificationMeta(
    'toughness',
  );
  @override
  late final GeneratedColumn<String> toughness = GeneratedColumn<String>(
    'toughness',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _saveMeta = const VerificationMeta('save');
  @override
  late final GeneratedColumn<String> save = GeneratedColumn<String>(
    'save',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _invulnerableSaveMeta = const VerificationMeta(
    'invulnerableSave',
  );
  @override
  late final GeneratedColumn<String> invulnerableSave = GeneratedColumn<String>(
    'invulnerable_save',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _woundsMeta = const VerificationMeta('wounds');
  @override
  late final GeneratedColumn<String> wounds = GeneratedColumn<String>(
    'wounds',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _leadershipMeta = const VerificationMeta(
    'leadership',
  );
  @override
  late final GeneratedColumn<String> leadership = GeneratedColumn<String>(
    'leadership',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _objectiveCostMeta = const VerificationMeta(
    'objectiveCost',
  );
  @override
  late final GeneratedColumn<String> objectiveCost = GeneratedColumn<String>(
    'objective_cost',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    factionId,
    name,
    type,
    unitComposition,
    move,
    toughness,
    save,
    invulnerableSave,
    wounds,
    leadership,
    objectiveCost,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'units';
  @override
  VerificationContext validateIntegrity(
    Insertable<Unit> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('faction_id')) {
      context.handle(
        _factionIdMeta,
        factionId.isAcceptableOrUnknown(data['faction_id']!, _factionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_factionIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('unit_composition')) {
      context.handle(
        _unitCompositionMeta,
        unitComposition.isAcceptableOrUnknown(
          data['unit_composition']!,
          _unitCompositionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_unitCompositionMeta);
    }
    if (data.containsKey('move')) {
      context.handle(
        _moveMeta,
        move.isAcceptableOrUnknown(data['move']!, _moveMeta),
      );
    } else if (isInserting) {
      context.missing(_moveMeta);
    }
    if (data.containsKey('toughness')) {
      context.handle(
        _toughnessMeta,
        toughness.isAcceptableOrUnknown(data['toughness']!, _toughnessMeta),
      );
    } else if (isInserting) {
      context.missing(_toughnessMeta);
    }
    if (data.containsKey('save')) {
      context.handle(
        _saveMeta,
        save.isAcceptableOrUnknown(data['save']!, _saveMeta),
      );
    } else if (isInserting) {
      context.missing(_saveMeta);
    }
    if (data.containsKey('invulnerable_save')) {
      context.handle(
        _invulnerableSaveMeta,
        invulnerableSave.isAcceptableOrUnknown(
          data['invulnerable_save']!,
          _invulnerableSaveMeta,
        ),
      );
    }
    if (data.containsKey('wounds')) {
      context.handle(
        _woundsMeta,
        wounds.isAcceptableOrUnknown(data['wounds']!, _woundsMeta),
      );
    } else if (isInserting) {
      context.missing(_woundsMeta);
    }
    if (data.containsKey('leadership')) {
      context.handle(
        _leadershipMeta,
        leadership.isAcceptableOrUnknown(data['leadership']!, _leadershipMeta),
      );
    } else if (isInserting) {
      context.missing(_leadershipMeta);
    }
    if (data.containsKey('objective_cost')) {
      context.handle(
        _objectiveCostMeta,
        objectiveCost.isAcceptableOrUnknown(
          data['objective_cost']!,
          _objectiveCostMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_objectiveCostMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Unit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Unit(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      factionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}faction_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      unitComposition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_composition'],
      )!,
      move: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}move'],
      )!,
      toughness: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}toughness'],
      )!,
      save: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}save'],
      )!,
      invulnerableSave: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invulnerable_save'],
      ),
      wounds: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}wounds'],
      )!,
      leadership: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}leadership'],
      )!,
      objectiveCost: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}objective_cost'],
      )!,
    );
  }

  @override
  $UnitsTable createAlias(String alias) {
    return $UnitsTable(attachedDatabase, alias);
  }
}

class Unit extends DataClass implements Insertable<Unit> {
  final int id;
  final int factionId;
  final String name;
  final String type;
  final String unitComposition;
  final String move;
  final String toughness;
  final String save;
  final String? invulnerableSave;
  final String wounds;
  final String leadership;
  final String objectiveCost;
  const Unit({
    required this.id,
    required this.factionId,
    required this.name,
    required this.type,
    required this.unitComposition,
    required this.move,
    required this.toughness,
    required this.save,
    this.invulnerableSave,
    required this.wounds,
    required this.leadership,
    required this.objectiveCost,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['faction_id'] = Variable<int>(factionId);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['unit_composition'] = Variable<String>(unitComposition);
    map['move'] = Variable<String>(move);
    map['toughness'] = Variable<String>(toughness);
    map['save'] = Variable<String>(save);
    if (!nullToAbsent || invulnerableSave != null) {
      map['invulnerable_save'] = Variable<String>(invulnerableSave);
    }
    map['wounds'] = Variable<String>(wounds);
    map['leadership'] = Variable<String>(leadership);
    map['objective_cost'] = Variable<String>(objectiveCost);
    return map;
  }

  UnitsCompanion toCompanion(bool nullToAbsent) {
    return UnitsCompanion(
      id: Value(id),
      factionId: Value(factionId),
      name: Value(name),
      type: Value(type),
      unitComposition: Value(unitComposition),
      move: Value(move),
      toughness: Value(toughness),
      save: Value(save),
      invulnerableSave: invulnerableSave == null && nullToAbsent
          ? const Value.absent()
          : Value(invulnerableSave),
      wounds: Value(wounds),
      leadership: Value(leadership),
      objectiveCost: Value(objectiveCost),
    );
  }

  factory Unit.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Unit(
      id: serializer.fromJson<int>(json['id']),
      factionId: serializer.fromJson<int>(json['factionId']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      unitComposition: serializer.fromJson<String>(json['unitComposition']),
      move: serializer.fromJson<String>(json['move']),
      toughness: serializer.fromJson<String>(json['toughness']),
      save: serializer.fromJson<String>(json['save']),
      invulnerableSave: serializer.fromJson<String?>(json['invulnerableSave']),
      wounds: serializer.fromJson<String>(json['wounds']),
      leadership: serializer.fromJson<String>(json['leadership']),
      objectiveCost: serializer.fromJson<String>(json['objectiveCost']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'factionId': serializer.toJson<int>(factionId),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'unitComposition': serializer.toJson<String>(unitComposition),
      'move': serializer.toJson<String>(move),
      'toughness': serializer.toJson<String>(toughness),
      'save': serializer.toJson<String>(save),
      'invulnerableSave': serializer.toJson<String?>(invulnerableSave),
      'wounds': serializer.toJson<String>(wounds),
      'leadership': serializer.toJson<String>(leadership),
      'objectiveCost': serializer.toJson<String>(objectiveCost),
    };
  }

  Unit copyWith({
    int? id,
    int? factionId,
    String? name,
    String? type,
    String? unitComposition,
    String? move,
    String? toughness,
    String? save,
    Value<String?> invulnerableSave = const Value.absent(),
    String? wounds,
    String? leadership,
    String? objectiveCost,
  }) => Unit(
    id: id ?? this.id,
    factionId: factionId ?? this.factionId,
    name: name ?? this.name,
    type: type ?? this.type,
    unitComposition: unitComposition ?? this.unitComposition,
    move: move ?? this.move,
    toughness: toughness ?? this.toughness,
    save: save ?? this.save,
    invulnerableSave: invulnerableSave.present
        ? invulnerableSave.value
        : this.invulnerableSave,
    wounds: wounds ?? this.wounds,
    leadership: leadership ?? this.leadership,
    objectiveCost: objectiveCost ?? this.objectiveCost,
  );
  Unit copyWithCompanion(UnitsCompanion data) {
    return Unit(
      id: data.id.present ? data.id.value : this.id,
      factionId: data.factionId.present ? data.factionId.value : this.factionId,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      unitComposition: data.unitComposition.present
          ? data.unitComposition.value
          : this.unitComposition,
      move: data.move.present ? data.move.value : this.move,
      toughness: data.toughness.present ? data.toughness.value : this.toughness,
      save: data.save.present ? data.save.value : this.save,
      invulnerableSave: data.invulnerableSave.present
          ? data.invulnerableSave.value
          : this.invulnerableSave,
      wounds: data.wounds.present ? data.wounds.value : this.wounds,
      leadership: data.leadership.present
          ? data.leadership.value
          : this.leadership,
      objectiveCost: data.objectiveCost.present
          ? data.objectiveCost.value
          : this.objectiveCost,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Unit(')
          ..write('id: $id, ')
          ..write('factionId: $factionId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('unitComposition: $unitComposition, ')
          ..write('move: $move, ')
          ..write('toughness: $toughness, ')
          ..write('save: $save, ')
          ..write('invulnerableSave: $invulnerableSave, ')
          ..write('wounds: $wounds, ')
          ..write('leadership: $leadership, ')
          ..write('objectiveCost: $objectiveCost')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    factionId,
    name,
    type,
    unitComposition,
    move,
    toughness,
    save,
    invulnerableSave,
    wounds,
    leadership,
    objectiveCost,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Unit &&
          other.id == this.id &&
          other.factionId == this.factionId &&
          other.name == this.name &&
          other.type == this.type &&
          other.unitComposition == this.unitComposition &&
          other.move == this.move &&
          other.toughness == this.toughness &&
          other.save == this.save &&
          other.invulnerableSave == this.invulnerableSave &&
          other.wounds == this.wounds &&
          other.leadership == this.leadership &&
          other.objectiveCost == this.objectiveCost);
}

class UnitsCompanion extends UpdateCompanion<Unit> {
  final Value<int> id;
  final Value<int> factionId;
  final Value<String> name;
  final Value<String> type;
  final Value<String> unitComposition;
  final Value<String> move;
  final Value<String> toughness;
  final Value<String> save;
  final Value<String?> invulnerableSave;
  final Value<String> wounds;
  final Value<String> leadership;
  final Value<String> objectiveCost;
  const UnitsCompanion({
    this.id = const Value.absent(),
    this.factionId = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.unitComposition = const Value.absent(),
    this.move = const Value.absent(),
    this.toughness = const Value.absent(),
    this.save = const Value.absent(),
    this.invulnerableSave = const Value.absent(),
    this.wounds = const Value.absent(),
    this.leadership = const Value.absent(),
    this.objectiveCost = const Value.absent(),
  });
  UnitsCompanion.insert({
    this.id = const Value.absent(),
    required int factionId,
    required String name,
    required String type,
    required String unitComposition,
    required String move,
    required String toughness,
    required String save,
    this.invulnerableSave = const Value.absent(),
    required String wounds,
    required String leadership,
    required String objectiveCost,
  }) : factionId = Value(factionId),
       name = Value(name),
       type = Value(type),
       unitComposition = Value(unitComposition),
       move = Value(move),
       toughness = Value(toughness),
       save = Value(save),
       wounds = Value(wounds),
       leadership = Value(leadership),
       objectiveCost = Value(objectiveCost);
  static Insertable<Unit> custom({
    Expression<int>? id,
    Expression<int>? factionId,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? unitComposition,
    Expression<String>? move,
    Expression<String>? toughness,
    Expression<String>? save,
    Expression<String>? invulnerableSave,
    Expression<String>? wounds,
    Expression<String>? leadership,
    Expression<String>? objectiveCost,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (factionId != null) 'faction_id': factionId,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (unitComposition != null) 'unit_composition': unitComposition,
      if (move != null) 'move': move,
      if (toughness != null) 'toughness': toughness,
      if (save != null) 'save': save,
      if (invulnerableSave != null) 'invulnerable_save': invulnerableSave,
      if (wounds != null) 'wounds': wounds,
      if (leadership != null) 'leadership': leadership,
      if (objectiveCost != null) 'objective_cost': objectiveCost,
    });
  }

  UnitsCompanion copyWith({
    Value<int>? id,
    Value<int>? factionId,
    Value<String>? name,
    Value<String>? type,
    Value<String>? unitComposition,
    Value<String>? move,
    Value<String>? toughness,
    Value<String>? save,
    Value<String?>? invulnerableSave,
    Value<String>? wounds,
    Value<String>? leadership,
    Value<String>? objectiveCost,
  }) {
    return UnitsCompanion(
      id: id ?? this.id,
      factionId: factionId ?? this.factionId,
      name: name ?? this.name,
      type: type ?? this.type,
      unitComposition: unitComposition ?? this.unitComposition,
      move: move ?? this.move,
      toughness: toughness ?? this.toughness,
      save: save ?? this.save,
      invulnerableSave: invulnerableSave ?? this.invulnerableSave,
      wounds: wounds ?? this.wounds,
      leadership: leadership ?? this.leadership,
      objectiveCost: objectiveCost ?? this.objectiveCost,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (factionId.present) {
      map['faction_id'] = Variable<int>(factionId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (unitComposition.present) {
      map['unit_composition'] = Variable<String>(unitComposition.value);
    }
    if (move.present) {
      map['move'] = Variable<String>(move.value);
    }
    if (toughness.present) {
      map['toughness'] = Variable<String>(toughness.value);
    }
    if (save.present) {
      map['save'] = Variable<String>(save.value);
    }
    if (invulnerableSave.present) {
      map['invulnerable_save'] = Variable<String>(invulnerableSave.value);
    }
    if (wounds.present) {
      map['wounds'] = Variable<String>(wounds.value);
    }
    if (leadership.present) {
      map['leadership'] = Variable<String>(leadership.value);
    }
    if (objectiveCost.present) {
      map['objective_cost'] = Variable<String>(objectiveCost.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnitsCompanion(')
          ..write('id: $id, ')
          ..write('factionId: $factionId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('unitComposition: $unitComposition, ')
          ..write('move: $move, ')
          ..write('toughness: $toughness, ')
          ..write('save: $save, ')
          ..write('invulnerableSave: $invulnerableSave, ')
          ..write('wounds: $wounds, ')
          ..write('leadership: $leadership, ')
          ..write('objectiveCost: $objectiveCost')
          ..write(')'))
        .toString();
  }
}

class $WeaponsTable extends Weapons with TableInfo<$WeaponsTable, Weapon> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeaponsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _weaponTypeMeta = const VerificationMeta(
    'weaponType',
  );
  @override
  late final GeneratedColumn<String> weaponType = GeneratedColumn<String>(
    'weapon_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rangeMeta = const VerificationMeta('range');
  @override
  late final GeneratedColumn<String> range = GeneratedColumn<String>(
    'range',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _attacksMeta = const VerificationMeta(
    'attacks',
  );
  @override
  late final GeneratedColumn<String> attacks = GeneratedColumn<String>(
    'attacks',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ballisticSkillMeta = const VerificationMeta(
    'ballisticSkill',
  );
  @override
  late final GeneratedColumn<String> ballisticSkill = GeneratedColumn<String>(
    'ballistic_skill',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _strengthMeta = const VerificationMeta(
    'strength',
  );
  @override
  late final GeneratedColumn<String> strength = GeneratedColumn<String>(
    'strength',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _armorPenMeta = const VerificationMeta(
    'armorPen',
  );
  @override
  late final GeneratedColumn<String> armorPen = GeneratedColumn<String>(
    'armor_pen',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _damageMeta = const VerificationMeta('damage');
  @override
  late final GeneratedColumn<String> damage = GeneratedColumn<String>(
    'damage',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _specialRulesMeta = const VerificationMeta(
    'specialRules',
  );
  @override
  late final GeneratedColumn<String> specialRules = GeneratedColumn<String>(
    'special_rules',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    weaponType,
    range,
    attacks,
    ballisticSkill,
    strength,
    armorPen,
    damage,
    specialRules,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weapons';
  @override
  VerificationContext validateIntegrity(
    Insertable<Weapon> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('weapon_type')) {
      context.handle(
        _weaponTypeMeta,
        weaponType.isAcceptableOrUnknown(data['weapon_type']!, _weaponTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_weaponTypeMeta);
    }
    if (data.containsKey('range')) {
      context.handle(
        _rangeMeta,
        range.isAcceptableOrUnknown(data['range']!, _rangeMeta),
      );
    } else if (isInserting) {
      context.missing(_rangeMeta);
    }
    if (data.containsKey('attacks')) {
      context.handle(
        _attacksMeta,
        attacks.isAcceptableOrUnknown(data['attacks']!, _attacksMeta),
      );
    } else if (isInserting) {
      context.missing(_attacksMeta);
    }
    if (data.containsKey('ballistic_skill')) {
      context.handle(
        _ballisticSkillMeta,
        ballisticSkill.isAcceptableOrUnknown(
          data['ballistic_skill']!,
          _ballisticSkillMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ballisticSkillMeta);
    }
    if (data.containsKey('strength')) {
      context.handle(
        _strengthMeta,
        strength.isAcceptableOrUnknown(data['strength']!, _strengthMeta),
      );
    } else if (isInserting) {
      context.missing(_strengthMeta);
    }
    if (data.containsKey('armor_pen')) {
      context.handle(
        _armorPenMeta,
        armorPen.isAcceptableOrUnknown(data['armor_pen']!, _armorPenMeta),
      );
    } else if (isInserting) {
      context.missing(_armorPenMeta);
    }
    if (data.containsKey('damage')) {
      context.handle(
        _damageMeta,
        damage.isAcceptableOrUnknown(data['damage']!, _damageMeta),
      );
    } else if (isInserting) {
      context.missing(_damageMeta);
    }
    if (data.containsKey('special_rules')) {
      context.handle(
        _specialRulesMeta,
        specialRules.isAcceptableOrUnknown(
          data['special_rules']!,
          _specialRulesMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Weapon map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Weapon(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      weaponType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}weapon_type'],
      )!,
      range: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}range'],
      )!,
      attacks: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}attacks'],
      )!,
      ballisticSkill: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ballistic_skill'],
      )!,
      strength: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}strength'],
      )!,
      armorPen: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}armor_pen'],
      )!,
      damage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}damage'],
      )!,
      specialRules: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}special_rules'],
      ),
    );
  }

  @override
  $WeaponsTable createAlias(String alias) {
    return $WeaponsTable(attachedDatabase, alias);
  }
}

class Weapon extends DataClass implements Insertable<Weapon> {
  final int id;
  final String name;
  final String weaponType;
  final String range;
  final String attacks;
  final String ballisticSkill;
  final String strength;
  final String armorPen;
  final String damage;
  final String? specialRules;
  const Weapon({
    required this.id,
    required this.name,
    required this.weaponType,
    required this.range,
    required this.attacks,
    required this.ballisticSkill,
    required this.strength,
    required this.armorPen,
    required this.damage,
    this.specialRules,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['weapon_type'] = Variable<String>(weaponType);
    map['range'] = Variable<String>(range);
    map['attacks'] = Variable<String>(attacks);
    map['ballistic_skill'] = Variable<String>(ballisticSkill);
    map['strength'] = Variable<String>(strength);
    map['armor_pen'] = Variable<String>(armorPen);
    map['damage'] = Variable<String>(damage);
    if (!nullToAbsent || specialRules != null) {
      map['special_rules'] = Variable<String>(specialRules);
    }
    return map;
  }

  WeaponsCompanion toCompanion(bool nullToAbsent) {
    return WeaponsCompanion(
      id: Value(id),
      name: Value(name),
      weaponType: Value(weaponType),
      range: Value(range),
      attacks: Value(attacks),
      ballisticSkill: Value(ballisticSkill),
      strength: Value(strength),
      armorPen: Value(armorPen),
      damage: Value(damage),
      specialRules: specialRules == null && nullToAbsent
          ? const Value.absent()
          : Value(specialRules),
    );
  }

  factory Weapon.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Weapon(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      weaponType: serializer.fromJson<String>(json['weaponType']),
      range: serializer.fromJson<String>(json['range']),
      attacks: serializer.fromJson<String>(json['attacks']),
      ballisticSkill: serializer.fromJson<String>(json['ballisticSkill']),
      strength: serializer.fromJson<String>(json['strength']),
      armorPen: serializer.fromJson<String>(json['armorPen']),
      damage: serializer.fromJson<String>(json['damage']),
      specialRules: serializer.fromJson<String?>(json['specialRules']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'weaponType': serializer.toJson<String>(weaponType),
      'range': serializer.toJson<String>(range),
      'attacks': serializer.toJson<String>(attacks),
      'ballisticSkill': serializer.toJson<String>(ballisticSkill),
      'strength': serializer.toJson<String>(strength),
      'armorPen': serializer.toJson<String>(armorPen),
      'damage': serializer.toJson<String>(damage),
      'specialRules': serializer.toJson<String?>(specialRules),
    };
  }

  Weapon copyWith({
    int? id,
    String? name,
    String? weaponType,
    String? range,
    String? attacks,
    String? ballisticSkill,
    String? strength,
    String? armorPen,
    String? damage,
    Value<String?> specialRules = const Value.absent(),
  }) => Weapon(
    id: id ?? this.id,
    name: name ?? this.name,
    weaponType: weaponType ?? this.weaponType,
    range: range ?? this.range,
    attacks: attacks ?? this.attacks,
    ballisticSkill: ballisticSkill ?? this.ballisticSkill,
    strength: strength ?? this.strength,
    armorPen: armorPen ?? this.armorPen,
    damage: damage ?? this.damage,
    specialRules: specialRules.present ? specialRules.value : this.specialRules,
  );
  Weapon copyWithCompanion(WeaponsCompanion data) {
    return Weapon(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      weaponType: data.weaponType.present
          ? data.weaponType.value
          : this.weaponType,
      range: data.range.present ? data.range.value : this.range,
      attacks: data.attacks.present ? data.attacks.value : this.attacks,
      ballisticSkill: data.ballisticSkill.present
          ? data.ballisticSkill.value
          : this.ballisticSkill,
      strength: data.strength.present ? data.strength.value : this.strength,
      armorPen: data.armorPen.present ? data.armorPen.value : this.armorPen,
      damage: data.damage.present ? data.damage.value : this.damage,
      specialRules: data.specialRules.present
          ? data.specialRules.value
          : this.specialRules,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Weapon(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('weaponType: $weaponType, ')
          ..write('range: $range, ')
          ..write('attacks: $attacks, ')
          ..write('ballisticSkill: $ballisticSkill, ')
          ..write('strength: $strength, ')
          ..write('armorPen: $armorPen, ')
          ..write('damage: $damage, ')
          ..write('specialRules: $specialRules')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    weaponType,
    range,
    attacks,
    ballisticSkill,
    strength,
    armorPen,
    damage,
    specialRules,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Weapon &&
          other.id == this.id &&
          other.name == this.name &&
          other.weaponType == this.weaponType &&
          other.range == this.range &&
          other.attacks == this.attacks &&
          other.ballisticSkill == this.ballisticSkill &&
          other.strength == this.strength &&
          other.armorPen == this.armorPen &&
          other.damage == this.damage &&
          other.specialRules == this.specialRules);
}

class WeaponsCompanion extends UpdateCompanion<Weapon> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> weaponType;
  final Value<String> range;
  final Value<String> attacks;
  final Value<String> ballisticSkill;
  final Value<String> strength;
  final Value<String> armorPen;
  final Value<String> damage;
  final Value<String?> specialRules;
  const WeaponsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.weaponType = const Value.absent(),
    this.range = const Value.absent(),
    this.attacks = const Value.absent(),
    this.ballisticSkill = const Value.absent(),
    this.strength = const Value.absent(),
    this.armorPen = const Value.absent(),
    this.damage = const Value.absent(),
    this.specialRules = const Value.absent(),
  });
  WeaponsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String weaponType,
    required String range,
    required String attacks,
    required String ballisticSkill,
    required String strength,
    required String armorPen,
    required String damage,
    this.specialRules = const Value.absent(),
  }) : name = Value(name),
       weaponType = Value(weaponType),
       range = Value(range),
       attacks = Value(attacks),
       ballisticSkill = Value(ballisticSkill),
       strength = Value(strength),
       armorPen = Value(armorPen),
       damage = Value(damage);
  static Insertable<Weapon> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? weaponType,
    Expression<String>? range,
    Expression<String>? attacks,
    Expression<String>? ballisticSkill,
    Expression<String>? strength,
    Expression<String>? armorPen,
    Expression<String>? damage,
    Expression<String>? specialRules,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (weaponType != null) 'weapon_type': weaponType,
      if (range != null) 'range': range,
      if (attacks != null) 'attacks': attacks,
      if (ballisticSkill != null) 'ballistic_skill': ballisticSkill,
      if (strength != null) 'strength': strength,
      if (armorPen != null) 'armor_pen': armorPen,
      if (damage != null) 'damage': damage,
      if (specialRules != null) 'special_rules': specialRules,
    });
  }

  WeaponsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? weaponType,
    Value<String>? range,
    Value<String>? attacks,
    Value<String>? ballisticSkill,
    Value<String>? strength,
    Value<String>? armorPen,
    Value<String>? damage,
    Value<String?>? specialRules,
  }) {
    return WeaponsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      weaponType: weaponType ?? this.weaponType,
      range: range ?? this.range,
      attacks: attacks ?? this.attacks,
      ballisticSkill: ballisticSkill ?? this.ballisticSkill,
      strength: strength ?? this.strength,
      armorPen: armorPen ?? this.armorPen,
      damage: damage ?? this.damage,
      specialRules: specialRules ?? this.specialRules,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (weaponType.present) {
      map['weapon_type'] = Variable<String>(weaponType.value);
    }
    if (range.present) {
      map['range'] = Variable<String>(range.value);
    }
    if (attacks.present) {
      map['attacks'] = Variable<String>(attacks.value);
    }
    if (ballisticSkill.present) {
      map['ballistic_skill'] = Variable<String>(ballisticSkill.value);
    }
    if (strength.present) {
      map['strength'] = Variable<String>(strength.value);
    }
    if (armorPen.present) {
      map['armor_pen'] = Variable<String>(armorPen.value);
    }
    if (damage.present) {
      map['damage'] = Variable<String>(damage.value);
    }
    if (specialRules.present) {
      map['special_rules'] = Variable<String>(specialRules.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeaponsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('weaponType: $weaponType, ')
          ..write('range: $range, ')
          ..write('attacks: $attacks, ')
          ..write('ballisticSkill: $ballisticSkill, ')
          ..write('strength: $strength, ')
          ..write('armorPen: $armorPen, ')
          ..write('damage: $damage, ')
          ..write('specialRules: $specialRules')
          ..write(')'))
        .toString();
  }
}

class $AbilitiesTable extends Abilities
    with TableInfo<$AbilitiesTable, Ability> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AbilitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'abilities';
  @override
  VerificationContext validateIntegrity(
    Insertable<Ability> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Ability map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Ability(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
    );
  }

  @override
  $AbilitiesTable createAlias(String alias) {
    return $AbilitiesTable(attachedDatabase, alias);
  }
}

class Ability extends DataClass implements Insertable<Ability> {
  final int id;
  final String name;
  final String description;
  const Ability({
    required this.id,
    required this.name,
    required this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    return map;
  }

  AbilitiesCompanion toCompanion(bool nullToAbsent) {
    return AbilitiesCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
    );
  }

  factory Ability.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Ability(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
    };
  }

  Ability copyWith({int? id, String? name, String? description}) => Ability(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
  );
  Ability copyWithCompanion(AbilitiesCompanion data) {
    return Ability(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Ability(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ability &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description);
}

class AbilitiesCompanion extends UpdateCompanion<Ability> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  const AbilitiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  AbilitiesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
  }) : name = Value(name),
       description = Value(description);
  static Insertable<Ability> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
  }

  AbilitiesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? description,
  }) {
    return AbilitiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AbilitiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $KeywordsTable extends Keywords with TableInfo<$KeywordsTable, Keyword> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KeywordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'keywords';
  @override
  VerificationContext validateIntegrity(
    Insertable<Keyword> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Keyword map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Keyword(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $KeywordsTable createAlias(String alias) {
    return $KeywordsTable(attachedDatabase, alias);
  }
}

class Keyword extends DataClass implements Insertable<Keyword> {
  final int id;
  final String name;
  const Keyword({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  KeywordsCompanion toCompanion(bool nullToAbsent) {
    return KeywordsCompanion(id: Value(id), name: Value(name));
  }

  factory Keyword.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Keyword(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Keyword copyWith({int? id, String? name}) =>
      Keyword(id: id ?? this.id, name: name ?? this.name);
  Keyword copyWithCompanion(KeywordsCompanion data) {
    return Keyword(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Keyword(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Keyword && other.id == this.id && other.name == this.name);
}

class KeywordsCompanion extends UpdateCompanion<Keyword> {
  final Value<int> id;
  final Value<String> name;
  const KeywordsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  KeywordsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Keyword> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  KeywordsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return KeywordsCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KeywordsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $UnitWeaponsTable extends UnitWeapons
    with TableInfo<$UnitWeaponsTable, UnitWeapon> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnitWeaponsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<int> unitId = GeneratedColumn<int>(
    'unit_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES units (id)',
    ),
  );
  static const VerificationMeta _weaponIdMeta = const VerificationMeta(
    'weaponId',
  );
  @override
  late final GeneratedColumn<int> weaponId = GeneratedColumn<int>(
    'weapon_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES weapons (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [unitId, weaponId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'unit_weapons';
  @override
  VerificationContext validateIntegrity(
    Insertable<UnitWeapon> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_unitIdMeta);
    }
    if (data.containsKey('weapon_id')) {
      context.handle(
        _weaponIdMeta,
        weaponId.isAcceptableOrUnknown(data['weapon_id']!, _weaponIdMeta),
      );
    } else if (isInserting) {
      context.missing(_weaponIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {unitId, weaponId};
  @override
  UnitWeapon map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UnitWeapon(
      unitId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_id'],
      )!,
      weaponId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weapon_id'],
      )!,
    );
  }

  @override
  $UnitWeaponsTable createAlias(String alias) {
    return $UnitWeaponsTable(attachedDatabase, alias);
  }
}

class UnitWeapon extends DataClass implements Insertable<UnitWeapon> {
  final int unitId;
  final int weaponId;
  const UnitWeapon({required this.unitId, required this.weaponId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['unit_id'] = Variable<int>(unitId);
    map['weapon_id'] = Variable<int>(weaponId);
    return map;
  }

  UnitWeaponsCompanion toCompanion(bool nullToAbsent) {
    return UnitWeaponsCompanion(
      unitId: Value(unitId),
      weaponId: Value(weaponId),
    );
  }

  factory UnitWeapon.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UnitWeapon(
      unitId: serializer.fromJson<int>(json['unitId']),
      weaponId: serializer.fromJson<int>(json['weaponId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'unitId': serializer.toJson<int>(unitId),
      'weaponId': serializer.toJson<int>(weaponId),
    };
  }

  UnitWeapon copyWith({int? unitId, int? weaponId}) => UnitWeapon(
    unitId: unitId ?? this.unitId,
    weaponId: weaponId ?? this.weaponId,
  );
  UnitWeapon copyWithCompanion(UnitWeaponsCompanion data) {
    return UnitWeapon(
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      weaponId: data.weaponId.present ? data.weaponId.value : this.weaponId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UnitWeapon(')
          ..write('unitId: $unitId, ')
          ..write('weaponId: $weaponId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(unitId, weaponId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UnitWeapon &&
          other.unitId == this.unitId &&
          other.weaponId == this.weaponId);
}

class UnitWeaponsCompanion extends UpdateCompanion<UnitWeapon> {
  final Value<int> unitId;
  final Value<int> weaponId;
  final Value<int> rowid;
  const UnitWeaponsCompanion({
    this.unitId = const Value.absent(),
    this.weaponId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UnitWeaponsCompanion.insert({
    required int unitId,
    required int weaponId,
    this.rowid = const Value.absent(),
  }) : unitId = Value(unitId),
       weaponId = Value(weaponId);
  static Insertable<UnitWeapon> custom({
    Expression<int>? unitId,
    Expression<int>? weaponId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (unitId != null) 'unit_id': unitId,
      if (weaponId != null) 'weapon_id': weaponId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UnitWeaponsCompanion copyWith({
    Value<int>? unitId,
    Value<int>? weaponId,
    Value<int>? rowid,
  }) {
    return UnitWeaponsCompanion(
      unitId: unitId ?? this.unitId,
      weaponId: weaponId ?? this.weaponId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (unitId.present) {
      map['unit_id'] = Variable<int>(unitId.value);
    }
    if (weaponId.present) {
      map['weapon_id'] = Variable<int>(weaponId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnitWeaponsCompanion(')
          ..write('unitId: $unitId, ')
          ..write('weaponId: $weaponId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UnitAbilitiesTable extends UnitAbilities
    with TableInfo<$UnitAbilitiesTable, UnitAbility> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnitAbilitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<int> unitId = GeneratedColumn<int>(
    'unit_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES units (id)',
    ),
  );
  static const VerificationMeta _abilityIdMeta = const VerificationMeta(
    'abilityId',
  );
  @override
  late final GeneratedColumn<int> abilityId = GeneratedColumn<int>(
    'ability_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES abilities (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [unitId, abilityId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'unit_abilities';
  @override
  VerificationContext validateIntegrity(
    Insertable<UnitAbility> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_unitIdMeta);
    }
    if (data.containsKey('ability_id')) {
      context.handle(
        _abilityIdMeta,
        abilityId.isAcceptableOrUnknown(data['ability_id']!, _abilityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_abilityIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {unitId, abilityId};
  @override
  UnitAbility map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UnitAbility(
      unitId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_id'],
      )!,
      abilityId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ability_id'],
      )!,
    );
  }

  @override
  $UnitAbilitiesTable createAlias(String alias) {
    return $UnitAbilitiesTable(attachedDatabase, alias);
  }
}

class UnitAbility extends DataClass implements Insertable<UnitAbility> {
  final int unitId;
  final int abilityId;
  const UnitAbility({required this.unitId, required this.abilityId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['unit_id'] = Variable<int>(unitId);
    map['ability_id'] = Variable<int>(abilityId);
    return map;
  }

  UnitAbilitiesCompanion toCompanion(bool nullToAbsent) {
    return UnitAbilitiesCompanion(
      unitId: Value(unitId),
      abilityId: Value(abilityId),
    );
  }

  factory UnitAbility.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UnitAbility(
      unitId: serializer.fromJson<int>(json['unitId']),
      abilityId: serializer.fromJson<int>(json['abilityId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'unitId': serializer.toJson<int>(unitId),
      'abilityId': serializer.toJson<int>(abilityId),
    };
  }

  UnitAbility copyWith({int? unitId, int? abilityId}) => UnitAbility(
    unitId: unitId ?? this.unitId,
    abilityId: abilityId ?? this.abilityId,
  );
  UnitAbility copyWithCompanion(UnitAbilitiesCompanion data) {
    return UnitAbility(
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      abilityId: data.abilityId.present ? data.abilityId.value : this.abilityId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UnitAbility(')
          ..write('unitId: $unitId, ')
          ..write('abilityId: $abilityId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(unitId, abilityId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UnitAbility &&
          other.unitId == this.unitId &&
          other.abilityId == this.abilityId);
}

class UnitAbilitiesCompanion extends UpdateCompanion<UnitAbility> {
  final Value<int> unitId;
  final Value<int> abilityId;
  final Value<int> rowid;
  const UnitAbilitiesCompanion({
    this.unitId = const Value.absent(),
    this.abilityId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UnitAbilitiesCompanion.insert({
    required int unitId,
    required int abilityId,
    this.rowid = const Value.absent(),
  }) : unitId = Value(unitId),
       abilityId = Value(abilityId);
  static Insertable<UnitAbility> custom({
    Expression<int>? unitId,
    Expression<int>? abilityId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (unitId != null) 'unit_id': unitId,
      if (abilityId != null) 'ability_id': abilityId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UnitAbilitiesCompanion copyWith({
    Value<int>? unitId,
    Value<int>? abilityId,
    Value<int>? rowid,
  }) {
    return UnitAbilitiesCompanion(
      unitId: unitId ?? this.unitId,
      abilityId: abilityId ?? this.abilityId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (unitId.present) {
      map['unit_id'] = Variable<int>(unitId.value);
    }
    if (abilityId.present) {
      map['ability_id'] = Variable<int>(abilityId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnitAbilitiesCompanion(')
          ..write('unitId: $unitId, ')
          ..write('abilityId: $abilityId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UnitKeywordsTable extends UnitKeywords
    with TableInfo<$UnitKeywordsTable, UnitKeyword> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnitKeywordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<int> unitId = GeneratedColumn<int>(
    'unit_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES units (id)',
    ),
  );
  static const VerificationMeta _keywordIdMeta = const VerificationMeta(
    'keywordId',
  );
  @override
  late final GeneratedColumn<int> keywordId = GeneratedColumn<int>(
    'keyword_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES keywords (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [unitId, keywordId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'unit_keywords';
  @override
  VerificationContext validateIntegrity(
    Insertable<UnitKeyword> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_unitIdMeta);
    }
    if (data.containsKey('keyword_id')) {
      context.handle(
        _keywordIdMeta,
        keywordId.isAcceptableOrUnknown(data['keyword_id']!, _keywordIdMeta),
      );
    } else if (isInserting) {
      context.missing(_keywordIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {unitId, keywordId};
  @override
  UnitKeyword map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UnitKeyword(
      unitId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_id'],
      )!,
      keywordId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}keyword_id'],
      )!,
    );
  }

  @override
  $UnitKeywordsTable createAlias(String alias) {
    return $UnitKeywordsTable(attachedDatabase, alias);
  }
}

class UnitKeyword extends DataClass implements Insertable<UnitKeyword> {
  final int unitId;
  final int keywordId;
  const UnitKeyword({required this.unitId, required this.keywordId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['unit_id'] = Variable<int>(unitId);
    map['keyword_id'] = Variable<int>(keywordId);
    return map;
  }

  UnitKeywordsCompanion toCompanion(bool nullToAbsent) {
    return UnitKeywordsCompanion(
      unitId: Value(unitId),
      keywordId: Value(keywordId),
    );
  }

  factory UnitKeyword.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UnitKeyword(
      unitId: serializer.fromJson<int>(json['unitId']),
      keywordId: serializer.fromJson<int>(json['keywordId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'unitId': serializer.toJson<int>(unitId),
      'keywordId': serializer.toJson<int>(keywordId),
    };
  }

  UnitKeyword copyWith({int? unitId, int? keywordId}) => UnitKeyword(
    unitId: unitId ?? this.unitId,
    keywordId: keywordId ?? this.keywordId,
  );
  UnitKeyword copyWithCompanion(UnitKeywordsCompanion data) {
    return UnitKeyword(
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      keywordId: data.keywordId.present ? data.keywordId.value : this.keywordId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UnitKeyword(')
          ..write('unitId: $unitId, ')
          ..write('keywordId: $keywordId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(unitId, keywordId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UnitKeyword &&
          other.unitId == this.unitId &&
          other.keywordId == this.keywordId);
}

class UnitKeywordsCompanion extends UpdateCompanion<UnitKeyword> {
  final Value<int> unitId;
  final Value<int> keywordId;
  final Value<int> rowid;
  const UnitKeywordsCompanion({
    this.unitId = const Value.absent(),
    this.keywordId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UnitKeywordsCompanion.insert({
    required int unitId,
    required int keywordId,
    this.rowid = const Value.absent(),
  }) : unitId = Value(unitId),
       keywordId = Value(keywordId);
  static Insertable<UnitKeyword> custom({
    Expression<int>? unitId,
    Expression<int>? keywordId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (unitId != null) 'unit_id': unitId,
      if (keywordId != null) 'keyword_id': keywordId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UnitKeywordsCompanion copyWith({
    Value<int>? unitId,
    Value<int>? keywordId,
    Value<int>? rowid,
  }) {
    return UnitKeywordsCompanion(
      unitId: unitId ?? this.unitId,
      keywordId: keywordId ?? this.keywordId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (unitId.present) {
      map['unit_id'] = Variable<int>(unitId.value);
    }
    if (keywordId.present) {
      map['keyword_id'] = Variable<int>(keywordId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnitKeywordsCompanion(')
          ..write('unitId: $unitId, ')
          ..write('keywordId: $keywordId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FactionsTable factions = $FactionsTable(this);
  late final $UnitsTable units = $UnitsTable(this);
  late final $WeaponsTable weapons = $WeaponsTable(this);
  late final $AbilitiesTable abilities = $AbilitiesTable(this);
  late final $KeywordsTable keywords = $KeywordsTable(this);
  late final $UnitWeaponsTable unitWeapons = $UnitWeaponsTable(this);
  late final $UnitAbilitiesTable unitAbilities = $UnitAbilitiesTable(this);
  late final $UnitKeywordsTable unitKeywords = $UnitKeywordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    factions,
    units,
    weapons,
    abilities,
    keywords,
    unitWeapons,
    unitAbilities,
    unitKeywords,
  ];
}

typedef $$FactionsTableCreateCompanionBuilder =
    FactionsCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> description,
    });
typedef $$FactionsTableUpdateCompanionBuilder =
    FactionsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> description,
    });

final class $$FactionsTableReferences
    extends BaseReferences<_$AppDatabase, $FactionsTable, Faction> {
  $$FactionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UnitsTable, List<Unit>> _unitsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.units,
    aliasName: $_aliasNameGenerator(db.factions.id, db.units.factionId),
  );

  $$UnitsTableProcessedTableManager get unitsRefs {
    final manager = $$UnitsTableTableManager(
      $_db,
      $_db.units,
    ).filter((f) => f.factionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_unitsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FactionsTableFilterComposer
    extends Composer<_$AppDatabase, $FactionsTable> {
  $$FactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> unitsRefs(
    Expression<bool> Function($$UnitsTableFilterComposer f) f,
  ) {
    final $$UnitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.factionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableFilterComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $FactionsTable> {
  $$FactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FactionsTable> {
  $$FactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  Expression<T> unitsRefs<T extends Object>(
    Expression<T> Function($$UnitsTableAnnotationComposer a) f,
  ) {
    final $$UnitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.factionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableAnnotationComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FactionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FactionsTable,
          Faction,
          $$FactionsTableFilterComposer,
          $$FactionsTableOrderingComposer,
          $$FactionsTableAnnotationComposer,
          $$FactionsTableCreateCompanionBuilder,
          $$FactionsTableUpdateCompanionBuilder,
          (Faction, $$FactionsTableReferences),
          Faction,
          PrefetchHooks Function({bool unitsRefs})
        > {
  $$FactionsTableTableManager(_$AppDatabase db, $FactionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => FactionsCompanion(
                id: id,
                name: name,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
              }) => FactionsCompanion.insert(
                id: id,
                name: name,
                description: description,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FactionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({unitsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (unitsRefs) db.units],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (unitsRefs)
                    await $_getPrefetchedData<Faction, $FactionsTable, Unit>(
                      currentTable: table,
                      referencedTable: $$FactionsTableReferences
                          ._unitsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$FactionsTableReferences(db, table, p0).unitsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.factionId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$FactionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FactionsTable,
      Faction,
      $$FactionsTableFilterComposer,
      $$FactionsTableOrderingComposer,
      $$FactionsTableAnnotationComposer,
      $$FactionsTableCreateCompanionBuilder,
      $$FactionsTableUpdateCompanionBuilder,
      (Faction, $$FactionsTableReferences),
      Faction,
      PrefetchHooks Function({bool unitsRefs})
    >;
typedef $$UnitsTableCreateCompanionBuilder =
    UnitsCompanion Function({
      Value<int> id,
      required int factionId,
      required String name,
      required String type,
      required String unitComposition,
      required String move,
      required String toughness,
      required String save,
      Value<String?> invulnerableSave,
      required String wounds,
      required String leadership,
      required String objectiveCost,
    });
typedef $$UnitsTableUpdateCompanionBuilder =
    UnitsCompanion Function({
      Value<int> id,
      Value<int> factionId,
      Value<String> name,
      Value<String> type,
      Value<String> unitComposition,
      Value<String> move,
      Value<String> toughness,
      Value<String> save,
      Value<String?> invulnerableSave,
      Value<String> wounds,
      Value<String> leadership,
      Value<String> objectiveCost,
    });

final class $$UnitsTableReferences
    extends BaseReferences<_$AppDatabase, $UnitsTable, Unit> {
  $$UnitsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $FactionsTable _factionIdTable(_$AppDatabase db) => db.factions
      .createAlias($_aliasNameGenerator(db.units.factionId, db.factions.id));

  $$FactionsTableProcessedTableManager get factionId {
    final $_column = $_itemColumn<int>('faction_id')!;

    final manager = $$FactionsTableTableManager(
      $_db,
      $_db.factions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_factionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$UnitWeaponsTable, List<UnitWeapon>>
  _unitWeaponsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.unitWeapons,
    aliasName: $_aliasNameGenerator(db.units.id, db.unitWeapons.unitId),
  );

  $$UnitWeaponsTableProcessedTableManager get unitWeaponsRefs {
    final manager = $$UnitWeaponsTableTableManager(
      $_db,
      $_db.unitWeapons,
    ).filter((f) => f.unitId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_unitWeaponsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UnitAbilitiesTable, List<UnitAbility>>
  _unitAbilitiesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.unitAbilities,
    aliasName: $_aliasNameGenerator(db.units.id, db.unitAbilities.unitId),
  );

  $$UnitAbilitiesTableProcessedTableManager get unitAbilitiesRefs {
    final manager = $$UnitAbilitiesTableTableManager(
      $_db,
      $_db.unitAbilities,
    ).filter((f) => f.unitId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_unitAbilitiesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UnitKeywordsTable, List<UnitKeyword>>
  _unitKeywordsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.unitKeywords,
    aliasName: $_aliasNameGenerator(db.units.id, db.unitKeywords.unitId),
  );

  $$UnitKeywordsTableProcessedTableManager get unitKeywordsRefs {
    final manager = $$UnitKeywordsTableTableManager(
      $_db,
      $_db.unitKeywords,
    ).filter((f) => f.unitId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_unitKeywordsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UnitsTableFilterComposer extends Composer<_$AppDatabase, $UnitsTable> {
  $$UnitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitComposition => $composableBuilder(
    column: $table.unitComposition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get move => $composableBuilder(
    column: $table.move,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get toughness => $composableBuilder(
    column: $table.toughness,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get save => $composableBuilder(
    column: $table.save,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get invulnerableSave => $composableBuilder(
    column: $table.invulnerableSave,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get wounds => $composableBuilder(
    column: $table.wounds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get leadership => $composableBuilder(
    column: $table.leadership,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get objectiveCost => $composableBuilder(
    column: $table.objectiveCost,
    builder: (column) => ColumnFilters(column),
  );

  $$FactionsTableFilterComposer get factionId {
    final $$FactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.factionId,
      referencedTable: $db.factions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FactionsTableFilterComposer(
            $db: $db,
            $table: $db.factions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> unitWeaponsRefs(
    Expression<bool> Function($$UnitWeaponsTableFilterComposer f) f,
  ) {
    final $$UnitWeaponsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.unitWeapons,
      getReferencedColumn: (t) => t.unitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitWeaponsTableFilterComposer(
            $db: $db,
            $table: $db.unitWeapons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> unitAbilitiesRefs(
    Expression<bool> Function($$UnitAbilitiesTableFilterComposer f) f,
  ) {
    final $$UnitAbilitiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.unitAbilities,
      getReferencedColumn: (t) => t.unitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitAbilitiesTableFilterComposer(
            $db: $db,
            $table: $db.unitAbilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> unitKeywordsRefs(
    Expression<bool> Function($$UnitKeywordsTableFilterComposer f) f,
  ) {
    final $$UnitKeywordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.unitKeywords,
      getReferencedColumn: (t) => t.unitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitKeywordsTableFilterComposer(
            $db: $db,
            $table: $db.unitKeywords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UnitsTableOrderingComposer
    extends Composer<_$AppDatabase, $UnitsTable> {
  $$UnitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitComposition => $composableBuilder(
    column: $table.unitComposition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get move => $composableBuilder(
    column: $table.move,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get toughness => $composableBuilder(
    column: $table.toughness,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get save => $composableBuilder(
    column: $table.save,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get invulnerableSave => $composableBuilder(
    column: $table.invulnerableSave,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wounds => $composableBuilder(
    column: $table.wounds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get leadership => $composableBuilder(
    column: $table.leadership,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get objectiveCost => $composableBuilder(
    column: $table.objectiveCost,
    builder: (column) => ColumnOrderings(column),
  );

  $$FactionsTableOrderingComposer get factionId {
    final $$FactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.factionId,
      referencedTable: $db.factions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FactionsTableOrderingComposer(
            $db: $db,
            $table: $db.factions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UnitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UnitsTable> {
  $$UnitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get unitComposition => $composableBuilder(
    column: $table.unitComposition,
    builder: (column) => column,
  );

  GeneratedColumn<String> get move =>
      $composableBuilder(column: $table.move, builder: (column) => column);

  GeneratedColumn<String> get toughness =>
      $composableBuilder(column: $table.toughness, builder: (column) => column);

  GeneratedColumn<String> get save =>
      $composableBuilder(column: $table.save, builder: (column) => column);

  GeneratedColumn<String> get invulnerableSave => $composableBuilder(
    column: $table.invulnerableSave,
    builder: (column) => column,
  );

  GeneratedColumn<String> get wounds =>
      $composableBuilder(column: $table.wounds, builder: (column) => column);

  GeneratedColumn<String> get leadership => $composableBuilder(
    column: $table.leadership,
    builder: (column) => column,
  );

  GeneratedColumn<String> get objectiveCost => $composableBuilder(
    column: $table.objectiveCost,
    builder: (column) => column,
  );

  $$FactionsTableAnnotationComposer get factionId {
    final $$FactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.factionId,
      referencedTable: $db.factions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.factions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> unitWeaponsRefs<T extends Object>(
    Expression<T> Function($$UnitWeaponsTableAnnotationComposer a) f,
  ) {
    final $$UnitWeaponsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.unitWeapons,
      getReferencedColumn: (t) => t.unitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitWeaponsTableAnnotationComposer(
            $db: $db,
            $table: $db.unitWeapons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> unitAbilitiesRefs<T extends Object>(
    Expression<T> Function($$UnitAbilitiesTableAnnotationComposer a) f,
  ) {
    final $$UnitAbilitiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.unitAbilities,
      getReferencedColumn: (t) => t.unitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitAbilitiesTableAnnotationComposer(
            $db: $db,
            $table: $db.unitAbilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> unitKeywordsRefs<T extends Object>(
    Expression<T> Function($$UnitKeywordsTableAnnotationComposer a) f,
  ) {
    final $$UnitKeywordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.unitKeywords,
      getReferencedColumn: (t) => t.unitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitKeywordsTableAnnotationComposer(
            $db: $db,
            $table: $db.unitKeywords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UnitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UnitsTable,
          Unit,
          $$UnitsTableFilterComposer,
          $$UnitsTableOrderingComposer,
          $$UnitsTableAnnotationComposer,
          $$UnitsTableCreateCompanionBuilder,
          $$UnitsTableUpdateCompanionBuilder,
          (Unit, $$UnitsTableReferences),
          Unit,
          PrefetchHooks Function({
            bool factionId,
            bool unitWeaponsRefs,
            bool unitAbilitiesRefs,
            bool unitKeywordsRefs,
          })
        > {
  $$UnitsTableTableManager(_$AppDatabase db, $UnitsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UnitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UnitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UnitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> factionId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> unitComposition = const Value.absent(),
                Value<String> move = const Value.absent(),
                Value<String> toughness = const Value.absent(),
                Value<String> save = const Value.absent(),
                Value<String?> invulnerableSave = const Value.absent(),
                Value<String> wounds = const Value.absent(),
                Value<String> leadership = const Value.absent(),
                Value<String> objectiveCost = const Value.absent(),
              }) => UnitsCompanion(
                id: id,
                factionId: factionId,
                name: name,
                type: type,
                unitComposition: unitComposition,
                move: move,
                toughness: toughness,
                save: save,
                invulnerableSave: invulnerableSave,
                wounds: wounds,
                leadership: leadership,
                objectiveCost: objectiveCost,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int factionId,
                required String name,
                required String type,
                required String unitComposition,
                required String move,
                required String toughness,
                required String save,
                Value<String?> invulnerableSave = const Value.absent(),
                required String wounds,
                required String leadership,
                required String objectiveCost,
              }) => UnitsCompanion.insert(
                id: id,
                factionId: factionId,
                name: name,
                type: type,
                unitComposition: unitComposition,
                move: move,
                toughness: toughness,
                save: save,
                invulnerableSave: invulnerableSave,
                wounds: wounds,
                leadership: leadership,
                objectiveCost: objectiveCost,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UnitsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                factionId = false,
                unitWeaponsRefs = false,
                unitAbilitiesRefs = false,
                unitKeywordsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (unitWeaponsRefs) db.unitWeapons,
                    if (unitAbilitiesRefs) db.unitAbilities,
                    if (unitKeywordsRefs) db.unitKeywords,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (factionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.factionId,
                                    referencedTable: $$UnitsTableReferences
                                        ._factionIdTable(db),
                                    referencedColumn: $$UnitsTableReferences
                                        ._factionIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (unitWeaponsRefs)
                        await $_getPrefetchedData<
                          Unit,
                          $UnitsTable,
                          UnitWeapon
                        >(
                          currentTable: table,
                          referencedTable: $$UnitsTableReferences
                              ._unitWeaponsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UnitsTableReferences(
                                db,
                                table,
                                p0,
                              ).unitWeaponsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.unitId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (unitAbilitiesRefs)
                        await $_getPrefetchedData<
                          Unit,
                          $UnitsTable,
                          UnitAbility
                        >(
                          currentTable: table,
                          referencedTable: $$UnitsTableReferences
                              ._unitAbilitiesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UnitsTableReferences(
                                db,
                                table,
                                p0,
                              ).unitAbilitiesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.unitId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (unitKeywordsRefs)
                        await $_getPrefetchedData<
                          Unit,
                          $UnitsTable,
                          UnitKeyword
                        >(
                          currentTable: table,
                          referencedTable: $$UnitsTableReferences
                              ._unitKeywordsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UnitsTableReferences(
                                db,
                                table,
                                p0,
                              ).unitKeywordsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.unitId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UnitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UnitsTable,
      Unit,
      $$UnitsTableFilterComposer,
      $$UnitsTableOrderingComposer,
      $$UnitsTableAnnotationComposer,
      $$UnitsTableCreateCompanionBuilder,
      $$UnitsTableUpdateCompanionBuilder,
      (Unit, $$UnitsTableReferences),
      Unit,
      PrefetchHooks Function({
        bool factionId,
        bool unitWeaponsRefs,
        bool unitAbilitiesRefs,
        bool unitKeywordsRefs,
      })
    >;
typedef $$WeaponsTableCreateCompanionBuilder =
    WeaponsCompanion Function({
      Value<int> id,
      required String name,
      required String weaponType,
      required String range,
      required String attacks,
      required String ballisticSkill,
      required String strength,
      required String armorPen,
      required String damage,
      Value<String?> specialRules,
    });
typedef $$WeaponsTableUpdateCompanionBuilder =
    WeaponsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> weaponType,
      Value<String> range,
      Value<String> attacks,
      Value<String> ballisticSkill,
      Value<String> strength,
      Value<String> armorPen,
      Value<String> damage,
      Value<String?> specialRules,
    });

final class $$WeaponsTableReferences
    extends BaseReferences<_$AppDatabase, $WeaponsTable, Weapon> {
  $$WeaponsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UnitWeaponsTable, List<UnitWeapon>>
  _unitWeaponsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.unitWeapons,
    aliasName: $_aliasNameGenerator(db.weapons.id, db.unitWeapons.weaponId),
  );

  $$UnitWeaponsTableProcessedTableManager get unitWeaponsRefs {
    final manager = $$UnitWeaponsTableTableManager(
      $_db,
      $_db.unitWeapons,
    ).filter((f) => f.weaponId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_unitWeaponsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$WeaponsTableFilterComposer
    extends Composer<_$AppDatabase, $WeaponsTable> {
  $$WeaponsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weaponType => $composableBuilder(
    column: $table.weaponType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get range => $composableBuilder(
    column: $table.range,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get attacks => $composableBuilder(
    column: $table.attacks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ballisticSkill => $composableBuilder(
    column: $table.ballisticSkill,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strength => $composableBuilder(
    column: $table.strength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get armorPen => $composableBuilder(
    column: $table.armorPen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get damage => $composableBuilder(
    column: $table.damage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specialRules => $composableBuilder(
    column: $table.specialRules,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> unitWeaponsRefs(
    Expression<bool> Function($$UnitWeaponsTableFilterComposer f) f,
  ) {
    final $$UnitWeaponsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.unitWeapons,
      getReferencedColumn: (t) => t.weaponId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitWeaponsTableFilterComposer(
            $db: $db,
            $table: $db.unitWeapons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WeaponsTableOrderingComposer
    extends Composer<_$AppDatabase, $WeaponsTable> {
  $$WeaponsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weaponType => $composableBuilder(
    column: $table.weaponType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get range => $composableBuilder(
    column: $table.range,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get attacks => $composableBuilder(
    column: $table.attacks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ballisticSkill => $composableBuilder(
    column: $table.ballisticSkill,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strength => $composableBuilder(
    column: $table.strength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get armorPen => $composableBuilder(
    column: $table.armorPen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get damage => $composableBuilder(
    column: $table.damage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specialRules => $composableBuilder(
    column: $table.specialRules,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WeaponsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WeaponsTable> {
  $$WeaponsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get weaponType => $composableBuilder(
    column: $table.weaponType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get range =>
      $composableBuilder(column: $table.range, builder: (column) => column);

  GeneratedColumn<String> get attacks =>
      $composableBuilder(column: $table.attacks, builder: (column) => column);

  GeneratedColumn<String> get ballisticSkill => $composableBuilder(
    column: $table.ballisticSkill,
    builder: (column) => column,
  );

  GeneratedColumn<String> get strength =>
      $composableBuilder(column: $table.strength, builder: (column) => column);

  GeneratedColumn<String> get armorPen =>
      $composableBuilder(column: $table.armorPen, builder: (column) => column);

  GeneratedColumn<String> get damage =>
      $composableBuilder(column: $table.damage, builder: (column) => column);

  GeneratedColumn<String> get specialRules => $composableBuilder(
    column: $table.specialRules,
    builder: (column) => column,
  );

  Expression<T> unitWeaponsRefs<T extends Object>(
    Expression<T> Function($$UnitWeaponsTableAnnotationComposer a) f,
  ) {
    final $$UnitWeaponsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.unitWeapons,
      getReferencedColumn: (t) => t.weaponId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitWeaponsTableAnnotationComposer(
            $db: $db,
            $table: $db.unitWeapons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WeaponsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WeaponsTable,
          Weapon,
          $$WeaponsTableFilterComposer,
          $$WeaponsTableOrderingComposer,
          $$WeaponsTableAnnotationComposer,
          $$WeaponsTableCreateCompanionBuilder,
          $$WeaponsTableUpdateCompanionBuilder,
          (Weapon, $$WeaponsTableReferences),
          Weapon,
          PrefetchHooks Function({bool unitWeaponsRefs})
        > {
  $$WeaponsTableTableManager(_$AppDatabase db, $WeaponsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeaponsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeaponsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeaponsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> weaponType = const Value.absent(),
                Value<String> range = const Value.absent(),
                Value<String> attacks = const Value.absent(),
                Value<String> ballisticSkill = const Value.absent(),
                Value<String> strength = const Value.absent(),
                Value<String> armorPen = const Value.absent(),
                Value<String> damage = const Value.absent(),
                Value<String?> specialRules = const Value.absent(),
              }) => WeaponsCompanion(
                id: id,
                name: name,
                weaponType: weaponType,
                range: range,
                attacks: attacks,
                ballisticSkill: ballisticSkill,
                strength: strength,
                armorPen: armorPen,
                damage: damage,
                specialRules: specialRules,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String weaponType,
                required String range,
                required String attacks,
                required String ballisticSkill,
                required String strength,
                required String armorPen,
                required String damage,
                Value<String?> specialRules = const Value.absent(),
              }) => WeaponsCompanion.insert(
                id: id,
                name: name,
                weaponType: weaponType,
                range: range,
                attacks: attacks,
                ballisticSkill: ballisticSkill,
                strength: strength,
                armorPen: armorPen,
                damage: damage,
                specialRules: specialRules,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WeaponsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({unitWeaponsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (unitWeaponsRefs) db.unitWeapons],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (unitWeaponsRefs)
                    await $_getPrefetchedData<
                      Weapon,
                      $WeaponsTable,
                      UnitWeapon
                    >(
                      currentTable: table,
                      referencedTable: $$WeaponsTableReferences
                          ._unitWeaponsRefsTable(db),
                      managerFromTypedResult: (p0) => $$WeaponsTableReferences(
                        db,
                        table,
                        p0,
                      ).unitWeaponsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.weaponId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$WeaponsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WeaponsTable,
      Weapon,
      $$WeaponsTableFilterComposer,
      $$WeaponsTableOrderingComposer,
      $$WeaponsTableAnnotationComposer,
      $$WeaponsTableCreateCompanionBuilder,
      $$WeaponsTableUpdateCompanionBuilder,
      (Weapon, $$WeaponsTableReferences),
      Weapon,
      PrefetchHooks Function({bool unitWeaponsRefs})
    >;
typedef $$AbilitiesTableCreateCompanionBuilder =
    AbilitiesCompanion Function({
      Value<int> id,
      required String name,
      required String description,
    });
typedef $$AbilitiesTableUpdateCompanionBuilder =
    AbilitiesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> description,
    });

final class $$AbilitiesTableReferences
    extends BaseReferences<_$AppDatabase, $AbilitiesTable, Ability> {
  $$AbilitiesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UnitAbilitiesTable, List<UnitAbility>>
  _unitAbilitiesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.unitAbilities,
    aliasName: $_aliasNameGenerator(
      db.abilities.id,
      db.unitAbilities.abilityId,
    ),
  );

  $$UnitAbilitiesTableProcessedTableManager get unitAbilitiesRefs {
    final manager = $$UnitAbilitiesTableTableManager(
      $_db,
      $_db.unitAbilities,
    ).filter((f) => f.abilityId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_unitAbilitiesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AbilitiesTableFilterComposer
    extends Composer<_$AppDatabase, $AbilitiesTable> {
  $$AbilitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> unitAbilitiesRefs(
    Expression<bool> Function($$UnitAbilitiesTableFilterComposer f) f,
  ) {
    final $$UnitAbilitiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.unitAbilities,
      getReferencedColumn: (t) => t.abilityId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitAbilitiesTableFilterComposer(
            $db: $db,
            $table: $db.unitAbilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AbilitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $AbilitiesTable> {
  $$AbilitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AbilitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AbilitiesTable> {
  $$AbilitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  Expression<T> unitAbilitiesRefs<T extends Object>(
    Expression<T> Function($$UnitAbilitiesTableAnnotationComposer a) f,
  ) {
    final $$UnitAbilitiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.unitAbilities,
      getReferencedColumn: (t) => t.abilityId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitAbilitiesTableAnnotationComposer(
            $db: $db,
            $table: $db.unitAbilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AbilitiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AbilitiesTable,
          Ability,
          $$AbilitiesTableFilterComposer,
          $$AbilitiesTableOrderingComposer,
          $$AbilitiesTableAnnotationComposer,
          $$AbilitiesTableCreateCompanionBuilder,
          $$AbilitiesTableUpdateCompanionBuilder,
          (Ability, $$AbilitiesTableReferences),
          Ability,
          PrefetchHooks Function({bool unitAbilitiesRefs})
        > {
  $$AbilitiesTableTableManager(_$AppDatabase db, $AbilitiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AbilitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AbilitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AbilitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
              }) => AbilitiesCompanion(
                id: id,
                name: name,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String description,
              }) => AbilitiesCompanion.insert(
                id: id,
                name: name,
                description: description,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AbilitiesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({unitAbilitiesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (unitAbilitiesRefs) db.unitAbilities,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (unitAbilitiesRefs)
                    await $_getPrefetchedData<
                      Ability,
                      $AbilitiesTable,
                      UnitAbility
                    >(
                      currentTable: table,
                      referencedTable: $$AbilitiesTableReferences
                          ._unitAbilitiesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$AbilitiesTableReferences(
                            db,
                            table,
                            p0,
                          ).unitAbilitiesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.abilityId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AbilitiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AbilitiesTable,
      Ability,
      $$AbilitiesTableFilterComposer,
      $$AbilitiesTableOrderingComposer,
      $$AbilitiesTableAnnotationComposer,
      $$AbilitiesTableCreateCompanionBuilder,
      $$AbilitiesTableUpdateCompanionBuilder,
      (Ability, $$AbilitiesTableReferences),
      Ability,
      PrefetchHooks Function({bool unitAbilitiesRefs})
    >;
typedef $$KeywordsTableCreateCompanionBuilder =
    KeywordsCompanion Function({Value<int> id, required String name});
typedef $$KeywordsTableUpdateCompanionBuilder =
    KeywordsCompanion Function({Value<int> id, Value<String> name});

final class $$KeywordsTableReferences
    extends BaseReferences<_$AppDatabase, $KeywordsTable, Keyword> {
  $$KeywordsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UnitKeywordsTable, List<UnitKeyword>>
  _unitKeywordsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.unitKeywords,
    aliasName: $_aliasNameGenerator(db.keywords.id, db.unitKeywords.keywordId),
  );

  $$UnitKeywordsTableProcessedTableManager get unitKeywordsRefs {
    final manager = $$UnitKeywordsTableTableManager(
      $_db,
      $_db.unitKeywords,
    ).filter((f) => f.keywordId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_unitKeywordsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$KeywordsTableFilterComposer
    extends Composer<_$AppDatabase, $KeywordsTable> {
  $$KeywordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> unitKeywordsRefs(
    Expression<bool> Function($$UnitKeywordsTableFilterComposer f) f,
  ) {
    final $$UnitKeywordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.unitKeywords,
      getReferencedColumn: (t) => t.keywordId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitKeywordsTableFilterComposer(
            $db: $db,
            $table: $db.unitKeywords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$KeywordsTableOrderingComposer
    extends Composer<_$AppDatabase, $KeywordsTable> {
  $$KeywordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$KeywordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $KeywordsTable> {
  $$KeywordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> unitKeywordsRefs<T extends Object>(
    Expression<T> Function($$UnitKeywordsTableAnnotationComposer a) f,
  ) {
    final $$UnitKeywordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.unitKeywords,
      getReferencedColumn: (t) => t.keywordId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitKeywordsTableAnnotationComposer(
            $db: $db,
            $table: $db.unitKeywords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$KeywordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $KeywordsTable,
          Keyword,
          $$KeywordsTableFilterComposer,
          $$KeywordsTableOrderingComposer,
          $$KeywordsTableAnnotationComposer,
          $$KeywordsTableCreateCompanionBuilder,
          $$KeywordsTableUpdateCompanionBuilder,
          (Keyword, $$KeywordsTableReferences),
          Keyword,
          PrefetchHooks Function({bool unitKeywordsRefs})
        > {
  $$KeywordsTableTableManager(_$AppDatabase db, $KeywordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KeywordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KeywordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KeywordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => KeywordsCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  KeywordsCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$KeywordsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({unitKeywordsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (unitKeywordsRefs) db.unitKeywords],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (unitKeywordsRefs)
                    await $_getPrefetchedData<
                      Keyword,
                      $KeywordsTable,
                      UnitKeyword
                    >(
                      currentTable: table,
                      referencedTable: $$KeywordsTableReferences
                          ._unitKeywordsRefsTable(db),
                      managerFromTypedResult: (p0) => $$KeywordsTableReferences(
                        db,
                        table,
                        p0,
                      ).unitKeywordsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.keywordId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$KeywordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $KeywordsTable,
      Keyword,
      $$KeywordsTableFilterComposer,
      $$KeywordsTableOrderingComposer,
      $$KeywordsTableAnnotationComposer,
      $$KeywordsTableCreateCompanionBuilder,
      $$KeywordsTableUpdateCompanionBuilder,
      (Keyword, $$KeywordsTableReferences),
      Keyword,
      PrefetchHooks Function({bool unitKeywordsRefs})
    >;
typedef $$UnitWeaponsTableCreateCompanionBuilder =
    UnitWeaponsCompanion Function({
      required int unitId,
      required int weaponId,
      Value<int> rowid,
    });
typedef $$UnitWeaponsTableUpdateCompanionBuilder =
    UnitWeaponsCompanion Function({
      Value<int> unitId,
      Value<int> weaponId,
      Value<int> rowid,
    });

final class $$UnitWeaponsTableReferences
    extends BaseReferences<_$AppDatabase, $UnitWeaponsTable, UnitWeapon> {
  $$UnitWeaponsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UnitsTable _unitIdTable(_$AppDatabase db) => db.units.createAlias(
    $_aliasNameGenerator(db.unitWeapons.unitId, db.units.id),
  );

  $$UnitsTableProcessedTableManager get unitId {
    final $_column = $_itemColumn<int>('unit_id')!;

    final manager = $$UnitsTableTableManager(
      $_db,
      $_db.units,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_unitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $WeaponsTable _weaponIdTable(_$AppDatabase db) =>
      db.weapons.createAlias(
        $_aliasNameGenerator(db.unitWeapons.weaponId, db.weapons.id),
      );

  $$WeaponsTableProcessedTableManager get weaponId {
    final $_column = $_itemColumn<int>('weapon_id')!;

    final manager = $$WeaponsTableTableManager(
      $_db,
      $_db.weapons,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_weaponIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UnitWeaponsTableFilterComposer
    extends Composer<_$AppDatabase, $UnitWeaponsTable> {
  $$UnitWeaponsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$UnitsTableFilterComposer get unitId {
    final $$UnitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableFilterComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WeaponsTableFilterComposer get weaponId {
    final $$WeaponsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weaponId,
      referencedTable: $db.weapons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeaponsTableFilterComposer(
            $db: $db,
            $table: $db.weapons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UnitWeaponsTableOrderingComposer
    extends Composer<_$AppDatabase, $UnitWeaponsTable> {
  $$UnitWeaponsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$UnitsTableOrderingComposer get unitId {
    final $$UnitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableOrderingComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WeaponsTableOrderingComposer get weaponId {
    final $$WeaponsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weaponId,
      referencedTable: $db.weapons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeaponsTableOrderingComposer(
            $db: $db,
            $table: $db.weapons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UnitWeaponsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UnitWeaponsTable> {
  $$UnitWeaponsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$UnitsTableAnnotationComposer get unitId {
    final $$UnitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableAnnotationComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WeaponsTableAnnotationComposer get weaponId {
    final $$WeaponsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.weaponId,
      referencedTable: $db.weapons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeaponsTableAnnotationComposer(
            $db: $db,
            $table: $db.weapons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UnitWeaponsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UnitWeaponsTable,
          UnitWeapon,
          $$UnitWeaponsTableFilterComposer,
          $$UnitWeaponsTableOrderingComposer,
          $$UnitWeaponsTableAnnotationComposer,
          $$UnitWeaponsTableCreateCompanionBuilder,
          $$UnitWeaponsTableUpdateCompanionBuilder,
          (UnitWeapon, $$UnitWeaponsTableReferences),
          UnitWeapon,
          PrefetchHooks Function({bool unitId, bool weaponId})
        > {
  $$UnitWeaponsTableTableManager(_$AppDatabase db, $UnitWeaponsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UnitWeaponsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UnitWeaponsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UnitWeaponsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> unitId = const Value.absent(),
                Value<int> weaponId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UnitWeaponsCompanion(
                unitId: unitId,
                weaponId: weaponId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int unitId,
                required int weaponId,
                Value<int> rowid = const Value.absent(),
              }) => UnitWeaponsCompanion.insert(
                unitId: unitId,
                weaponId: weaponId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UnitWeaponsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({unitId = false, weaponId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (unitId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.unitId,
                                referencedTable: $$UnitWeaponsTableReferences
                                    ._unitIdTable(db),
                                referencedColumn: $$UnitWeaponsTableReferences
                                    ._unitIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (weaponId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.weaponId,
                                referencedTable: $$UnitWeaponsTableReferences
                                    ._weaponIdTable(db),
                                referencedColumn: $$UnitWeaponsTableReferences
                                    ._weaponIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UnitWeaponsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UnitWeaponsTable,
      UnitWeapon,
      $$UnitWeaponsTableFilterComposer,
      $$UnitWeaponsTableOrderingComposer,
      $$UnitWeaponsTableAnnotationComposer,
      $$UnitWeaponsTableCreateCompanionBuilder,
      $$UnitWeaponsTableUpdateCompanionBuilder,
      (UnitWeapon, $$UnitWeaponsTableReferences),
      UnitWeapon,
      PrefetchHooks Function({bool unitId, bool weaponId})
    >;
typedef $$UnitAbilitiesTableCreateCompanionBuilder =
    UnitAbilitiesCompanion Function({
      required int unitId,
      required int abilityId,
      Value<int> rowid,
    });
typedef $$UnitAbilitiesTableUpdateCompanionBuilder =
    UnitAbilitiesCompanion Function({
      Value<int> unitId,
      Value<int> abilityId,
      Value<int> rowid,
    });

final class $$UnitAbilitiesTableReferences
    extends BaseReferences<_$AppDatabase, $UnitAbilitiesTable, UnitAbility> {
  $$UnitAbilitiesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UnitsTable _unitIdTable(_$AppDatabase db) => db.units.createAlias(
    $_aliasNameGenerator(db.unitAbilities.unitId, db.units.id),
  );

  $$UnitsTableProcessedTableManager get unitId {
    final $_column = $_itemColumn<int>('unit_id')!;

    final manager = $$UnitsTableTableManager(
      $_db,
      $_db.units,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_unitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AbilitiesTable _abilityIdTable(_$AppDatabase db) =>
      db.abilities.createAlias(
        $_aliasNameGenerator(db.unitAbilities.abilityId, db.abilities.id),
      );

  $$AbilitiesTableProcessedTableManager get abilityId {
    final $_column = $_itemColumn<int>('ability_id')!;

    final manager = $$AbilitiesTableTableManager(
      $_db,
      $_db.abilities,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_abilityIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UnitAbilitiesTableFilterComposer
    extends Composer<_$AppDatabase, $UnitAbilitiesTable> {
  $$UnitAbilitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$UnitsTableFilterComposer get unitId {
    final $$UnitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableFilterComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AbilitiesTableFilterComposer get abilityId {
    final $$AbilitiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.abilityId,
      referencedTable: $db.abilities,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AbilitiesTableFilterComposer(
            $db: $db,
            $table: $db.abilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UnitAbilitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $UnitAbilitiesTable> {
  $$UnitAbilitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$UnitsTableOrderingComposer get unitId {
    final $$UnitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableOrderingComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AbilitiesTableOrderingComposer get abilityId {
    final $$AbilitiesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.abilityId,
      referencedTable: $db.abilities,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AbilitiesTableOrderingComposer(
            $db: $db,
            $table: $db.abilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UnitAbilitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UnitAbilitiesTable> {
  $$UnitAbilitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$UnitsTableAnnotationComposer get unitId {
    final $$UnitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableAnnotationComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AbilitiesTableAnnotationComposer get abilityId {
    final $$AbilitiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.abilityId,
      referencedTable: $db.abilities,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AbilitiesTableAnnotationComposer(
            $db: $db,
            $table: $db.abilities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UnitAbilitiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UnitAbilitiesTable,
          UnitAbility,
          $$UnitAbilitiesTableFilterComposer,
          $$UnitAbilitiesTableOrderingComposer,
          $$UnitAbilitiesTableAnnotationComposer,
          $$UnitAbilitiesTableCreateCompanionBuilder,
          $$UnitAbilitiesTableUpdateCompanionBuilder,
          (UnitAbility, $$UnitAbilitiesTableReferences),
          UnitAbility,
          PrefetchHooks Function({bool unitId, bool abilityId})
        > {
  $$UnitAbilitiesTableTableManager(_$AppDatabase db, $UnitAbilitiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UnitAbilitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UnitAbilitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UnitAbilitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> unitId = const Value.absent(),
                Value<int> abilityId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UnitAbilitiesCompanion(
                unitId: unitId,
                abilityId: abilityId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int unitId,
                required int abilityId,
                Value<int> rowid = const Value.absent(),
              }) => UnitAbilitiesCompanion.insert(
                unitId: unitId,
                abilityId: abilityId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UnitAbilitiesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({unitId = false, abilityId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (unitId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.unitId,
                                referencedTable: $$UnitAbilitiesTableReferences
                                    ._unitIdTable(db),
                                referencedColumn: $$UnitAbilitiesTableReferences
                                    ._unitIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (abilityId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.abilityId,
                                referencedTable: $$UnitAbilitiesTableReferences
                                    ._abilityIdTable(db),
                                referencedColumn: $$UnitAbilitiesTableReferences
                                    ._abilityIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UnitAbilitiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UnitAbilitiesTable,
      UnitAbility,
      $$UnitAbilitiesTableFilterComposer,
      $$UnitAbilitiesTableOrderingComposer,
      $$UnitAbilitiesTableAnnotationComposer,
      $$UnitAbilitiesTableCreateCompanionBuilder,
      $$UnitAbilitiesTableUpdateCompanionBuilder,
      (UnitAbility, $$UnitAbilitiesTableReferences),
      UnitAbility,
      PrefetchHooks Function({bool unitId, bool abilityId})
    >;
typedef $$UnitKeywordsTableCreateCompanionBuilder =
    UnitKeywordsCompanion Function({
      required int unitId,
      required int keywordId,
      Value<int> rowid,
    });
typedef $$UnitKeywordsTableUpdateCompanionBuilder =
    UnitKeywordsCompanion Function({
      Value<int> unitId,
      Value<int> keywordId,
      Value<int> rowid,
    });

final class $$UnitKeywordsTableReferences
    extends BaseReferences<_$AppDatabase, $UnitKeywordsTable, UnitKeyword> {
  $$UnitKeywordsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UnitsTable _unitIdTable(_$AppDatabase db) => db.units.createAlias(
    $_aliasNameGenerator(db.unitKeywords.unitId, db.units.id),
  );

  $$UnitsTableProcessedTableManager get unitId {
    final $_column = $_itemColumn<int>('unit_id')!;

    final manager = $$UnitsTableTableManager(
      $_db,
      $_db.units,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_unitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $KeywordsTable _keywordIdTable(_$AppDatabase db) =>
      db.keywords.createAlias(
        $_aliasNameGenerator(db.unitKeywords.keywordId, db.keywords.id),
      );

  $$KeywordsTableProcessedTableManager get keywordId {
    final $_column = $_itemColumn<int>('keyword_id')!;

    final manager = $$KeywordsTableTableManager(
      $_db,
      $_db.keywords,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_keywordIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UnitKeywordsTableFilterComposer
    extends Composer<_$AppDatabase, $UnitKeywordsTable> {
  $$UnitKeywordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$UnitsTableFilterComposer get unitId {
    final $$UnitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableFilterComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$KeywordsTableFilterComposer get keywordId {
    final $$KeywordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.keywordId,
      referencedTable: $db.keywords,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KeywordsTableFilterComposer(
            $db: $db,
            $table: $db.keywords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UnitKeywordsTableOrderingComposer
    extends Composer<_$AppDatabase, $UnitKeywordsTable> {
  $$UnitKeywordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$UnitsTableOrderingComposer get unitId {
    final $$UnitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableOrderingComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$KeywordsTableOrderingComposer get keywordId {
    final $$KeywordsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.keywordId,
      referencedTable: $db.keywords,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KeywordsTableOrderingComposer(
            $db: $db,
            $table: $db.keywords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UnitKeywordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UnitKeywordsTable> {
  $$UnitKeywordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$UnitsTableAnnotationComposer get unitId {
    final $$UnitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableAnnotationComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$KeywordsTableAnnotationComposer get keywordId {
    final $$KeywordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.keywordId,
      referencedTable: $db.keywords,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$KeywordsTableAnnotationComposer(
            $db: $db,
            $table: $db.keywords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UnitKeywordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UnitKeywordsTable,
          UnitKeyword,
          $$UnitKeywordsTableFilterComposer,
          $$UnitKeywordsTableOrderingComposer,
          $$UnitKeywordsTableAnnotationComposer,
          $$UnitKeywordsTableCreateCompanionBuilder,
          $$UnitKeywordsTableUpdateCompanionBuilder,
          (UnitKeyword, $$UnitKeywordsTableReferences),
          UnitKeyword,
          PrefetchHooks Function({bool unitId, bool keywordId})
        > {
  $$UnitKeywordsTableTableManager(_$AppDatabase db, $UnitKeywordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UnitKeywordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UnitKeywordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UnitKeywordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> unitId = const Value.absent(),
                Value<int> keywordId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UnitKeywordsCompanion(
                unitId: unitId,
                keywordId: keywordId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int unitId,
                required int keywordId,
                Value<int> rowid = const Value.absent(),
              }) => UnitKeywordsCompanion.insert(
                unitId: unitId,
                keywordId: keywordId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UnitKeywordsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({unitId = false, keywordId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (unitId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.unitId,
                                referencedTable: $$UnitKeywordsTableReferences
                                    ._unitIdTable(db),
                                referencedColumn: $$UnitKeywordsTableReferences
                                    ._unitIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (keywordId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.keywordId,
                                referencedTable: $$UnitKeywordsTableReferences
                                    ._keywordIdTable(db),
                                referencedColumn: $$UnitKeywordsTableReferences
                                    ._keywordIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UnitKeywordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UnitKeywordsTable,
      UnitKeyword,
      $$UnitKeywordsTableFilterComposer,
      $$UnitKeywordsTableOrderingComposer,
      $$UnitKeywordsTableAnnotationComposer,
      $$UnitKeywordsTableCreateCompanionBuilder,
      $$UnitKeywordsTableUpdateCompanionBuilder,
      (UnitKeyword, $$UnitKeywordsTableReferences),
      UnitKeyword,
      PrefetchHooks Function({bool unitId, bool keywordId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FactionsTableTableManager get factions =>
      $$FactionsTableTableManager(_db, _db.factions);
  $$UnitsTableTableManager get units =>
      $$UnitsTableTableManager(_db, _db.units);
  $$WeaponsTableTableManager get weapons =>
      $$WeaponsTableTableManager(_db, _db.weapons);
  $$AbilitiesTableTableManager get abilities =>
      $$AbilitiesTableTableManager(_db, _db.abilities);
  $$KeywordsTableTableManager get keywords =>
      $$KeywordsTableTableManager(_db, _db.keywords);
  $$UnitWeaponsTableTableManager get unitWeapons =>
      $$UnitWeaponsTableTableManager(_db, _db.unitWeapons);
  $$UnitAbilitiesTableTableManager get unitAbilities =>
      $$UnitAbilitiesTableTableManager(_db, _db.unitAbilities);
  $$UnitKeywordsTableTableManager get unitKeywords =>
      $$UnitKeywordsTableTableManager(_db, _db.unitKeywords);
}
