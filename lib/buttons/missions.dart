import 'package:flutter/material.dart';
import '../data/z_missions/mission_card.dart';
import '../data/z_missions/mission_model.dart';
import '../data/z_missions/leviathan.dart';
import '../screens/army_storage.dart';
import 'dart:math' as math;

class MissionsButton extends StatelessWidget {
  final String currentCategory;
  final VoidCallback onPressed;
  const MissionsButton({super.key, required this.currentCategory, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final isSelected = currentCategory == 'Missions';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
            colors: [Colors.black, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
              : null,
          color: isSelected ? null : Colors.grey[850],
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(color: Colors.white, width: 1.5)
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
                Icons.flag,
                size: 18,
                color: isSelected ? Colors.white : Colors.grey[300],
              ),
              const SizedBox(width: 8),
              Text(
                'Missions',
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

class GeneratedMission {
  final MissionMap map;
  final MissionRule rule;
  final PrimaryMission primary;

  const GeneratedMission({
    required this.map,
    required this.rule,
    required this.primary,
  });
}

class MissionsContent extends StatefulWidget {
  final String currentFaction;

  const MissionsContent({
    super.key,
    this.currentFaction = '',
  });

  @override
  State<MissionsContent> createState() => _MissionsContentState();
}

class _MissionsContentState extends State<MissionsContent> {
  final List<MissionPack> _packs = const [leviathanPack];
  final math.Random _random = math.Random();

  int _packIndex = 0;
  GeneratedMission? _generatedMission;
  List<SecondaryMission> _currentSecondaries = [];
  Set<String> _usedSecondaryIds = {};

  // Размеры стола в дюймах
  double _tableW = 44;
  double _tableH = 60;
  final _wCtrl = TextEditingController(text: '44');
  final _hCtrl = TextEditingController(text: '60');

  bool _openRules = false;
  bool _openPrimaries = false;
  bool _openSecondaries = false;
  bool _openGambits = false;
  bool _openMaps = false;
  bool _openGenerated = false;
  bool _openSecondary = false;

  @override
  void initState() {
    super.initState();
    _loadSavedState();
  }

  @override
  void dispose() {
    _wCtrl.dispose();
    _hCtrl.dispose();
    super.dispose();
  }

  /// Загрузка сохраненного состояния
  Future<void> _loadSavedState() async {
    try {
      // Загружаем индекс пака миссий
      final packIndex = await ArmyStorage.loadMissionPackIndex();

      // Загружаем сгенерированную миссию
      final savedMission = await ArmyStorage.loadGeneratedMission();

      // Загружаем использованные ID вторичных миссий
      final usedIds = await ArmyStorage.loadUsedSecondaryIds();

      // Загружаем текущие вторичные миссии
      final secondaryIds = await ArmyStorage.loadCurrentSecondaries();

      setState(() {
        _packIndex = packIndex.clamp(0, _packs.length - 1);
        _usedSecondaryIds = usedIds;

        // Восстанавливаем сгенерированную миссию
        if (savedMission != null) {
          _generatedMission = _restoreGeneratedMission(savedMission);
          _openGenerated = _generatedMission != null;
        }

        // Восстанавливаем вторичные миссии
        if (secondaryIds.isNotEmpty) {
          _currentSecondaries = _restoreSecondaryMissions(secondaryIds);
          _openSecondary = _currentSecondaries.isNotEmpty;
        }
      });
    } catch (e) {
      // В случае ошибки продолжаем с дефолтными значениями
      print('Error loading saved mission state: $e');
    }
  }

  /// Восстановление сгенерированной миссии из сохраненных данных
  GeneratedMission? _restoreGeneratedMission(Map<String, String> savedData) {
    try {
      final pack = _packs[_packIndex];

      final mapId = savedData['mapId'];
      final ruleId = savedData['ruleId'];
      final primaryId = savedData['primaryId'];

      if (mapId == null || ruleId == null || primaryId == null) return null;

      final map = pack.maps.where((m) => m.id == mapId).firstOrNull;
      final rule = pack.rules.where((r) => r.id == ruleId).firstOrNull;
      final primary = pack.primaries.where((p) => p.id == primaryId).firstOrNull;

      if (map == null || rule == null || primary == null) return null;

      return GeneratedMission(map: map, rule: rule, primary: primary);
    } catch (e) {
      return null;
    }
  }

  /// Восстановление вторичных миссий из сохраненных ID
  List<SecondaryMission> _restoreSecondaryMissions(List<String> secondaryIds) {
    try {
      final pack = _packs[_packIndex];
      final List<SecondaryMission> missions = [];

      for (final id in secondaryIds) {
        final mission = pack.secondaries.where((s) => s.id == id).firstOrNull;
        if (mission != null) {
          missions.add(mission);
        }
      }

      return missions;
    } catch (e) {
      return [];
    }
  }

  /// Сохранение сгенерированной миссии
  Future<void> _saveGeneratedMission() async {
    if (_generatedMission == null) {
      await ArmyStorage.clearGeneratedMission();
      return;
    }

    final missionData = {
      'mapId': _generatedMission!.map.id,
      'ruleId': _generatedMission!.rule.id,
      'primaryId': _generatedMission!.primary.id,
    };

    await ArmyStorage.saveGeneratedMission(missionData);
  }

  /// Сохранение вторичных миссий
  Future<void> _saveSecondaryMissions() async {
    final secondaryIds = _currentSecondaries.map((s) => s.id).toList();
    await ArmyStorage.saveCurrentSecondaries(secondaryIds);
    await ArmyStorage.saveUsedSecondaryIds(_usedSecondaryIds);
  }

  void _generateRandomMission() async {
    final pack = _packs[_packIndex];

    if (pack.maps.isEmpty || pack.rules.isEmpty || pack.primaries.isEmpty) {
      return;
    }

    final randomMap = pack.maps[_random.nextInt(pack.maps.length)];
    final randomRule = pack.rules[_random.nextInt(pack.rules.length)];
    final randomPrimary = pack.primaries[_random.nextInt(pack.primaries.length)];

    setState(() {
      _generatedMission = GeneratedMission(
        map: randomMap,
        rule: randomRule,
        primary: randomPrimary,
      );
      _openGenerated = true;
    });

    // Сохраняем сгенерированную миссию
    await _saveGeneratedMission();
  }

  void _selectManualMission() async {
    final pack = _packs[_packIndex];
    if (pack.maps.isEmpty || pack.rules.isEmpty || pack.primaries.isEmpty) {
      return;
    }

    MissionMap? selectedMap;
    MissionRule? selectedRule;
    PrimaryMission? selectedPrimary;

    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Select Mission Components'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Map:'),
                    DropdownButton<MissionMap>(
                      value: selectedMap,
                      hint: const Text('Select Map'),
                      isExpanded: true,
                      items: pack.maps.map((m) => DropdownMenuItem<MissionMap>(
                        value: m,
                        child: Text(m.name),
                      )).toList(),
                      onChanged: (value) => setDialogState(() => selectedMap = value),
                    ),
                    const SizedBox(height: 16),
                    const Text('Rule:'),
                    DropdownButton<MissionRule>(
                      value: selectedRule,
                      hint: const Text('Select Rule'),
                      isExpanded: true,
                      items: pack.rules.map((r) => DropdownMenuItem<MissionRule>(
                        value: r,
                        child: Text(r.name),
                      )).toList(),
                      onChanged: (value) => setDialogState(() => selectedRule = value),
                    ),
                    const SizedBox(height: 16),
                    const Text('Primary:'),
                    DropdownButton<PrimaryMission>(
                      value: selectedPrimary,
                      hint: const Text('Select Primary'),
                      isExpanded: true,
                      items: pack.primaries.map((p) => DropdownMenuItem<PrimaryMission>(
                        value: p,
                        child: Text(p.name),
                      )).toList(),
                      onChanged: (value) => setDialogState(() => selectedPrimary = value),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (selectedMap != null && selectedRule != null && selectedPrimary != null) {
                      setState(() {
                        _generatedMission = GeneratedMission(
                          map: selectedMap!,
                          rule: selectedRule!,
                          primary: selectedPrimary!,
                        );
                        _openGenerated = true;
                      });
                      _saveGeneratedMission();
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Confirm'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _generateRandomSecondaries() async {
    final pack = _packs[_packIndex];
    var remaining = pack.secondaries.where((s) => !_usedSecondaryIds.contains(s.id)).toList();
    if (remaining.length < 2) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Not enough remaining secondaries')));
      return;
    }
    remaining.shuffle();
    final newSecondaries = remaining.take(2).toList();
    setState(() {
      _currentSecondaries = newSecondaries;
      for (var s in newSecondaries) _usedSecondaryIds.add(s.id);
      _openSecondary = true;
    });

    // Сохраняем вторичные миссии
    await _saveSecondaryMissions();
  }

  void _regenerateOne(int index) async {
    if (index < 0 || index >= _currentSecondaries.length) return;
    final removed = _currentSecondaries.removeAt(index);
    var remaining = _packs[_packIndex].secondaries.where((s) => !_usedSecondaryIds.contains(s.id)).toList();
    if (remaining.isEmpty) {
      _currentSecondaries.insert(index, removed);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No remaining secondaries')));
      return;
    }
    remaining.shuffle();
    final newOne = remaining.first;
    _usedSecondaryIds.add(newOne.id);
    setState(() {
      _currentSecondaries.insert(index, newOne);
    });

    // Сохраняем обновленные вторичные миссии
    await _saveSecondaryMissions();
  }

  void _selectManualSecondaries() async {
    final pack = _packs[_packIndex];
    SecondaryMission? selected1;
    SecondaryMission? selected2;

    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Select Secondaries'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Secondary 1:'),
                    DropdownButton<SecondaryMission>(
                      value: selected1,
                      hint: const Text('Select'),
                      isExpanded: true,
                      items: pack.secondaries.map((s) => DropdownMenuItem<SecondaryMission>(
                        value: s,
                        child: Text(s.name),
                      )).toList(),
                      onChanged: (value) => setDialogState(() => selected1 = value),
                    ),
                    const SizedBox(height: 16),
                    const Text('Secondary 2:'),
                    DropdownButton<SecondaryMission>(
                      value: selected2,
                      hint: const Text('Select'),
                      isExpanded: true,
                      items: pack.secondaries.map((s) => DropdownMenuItem<SecondaryMission>(
                        value: s,
                        child: Text(s.name),
                      )).toList(),
                      onChanged: (value) => setDialogState(() => selected2 = value),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (selected1 != null && selected2 != null) {
                      setState(() {
                        _currentSecondaries = [selected1!, selected2!];
                        _usedSecondaryIds.add(selected1!.id);
                        _usedSecondaryIds.add(selected2!.id);
                        _openSecondary = true;
                      });
                      _saveSecondaryMissions();
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Confirm'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _restartSecondaries() async {
    setState(() {
      _currentSecondaries = [];
      _usedSecondaryIds.clear();
      _openSecondary = false;
    });

    // Очищаем сохраненные вторичные миссии
    await ArmyStorage.restartSecondariesSystem();
  }

  void _changePack(int newPackIndex) async {
    setState(() {
      _packIndex = newPackIndex;
      _generatedMission = null;
      _currentSecondaries = [];
      _usedSecondaryIds.clear();
      _openGenerated = false;
      _openSecondary = false;
    });

    // Сохраняем новый индекс пака и очищаем данные миссий
    await ArmyStorage.saveMissionPackIndex(newPackIndex);
    await ArmyStorage.clearAllMissionData();
  }

  @override
  Widget build(BuildContext context) {
    final pack = _packs[_packIndex];
    final rules = pack.rules;
    final primaries = pack.primaries;
    final secondaries = pack.secondaries;
    final gambits = pack.gambits;
    final maps = pack.maps;

    return Column(
      children: [
        // Выбор пака миссий
        SizedBox(
          height: 56,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            scrollDirection: Axis.horizontal,
            itemCount: _packs.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (_, i) => ChoiceChip(
              label: Text(_packs[i].title),
              selected: i == _packIndex,
              onSelected: (_) => _changePack(i),
            ),
          ),
        ),
        // Настройки размеров стола
        SizedBox(
          height: 64,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
            child: Row(
              children: [
                const Text('Table Size:', style: TextStyle(color: Colors.white70)),
                const SizedBox(width: 12),
                _SizeField(
                    label: 'W',
                    controller: _wCtrl,
                    onChanged: (v) => setState(() => _tableW = _parseDim(v, _tableW))
                ),
                const SizedBox(width: 8),
                _SizeField(
                    label: 'H',
                    controller: _hCtrl,
                    onChanged: (v) => setState(() => _tableH = _parseDim(v, _tableH))
                ),
                const SizedBox(width: 8),
                Text('inches', style: TextStyle(color: Colors.white54, fontSize: 12)),
              ],
            ),
          ),
        ),
        const Divider(height: 0),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(12),
            children: [
              // Primary Mission Generator
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFF4A1B2D),
                  border: Border.all(color: Colors.pink[400]!, width: 1.5),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 8,
                      offset: Offset(0, 2),
                      color: Colors.black26,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Mission Generator',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 0.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),

                    // Generated Mission Display
                    if (_generatedMission != null) ...[
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black26,
                          border: Border.all(color: Colors.white24, width: 1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Generated Mission:',
                              style: TextStyle(
                                color: Colors.pink[200],
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            _buildGeneratedItem('Map', _generatedMission!.map.name, Icons.map),
                            const SizedBox(height: 4),
                            _buildGeneratedItem('Rule', _generatedMission!.rule.name, Icons.rule),
                            const SizedBox(height: 4),
                            _buildGeneratedItem('Primary', _generatedMission!.primary.name, Icons.star),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],

                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _generateRandomMission,
                            icon: const Icon(Icons.play_arrow, size: 18),
                            label: Text(_generatedMission == null ? 'Start Game' : 'Regenerate'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink[600],
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        if (_generatedMission != null) ...[
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: _selectManualMission,
                            icon: const Icon(Icons.edit, color: Colors.white70),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.pink[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              // Secondary Mission Generator
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFF4A1B2D),
                  border: Border.all(color: Colors.pink[400]!, width: 1.5),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 8,
                      offset: Offset(0, 2),
                      color: Colors.black26,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Secondary Mission Generator',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 0.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),

                    // Generated Secondaries Display
                    if (_currentSecondaries.isNotEmpty) ...[
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black26,
                          border: Border.all(color: Colors.white24, width: 1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Generated Secondaries:',
                              style: TextStyle(
                                color: Colors.pink[200],
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            for (int i = 0; i < _currentSecondaries.length; i++) ...[
                              _buildGeneratedItem(
                                'Secondary ${i + 1}',
                                _currentSecondaries[i].name,
                                Icons.security,
                                onRegenerate: () => _regenerateOne(i),
                              ),
                              if (i < _currentSecondaries.length - 1) const SizedBox(height: 4),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],

                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _generateRandomSecondaries,
                            icon: const Icon(Icons.play_arrow, size: 18),
                            label: Text(_currentSecondaries.isEmpty ? 'Draw Secondaries' : 'Regenerate All'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink[600],
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        if (_currentSecondaries.isNotEmpty) ...[
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: _selectManualSecondaries,
                            icon: const Icon(Icons.edit, color: Colors.white70),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.pink[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: _restartSecondaries,
                            icon: const Icon(Icons.restart_alt, color: Colors.white70),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.pink[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),

              // Show generated mission details if available
              if (_generatedMission != null) ...[
                _CollapsibleSection(
                  title: 'Generated Mission Details',
                  isOpen: _openGenerated,
                  onToggle: () => setState(() => _openGenerated = !_openGenerated),
                  children: [
                    MissionCard.fromModel(_generatedMission!.map, width: 360, tableWInches: _tableW, tableHInches: _tableH),
                    MissionCard.fromModel(_generatedMission!.rule, width: 360),
                    MissionCard.fromModel(_generatedMission!.primary, width: 360),
                  ],
                ),
              ],
              // Show generated secondary details if available
              if (_currentSecondaries.isNotEmpty) ...[
                _CollapsibleSection(
                  title: 'Generated Secondary Details',
                  isOpen: _openSecondary,
                  onToggle: () => setState(() => _openSecondary = !_openSecondary),
                  children: _currentSecondaries.map((s) => MissionCard.fromModel(s, width: 360)).toList(),
                ),
              ],

              // Mission Rules
              if (rules.isNotEmpty)
                _CollapsibleSection(
                  title: 'Mission Rules',
                  isOpen: _openRules,
                  onToggle: () => setState(() => _openRules = !_openRules),
                  children: rules.map((r) => MissionCard.fromModel(r, width: 360)).toList(),
                ),

              // Primary Missions
              if (primaries.isNotEmpty)
                _CollapsibleSection(
                  title: 'Primary Missions',
                  isOpen: _openPrimaries,
                  onToggle: () => setState(() => _openPrimaries = !_openPrimaries),
                  children: primaries.map((p) => MissionCard.fromModel(p, width: 360)).toList(),
                ),

              // Secondary Missions
              if (secondaries.isNotEmpty)
                _CollapsibleSection(
                  title: 'Secondary Missions',
                  isOpen: _openSecondaries,
                  onToggle: () => setState(() => _openSecondaries = !_openSecondaries),
                  children: secondaries.map((s) => MissionCard.fromModel(s, width: 360)).toList(),
                ),

              // Gambits
              if (gambits.isNotEmpty)
                _CollapsibleSection(
                  title: 'Gambits',
                  isOpen: _openGambits,
                  onToggle: () => setState(() => _openGambits = !_openGambits),
                  children: gambits.map((g) => MissionCard.fromModel(g, width: 360)).toList(),
                ),

              // Mission Maps
              if (maps.isNotEmpty)
                _CollapsibleSection(
                  title: 'Mission Maps',
                  isOpen: _openMaps,
                  onToggle: () => setState(() => _openMaps = !_openMaps),
                  children: maps
                      .map((m) => MissionCard.fromModel(
                    m,
                    width: 360,
                    tableWInches: _tableW,
                    tableHInches: _tableH,
                  ))
                      .toList(),
                ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGeneratedItem(String type, String name, IconData icon, {VoidCallback? onRegenerate}) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.white70),
        const SizedBox(width: 8),
        Text(
          '$type: ',
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (onRegenerate != null)
          IconButton(
            icon: const Icon(Icons.refresh, size: 16, color: Colors.white70),
            onPressed: onRegenerate,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
      ],
    );
  }

  static double _parseDim(String v, double fallback) {
    final x = double.tryParse(v.replaceAll(',', '.'));
    return (x == null || x <= 0) ? fallback : x;
  }
}

class _CollapsibleSection extends StatelessWidget {
  final String title;
  final bool isOpen;
  final VoidCallback onToggle;
  final List<Widget> children;
  const _CollapsibleSection({
    required this.title,
    required this.isOpen,
    required this.onToggle,
    required this.children
  });

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _SectionButton(title: title, isOpen: isOpen, onPressed: onToggle),
            AnimatedCrossFade(
              crossFadeState: isOpen ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 180),
              firstChild: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: children
                  )
              ),
              secondChild: const SizedBox.shrink(),
            ),
          ]
      ),
    );
  }
}

class _SectionButton extends StatelessWidget {
  final String title;
  final bool isOpen;
  final VoidCallback onPressed;
  const _SectionButton({
    required this.title,
    required this.isOpen,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isOpen ? Colors.blue[700] : const Color(0xFF1E1F22),
            border: Border.all(
                color: isOpen ? Colors.blue[700]! : Colors.white24,
                width: 1.5
            ),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 8,
                  offset: Offset(0, 2),
                  color: Colors.black26
              )
            ],
          ),
          child: Row(
              children: [
                Icon(
                    isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: Colors.white
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          letterSpacing: 0.3
                      )
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}

class _SizeField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const _SizeField({
    required this.label,
    required this.controller,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white54),
          isDense: true,
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white38)
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)
          ),
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        onChanged: onChanged,
      ),
    );
  }
}