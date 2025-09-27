import 'package:flutter/material.dart';
import '../data/z_datachment_model/restriction_model.dart';
import '../data/z_datachment_model/restriction_engine.dart';
import '../data/z_unit_models/unit_model.dart';
import '../data/z_unit_models/selected_unit_model.dart';
import '../screens/army_storage.dart';
import '../data/z_unit_models/unit_card.dart';

/// Кнопка переключения на вкладку Datasheets
class DatasheetsButton extends StatelessWidget {
  final String currentCategory;
  final VoidCallback onPressed;

  const DatasheetsButton({
    super.key,
    required this.currentCategory,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = currentCategory == 'Datasheets';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
            colors: [Colors.black, Colors.green[500]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
              : null,
          color: isSelected ? null : Colors.grey[850],
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(color: Colors.green[400]!, width: 1.5)
              : Border.all(color: Colors.grey[700]!, width: 1),
          boxShadow: isSelected ? [
            BoxShadow(
              color: Colors.red.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ] : null,
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
                'Datasheets',
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

/// ===== ВСПОМОГАТЕЛЬНЫЕ ДИАЛОГИ: список и детали =====

class _UnitQuickListDialog extends StatelessWidget {
  final String title;
  final List<Unit> units;
  final Map<String, String?> blockedReasonsByUnitId;
  final ValueChanged<Unit> onTapUnit;
  final ValueChanged<Unit> onAddUnit;

  const _UnitQuickListDialog({
    required this.title,
    required this.units,
    required this.blockedReasonsByUnitId,
    required this.onTapUnit,
    required this.onAddUnit,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.grey[900]!, Colors.black87],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.red[700]!, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red[800]!, Colors.red[700]!],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.military_tech, color: Colors.white, size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: Colors.white),
                  ),
                ],
              ),
            ),
            // Content
            Expanded(
              child: units.isEmpty
                  ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search_off, size: 64, color: Colors.grey[600]),
                    const SizedBox(height: 16),
                    Text(
                      'No available units',
                      style: TextStyle(color: Colors.grey[400], fontSize: 18),
                    ),
                  ],
                ),
              )
                  : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: units.length,
                itemBuilder: (context, i) {
                  final u = units[i];
                  final minPts = u.defaultComposition?.points;
                  final blockedReason = blockedReasonsByUnitId[u.id];
                  final disabled = blockedReason != null;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: disabled ? Colors.grey[800]?.withOpacity(0.3) : Colors.grey[850],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: disabled ? Colors.grey[700]! : Colors.grey[600]!,
                        width: 1,
                      ),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: disabled
                              ? LinearGradient(colors: [Colors.grey[700]!, Colors.grey[800]!])
                              : LinearGradient(colors: [Colors.red[700]!, Colors.red[800]!]),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.shield,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      title: Text(
                        u.name,
                        style: TextStyle(
                          color: disabled ? Colors.grey[400] : Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        minPts != null ? '$minPts pts minimum' : '—',
                        style: TextStyle(
                          color: disabled ? Colors.grey[500] : Colors.grey[300],
                        ),
                      ),
                      trailing: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: disabled ? Colors.grey[700] : Colors.red[600],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          tooltip: disabled ? blockedReason : 'Add',
                          onPressed: disabled ? null : () => onAddUnit(u),
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      onTap: disabled ? null : () => onTapUnit(u),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UnitDetailsDialog extends StatelessWidget {
  final Unit unit;
  final VoidCallback onAdd;

  const _UnitDetailsDialog({required this.unit, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.grey[900]!, Colors.black87],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.red[700]!, width: 2),
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red[800]!, Colors.red[700]!],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.white, size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      unit.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: UnitCard(unit: unit),
              ),
            ),
            // Actions
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.grey[600]!),
                        ),
                      ),
                      child: const Text(
                        'Back',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        onAdd();
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[600],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Add',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ===== СЕКЦИЯ WARLORD (всегда сверху) =====
class _WarlordSlot extends StatelessWidget {
  final SelectedUnit? warlord;
  final VoidCallback onPickRequested;
  final VoidCallback onClear;
  final void Function(String compositionId)? onChangeWarlordComposition;

  const _WarlordSlot({
    required this.warlord,
    required this.onPickRequested,
    required this.onClear,
    required this.onChangeWarlordComposition,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.amber[900]!.withOpacity(0.3),
            Colors.amber[800]!.withOpacity(0.2),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 2,
          color: Colors.amber[600]!,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.amber[800]!, Colors.amber[700]!],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.military_tech,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'WARLORD',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    tooltip: warlord != null ? 'Remove Warlord' : 'Choose Warlord',
                    onPressed: warlord != null ? onClear : onPickRequested,
                    icon: Icon(
                      warlord != null ? Icons.close : Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Content
          Container(
            padding: const EdgeInsets.all(16),
            child: warlord == null
                ? Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 32),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber[700]!.withOpacity(0.3)),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.person_add,
                    size: 48,
                    color: Colors.amber[300],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'No Warlord selected',
                    style: TextStyle(
                      color: Colors.amber[200],
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Press + to choose a Character',
                    style: TextStyle(
                      color: Colors.amber[300],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
                : UnitCard(
              unit: warlord!.unit,
              currentCompositionId: warlord!.selectedCompositionId,
              onCompositionChange: onChangeWarlordComposition,
            ),
          ),
        ],
      ),
    );
  }
}


