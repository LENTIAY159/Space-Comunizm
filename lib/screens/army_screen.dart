import 'package:flutter/material.dart';
import 'army_storage.dart';
import 'category_content.dart';
import 'add_delete.dart';
import 'faction_work.dart';
import 'mini_counters.dart';
import '../data/z_unit_models/unit_model.dart';
import '../data/z_unit_models/selected_unit_model.dart';
import '../buttons/datasheets.dart' show DatasheetsButton;
import '../buttons/army_rule.dart';
import '../buttons/enhancements.dart';
import '../buttons/stratagems.dart';
import '../buttons/missions.dart' show MissionsButton;
import '../buttons/detachment.dart';
import '../data/z_datachment_model/detachment_model.dart';
import '../data/z_datachment_model/restriction_model.dart';

// ====================== Экран армии ======================
class ArmyScreen extends StatefulWidget {
  const ArmyScreen({super.key});
  @override
  ArmyScreenState createState() => ArmyScreenState();
}

class ArmyScreenState extends State<ArmyScreen> with TickerProviderStateMixin {
  List<Unit> allFactionUnits = [];
  List<SelectedUnit> selectedUnits = [];
  Map<String, List<Unit>> unitsByCategory = {
    'characters': [],
    'battleline': [],
    'dedicated_transports': [],
    'other_datasheets': [],
    'allied_units': [],
  };

  String _currentCategory = 'Datasheets';
  Detachment? _selectedDetachment;
  String _selectedFaction = '';
  List<Detachment> _availableDetachments = [];
  List<Restriction> _factionRestrictions = [];
  int _totalPower = 0;
  bool _isLoading = false;

  late AnimationController _headerAnimationController;
  late Animation<double> _headerAnimation;