/// ===== КАТЕГОРИЯ ЮНИТОВ (список + диалог добавления) =====
class CategorySection extends StatelessWidget {
  final String title;
  final List<SelectedUnit> selectedUnits;
  final List<Unit> availableUnits;
  final Function(Unit) onAddUnit;
  final Function(SelectedUnit) onRemoveUnit;
  final Function(SelectedUnit) onDuplicateUnit;
  final List<Restriction> restrictions;
  final Function(String instanceId, String compositionId) onCompositionChanged;
  final String? warlordInstanceId;

  const CategorySection({
    super.key,
    required this.title,
    required this.selectedUnits,
    required this.availableUnits,
    required this.onAddUnit,
    required this.onRemoveUnit,
    required this.onDuplicateUnit,
    required this.restrictions,
    required this.onCompositionChanged,
    required this.warlordInstanceId,
  });

  IconData _getCategoryIcon() {
    switch (title) {
      case 'CHARACTERS':
        return Icons.person;
      case 'BATTLELINE':
        return Icons.groups;
      case 'DEDICATED TRANSPORTS':
        return Icons.local_shipping;
      case 'OTHER DATASHEETS':
        return Icons.dashboard;
      case 'ALLIED UNITS':
        return Icons.handshake;
      default:
        return Icons.shield;
    }
  }

  Color _getCategoryColor() {
    switch (title) {
      case 'CHARACTERS':
        return Colors.purple[600]!;
      case 'BATTLELINE':
        return Colors.blue[600]!;
      case 'DEDICATED TRANSPORTS':
        return Colors.green[600]!;
      case 'OTHER DATASHEETS':
        return Colors.orange[600]!;
      case 'ALLIED UNITS':
        return Colors.teal[600]!;
      default:
        return Colors.red[600]!;
    }
  }

  void _showAddUnitsDialog(BuildContext context) {
    final engine = RestrictionEngine(restrictions, selectedUnits);
    final visibleUnits = availableUnits.where(engine.canDisplay).toList();
    final blocked = <String, String?>{};
    for (final u in visibleUnits) {
      blocked[u.id] = engine.canAdd(u) ? null : (engine.getRestrictionReason(u) ?? 'Cannot add this unit');
    }

    showDialog(
      context: context,
      builder: (_) => _UnitQuickListDialog(
        title: 'Add Units - $title',
        units: visibleUnits,
        blockedReasonsByUnitId: blocked,
        onTapUnit: (unit) {
          showDialog(
            context: context,
            builder: (_) => _UnitDetailsDialog(
              unit: unit,
              onAdd: () => onAddUnit(unit),
            ),
          );
        },
        onAddUnit: (unit) => onAddUnit(unit),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categoryColor = _getCategoryColor();

    final items = selectedUnits.map((su) {
      final isWarlord = warlordInstanceId == su.instanceId;

      final topRight = isWarlord
          ? null
          : Positioned(
        right: 8,
        top: 8,
        child: Row(
          children: [
            _actionButton(
              icon: Icons.content_copy,
              tooltip: 'Duplicate',
              color: Colors.blue[600]!,
              onTap: () => onDuplicateUnit(su),
            ),
            const SizedBox(width: 8),
            _actionButton(
              icon: Icons.delete_outline,
              tooltip: 'Remove',
              color: Colors.red[600]!,
              onTap: () => onRemoveUnit(su),
            ),
          ],
        ),
      );

      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[700]!, width: 1),
        ),
        child: UnitCard(
          unit: su.unit,
          topRightButton: topRight,
          currentCompositionId: su.selectedCompositionId,
          onCompositionChange: (compId) => onCompositionChanged(su.instanceId, compId),
        ),
      );
    }).toList();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: categoryColor.withOpacity(0.3), width: 1),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [categoryColor, categoryColor.withOpacity(0.8)],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    _getCategoryIcon(),
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add, color: Colors.white, size: 22),
                    onPressed: () => _showAddUnitsDialog(context),
                    tooltip: 'Add unit',
                  ),
                ),
              ],
            ),
          ),
          // Content
          if (items.isEmpty)
            Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Icon(
                    Icons.inbox,
                    size: 48,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'No units added',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Press + to add units',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Column(children: items),
            ),
        ],
      ),
    );
  }

  Widget _actionButton({
    required IconData icon,
    required String tooltip,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 18),
        ),
      ),
    );
  }
}