  static const double _miniBarHeight = MiniCounters.barHeight;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _loadSavedArmy();
  }

  @override
  void dispose() {
    _headerAnimationController.dispose();
    super.dispose();
  }

  void _initializeAnimations() {
    _headerAnimationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _headerAnimation = CurvedAnimation(
      parent: _headerAnimationController,
      curve: Curves.easeOutCubic,
    );
    _headerAnimationController.forward();
  }

  Future<void> _loadSavedArmy() async {
    setState(() => _isLoading = true);
    try {
      final savedFaction = await ArmyStorage.loadCurrentFaction();
      if (savedFaction.isNotEmpty && mounted) {
        await _selectFaction(savedFaction);
      }
    } catch (_) {} finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> addUnit(Unit unit) async {
    final success = await UnitManager.addUnit(
      unit: unit,
      selectedUnits: selectedUnits,
      factionRestrictions: _factionRestrictions,
      detachmentRestrictions: _selectedDetachment?.restrictions ?? [],
      context: context,
      onUnitAdded: (selectedUnit) {
        setState(() {
          selectedUnits.add(selectedUnit);
        });
        _recalculatePower();
        _saveCurrentArmy();
      },
    );
  }

  Future<void> removeUnit(SelectedUnit selectedUnit) async {
    await UnitManager.removeUnit(
      selectedUnit: selectedUnit,
      selectedUnits: selectedUnits,
      onUnitsChanged: () {
        setState(() {});
        _recalculatePower();
        _saveCurrentArmy();
      },
    );
  }

  Future<void> updateUnitComposition(String instanceId, String compositionId) async {
    await UnitManager.updateUnitComposition(
      instanceId: instanceId,
      compositionId: compositionId,
      selectedUnits: selectedUnits,
      onUnitsChanged: () {
        setState(() {});
        _recalculatePower();
        _saveCurrentArmy();
      },
    );
  }

  Future<void> _recalculatePower() async {
    int total = 0;
    for (final su in selectedUnits) {
      total += su.points;
    }
    if (!mounted) return;
    setState(() => _totalPower = total);
  }

  Future<void> _saveCurrentArmy() async {
    await FactionManager.saveFactionData(
      faction: _selectedFaction,
      selectedUnits: selectedUnits,
      selectedDetachment: _selectedDetachment,
    );
  }

  void _changeArmy() {
    showDialog(
      context: context,
      builder: (context) {
        return _buildArmySelectionDialog();
      },
    );
  }

  Widget _buildArmySelectionDialog() {
    return AlertDialog(
      title: Text('Select Faction', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
      backgroundColor: Colors.grey[850],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Choose your army:', style: TextStyle(color: Colors.white70, fontSize: 16)),
            SizedBox(height: 16),
            ...FactionManager.factions.map((f) => _buildFactionTile(f)),
          ],
        ),
      ),
    );
  }

  Widget _buildFactionTile(FactionData faction) {
    final isSelected = _selectedFaction == faction.name;
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isSelected ? faction.color.withOpacity(0.15) : Colors.grey[900],
        border: Border.all(color: isSelected ? faction.color : Colors.grey[700]!, width: 1.5),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: faction.color.withOpacity(0.3),
          child: Icon(faction.icon, color: faction.color, size: 24),
        ),
        title: Text(faction.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        trailing: isSelected
            ? Icon(Icons.check_circle, color: faction.color)
            : Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 16),
        onTap: () {
          Navigator.pop(context);
          _selectFaction(faction.name);
        },
      ),
    );
  }

  Future<void> _selectFaction(String faction) async {
    setState(() => _isLoading = true);
    try {
      _resetArmy();

      final result = await FactionManager.loadFaction(
        faction: faction,
        allFactionUnits: allFactionUnits,
      );

      setState(() {
        unitsByCategory = result.unitsByCategory;
        _availableDetachments = result.availableDetachments;
        _factionRestrictions = result.factionRestrictions;
        allFactionUnits = result.allFactionUnits;
        _selectedFaction = faction;
        _selectedDetachment = result.savedDetachment;
        selectedUnits.addAll(result.savedSelectedUnits);
        _isLoading = false;
      });

      await _recalculatePower();

      _headerAnimationController
        ..reset()
        ..forward();
    } catch (_) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _resetArmy() {
    allFactionUnits.clear();
    selectedUnits.clear();
    _availableDetachments.clear();
    _factionRestrictions.clear();
    _selectedDetachment = null;
    _totalPower = 0;
    unitsByCategory = {
      'characters': [],
      'battleline': [],
      'dedicated_transports': [],
      'other_datasheets': [],
      'allied_units': [],
    };
  }

  void _selectDetachment() {
    if (_selectedFaction.isEmpty) {
      _changeArmy();
      return;
    }
    if (_availableDetachments.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No detachments available'),
          backgroundColor: Colors.red[700],
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return DetachmentListPage(
            detachments: _availableDetachments,
            selectedDetachment: _selectedDetachment,
            onDetachmentSelected: (detachment) async {
              try {
                setState(() => _selectedDetachment = detachment);
                _saveCurrentArmy();
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Detachment "${detachment.name}" selected'),
                    backgroundColor: Colors.blue[700],
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                );
                Navigator.pop(context);
              } catch (_) {}
            },
          );
        },
      ),
    );
  }

  void _showSnackBar(String message, Color color, IconData icon) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(width: 8),
            Expanded(child: Text(message, style: TextStyle(fontWeight: FontWeight.w600))),
          ],
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: _buildAppBar(),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: Colors.blue[400]))
          : Column(
        children: [
          _buildArmyHeader(),
          _buildCategoryBar(),
          Expanded(child: _buildMainContent()),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      toolbarHeight: kToolbarHeight + _miniBarHeight,
      title: Column(
        children: [
          MiniCounters(
            units: selectedUnits.length,
            power: _totalPower,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              'Army Builder',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[850],
      elevation: 2,
      shadowColor: Colors.black54,
      actions: [
        Padding(
          padding: EdgeInsets.only(top: _miniBarHeight, right: 12),
          child: _AppBarChangeArmyButton(),
        ),
      ],
    );
  }

  Widget _buildArmyHeader() {
    return AnimatedBuilder(
      animation: _headerAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - _headerAnimation.value)),
          child: Opacity(
            opacity: _headerAnimation.value,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.grey[850]!, Colors.grey[900]!],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: _selectedFaction.isEmpty ? _buildEmptyArmyHeader() : _buildSelectedArmyHeader(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyArmyHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.military_tech, size: 56, color: Colors.white30),
        SizedBox(height: 16),
        Text(
          'No Army Selected',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Choose your faction to start building',
          style: TextStyle(color: Colors.white60, fontSize: 16),
        ),
        SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: _changeArmy,
          icon: Icon(Icons.add, size: 20),
          label: Text('Select Army', style: TextStyle(fontWeight: FontWeight.w700)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[600],
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 4,
          ),
        ),
      ],
    );
  }

  Widget _buildSelectedArmyHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white.withOpacity(0.3)),
          ),
          child: Text(
            _selectedFaction.isEmpty ? 'No Army Selected' : _selectedFaction,
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
            ),
          ),
        ),
        SizedBox(height: 16),
        if (_selectedDetachment != null)
          _buildDetachmentBadge(_selectedDetachment!.name, Colors.blue[400]!)
        else if (_availableDetachments.isEmpty)
          _buildDetachmentBadge('Coming Soon', Colors.orange[600]!)
        else
          _buildDetachmentBadge('Not Selected', Colors.grey[600]!),
      ],
    );
  }

  Widget _buildDetachmentBadge(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildCategoryBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[850],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8),
        children: [
          DatasheetsButton(currentCategory: _currentCategory, onPressed: () => setState(() => _currentCategory = 'Datasheets')),
          ArmyRuleButton(currentCategory: _currentCategory, onPressed: () => setState(() => _currentCategory = 'Army Rule')),
          StratagemButton(currentCategory: _currentCategory, onPressed: () => setState(() => _currentCategory = 'Stratagems')),
          EnhancementsButton(currentCategory: _currentCategory, onPressed: () => setState(() => _currentCategory = 'Enhancements')),
          MissionsButton(currentCategory: _currentCategory, onPressed: () => setState(() => _currentCategory = 'Missions')),
          if (_selectedFaction.isNotEmpty) ...[
            SizedBox(width: 8),
            DetachmentButton(onPressed: _selectDetachment),
          ],
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return _selectedFaction.isEmpty
        ? _buildEmptyState()
        : CategoryContent(
      currentCategory: _currentCategory,
      selectedUnits: selectedUnits,
      unitsByCategory: unitsByCategory,
      onAddUnit: addUnit,
      onRemoveUnit: removeUnit,
      selectedFaction: _selectedFaction,
      selectedDetachment: _selectedDetachment,
      factionRestrictions: _factionRestrictions,
      onCompositionChanged: updateUnitComposition,
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.military_tech, size: 90, color: Colors.white24),
          SizedBox(height: 24),
          Text(
            'Start Building Your Army',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: _changeArmy,
            icon: Icon(Icons.rocket_launch, size: 24),
            label: Text('Get Started', style: TextStyle(fontWeight: FontWeight.w700)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              elevation: 4,
            ),
          ),
        ],
      ),
    );
  }
}

// Вспомогательное
class _AppBarChangeArmyButton extends StatelessWidget {
  const _AppBarChangeArmyButton();
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: IconButton(
        icon: Icon(Icons.swap_horiz, color: Colors.white70),
        tooltip: 'Change Army',
        onPressed: () => context.findAncestorStateOfType<ArmyScreenState>()?._changeArmy(),
      ),
    );
  }
}