/// ===== ВСЕ СЕКЦИИ + WARLORD =====
class DatasheetsSections extends StatefulWidget {
  final List<SelectedUnit> selectedUnits;
  final Map<String, List<Unit>> unitsByCategory;
  final Function(Unit) onAddUnit;
  final Function(SelectedUnit) onRemoveUnit;
  final List<Restriction> restrictions;
  final Function(String instanceId, String compositionId) onCompositionChanged;

  const DatasheetsSections({
    super.key,
    required this.selectedUnits,
    required this.unitsByCategory,
    required this.onAddUnit,
    required this.onRemoveUnit,
    required this.restrictions,
    required this.onCompositionChanged,
  });

  @override
  State<DatasheetsSections> createState() => _DatasheetsSectionsState();
}

class _DatasheetsSectionsState extends State<DatasheetsSections> {
  String? _warlordInstanceId;
  String _faction = '';

  @override
  void initState() {
    super.initState();
    _loadFactionAndWarlord();
  }

  @override
  void didUpdateWidget(covariant DatasheetsSections oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_warlordInstanceId != null &&
        !widget.selectedUnits.any((u) => u.instanceId == _warlordInstanceId)) {
      setState(() => _warlordInstanceId = null);
      if (_faction.isNotEmpty) {
        ArmyStorage.clearWarlordInstanceId(_faction);
      }
    }
  }

  Future<void> _loadFactionAndWarlord() async {
    final faction = await ArmyStorage.loadCurrentFaction();
    final wl = await ArmyStorage.loadWarlordInstanceId(faction);
    if (!mounted) return;
    setState(() {
      _faction = faction;
      _warlordInstanceId = wl;
    });
  }

  Future<void> _setWarlord(String instanceId) async {
    if (_faction.isEmpty) {
      final faction = await ArmyStorage.loadCurrentFaction();
      _faction = faction;
    }
    await ArmyStorage.saveWarlordInstanceId(_faction, instanceId);
    if (!mounted) return;
    setState(() => _warlordInstanceId = instanceId);
  }

  Future<void> _clearWarlord() async {
    if (_faction.isEmpty) {
      final faction = await ArmyStorage.loadCurrentFaction();
      _faction = faction;
    }
    await ArmyStorage.clearWarlordInstanceId(_faction);
    if (!mounted) return;
    setState(() => _warlordInstanceId = null);
  }

  void _openPickWarlordDialog() {
    final characterIds = widget.unitsByCategory['characters']
        ?.map((u) => u.id)
        .toSet() ?? {};
    final characterInstances = widget.selectedUnits
        .where((su) => characterIds.contains(su.unit.id))
        .toList();

    showDialog(
      context: context,
      builder: (_) =>
          Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.9,
              height: 500,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.grey[900]!, Colors.black87],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.amber[700]!, width: 2),
              ),
              child: Column(
                children: [
                  // Header
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.amber[800]!, Colors.amber[700]!],
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(14),
                        topRight: Radius.circular(14),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                            Icons.military_tech, color: Colors.white, size: 24),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'Choose Warlord',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  // Content
                  Expanded(
                    child: characterInstances.isEmpty
                        ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person_off, size: 64,
                              color: Colors.grey[600]),
                          const SizedBox(height: 16),
                          Text(
                            'No Characters in your army',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Add a Character first',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    )
                        : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: characterInstances.length,
                      itemBuilder: (context, i) {
                        final su = characterInstances[i];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.amber[900]!.withOpacity(0.3),
                                Colors.amber[800]!.withOpacity(0.2)
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: Colors.amber[600]!, width: 1),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.amber[700]!,
                                    Colors.amber[800]!
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            title: Text(
                              su.unit.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              '${su.points} pts',
                              style: TextStyle(color: Colors.amber[200]),
                            ),
                            trailing: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.amber[600]!,
                                    Colors.amber[700]!
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  _setWarlord(su.instanceId);
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.black,
                                  elevation: 0,
                                  shadowColor: Colors.transparent,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                ),
                                child: const Text(
                                  'SET',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final SelectedUnit? warlord = (_warlordInstanceId == null)
        ? null
        : widget.selectedUnits.firstWhere(
          (su) => su.instanceId == _warlordInstanceId,
      orElse: () => null as SelectedUnit,
    );

    // Остальные юниты
    final selectedUnitsWithoutWarlord = _warlordInstanceId == null
        ? widget.selectedUnits
        : widget.selectedUnits.where((su) =>
    su.instanceId != _warlordInstanceId).toList();

    // Разделение по категориям
    final Set<String> characterIds = widget.unitsByCategory['characters']?.map((
        u) => u.id).toSet() ?? {};
    final Set<String> battlelineIds = widget.unitsByCategory['battleline']
        ?.map((u) => u.id)
        .toSet() ?? {};
    final Set<String> transportIds = widget
        .unitsByCategory['dedicated_transports']?.map((u) => u.id).toSet() ??
        {};
    final Set<String> otherIds = widget.unitsByCategory['other_datasheets']
        ?.map((u) => u.id)
        .toSet() ?? {};
    final Set<String> alliedIds = widget.unitsByCategory['allied_units']?.map((
        u) => u.id).toSet() ?? {};

    void _onRemove(SelectedUnit su) async {
      if (su.instanceId == _warlordInstanceId) {
        await _clearWarlord();
      }
      widget.onRemoveUnit(su);
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.grey[850]!,
            Colors.black87,
          ],
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.only(bottom: 20),
        children: [
          _WarlordSlot(
            warlord: warlord,
            onPickRequested: _openPickWarlordDialog,
            onClear: _clearWarlord,
            onChangeWarlordComposition: warlord == null
                ? null
                : (compId) =>
                widget.onCompositionChanged(warlord.instanceId, compId),
          ),

          CategorySection(
            title: "CHARACTERS",
            selectedUnits: selectedUnitsWithoutWarlord.where((su) =>
                characterIds.contains(su.unit.id)).toList(),
            availableUnits: widget.unitsByCategory['characters'] ?? [],
            onAddUnit: widget.onAddUnit,
            onRemoveUnit: _onRemove,
            onDuplicateUnit: (su) => widget.onAddUnit(su.unit),
            restrictions: widget.restrictions,
            onCompositionChanged: widget.onCompositionChanged,
            warlordInstanceId: _warlordInstanceId,
          ),
          CategorySection(
            title: "BATTLELINE",
            selectedUnits: selectedUnitsWithoutWarlord.where((su) =>
                battlelineIds.contains(su.unit.id)).toList(),
            availableUnits: widget.unitsByCategory['battleline'] ?? [],
            onAddUnit: widget.onAddUnit,
            onRemoveUnit: _onRemove,
            onDuplicateUnit: (su) => widget.onAddUnit(su.unit),
            restrictions: widget.restrictions,
            onCompositionChanged: widget.onCompositionChanged,
            warlordInstanceId: _warlordInstanceId,
          ),
          CategorySection(
            title: "DEDICATED TRANSPORTS",
            selectedUnits: selectedUnitsWithoutWarlord.where((su) =>
                transportIds.contains(su.unit.id)).toList(),
            availableUnits: widget.unitsByCategory['dedicated_transports'] ??
                [],
            onAddUnit: widget.onAddUnit,
            onRemoveUnit: _onRemove,
            onDuplicateUnit: (su) => widget.onAddUnit(su.unit),
            restrictions: widget.restrictions,
            onCompositionChanged: widget.onCompositionChanged,
            warlordInstanceId: _warlordInstanceId,
          ),
          CategorySection(
            title: "OTHER DATASHEETS",
            selectedUnits: selectedUnitsWithoutWarlord.where((su) =>
                otherIds.contains(su.unit.id)).toList(),
            availableUnits: widget.unitsByCategory['other_datasheets'] ?? [],
            onAddUnit: widget.onAddUnit,
            onRemoveUnit: _onRemove,
            onDuplicateUnit: (su) => widget.onAddUnit(su.unit),
            restrictions: widget.restrictions,
            onCompositionChanged: widget.onCompositionChanged,
            warlordInstanceId: _warlordInstanceId,
          ),
          CategorySection(
            title: "ALLIED UNITS",
            selectedUnits: selectedUnitsWithoutWarlord.where((su) =>
                alliedIds.contains(su.unit.id)).toList(),
            availableUnits: widget.unitsByCategory['allied_units'] ?? [],
            onAddUnit: widget.onAddUnit,
            onRemoveUnit: _onRemove,
            onDuplicateUnit: (su) => widget.onAddUnit(su.unit),
            restrictions: widget.restrictions,
            onCompositionChanged: widget.onCompositionChanged,
            warlordInstanceId: _warlordInstanceId,
          ),
        ],
      ),
    );
  }
}