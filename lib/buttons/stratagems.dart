import 'package:flutter/material.dart';
import '../data/z_datachment_model/stratagem_model.dart';

class StratagemsContent extends StatefulWidget {
  final List<Stratagem> stratagems;

  const StratagemsContent({super.key, required this.stratagems});

  @override
  State<StratagemsContent> createState() => _StratagemsContentState();
}

class _StratagemsContentState extends State<StratagemsContent> {
  final Map<StratagemCategory, bool> _expandedPhases = {
    for (var category in StratagemCategory.values) category: false
  };

  final Map<String, bool> _expandedStratagems = {};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: StratagemCategory.values.map((category) {
                return _buildPhaseSection(category);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhaseSection(StratagemCategory category) {
    final isExpanded = _expandedPhases[category]!;
    final categoryStratagems = widget.stratagems
        .where((s) => s.categories.contains(category))
        .toList();

    if (categoryStratagems.isEmpty) return const SizedBox.shrink();

    return Card(
      color: Colors.grey[850],
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              _getCategoryName(category),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            trailing: Icon(
              isExpanded ? Icons.expand_less : Icons.expand_more,
              color: Colors.white70,
            ),
            onTap: () => setState(() {
              _expandedPhases[category] = !isExpanded;
            }),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: isExpanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                children: categoryStratagems.map((stratagem) {
                  return _buildStratagemButton(stratagem);
                }).toList(),
              ),
            ),
            secondChild: const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  String _getCategoryName(StratagemCategory category) {
    switch (category) {
      case StratagemCategory.command:
        return 'Command Phase';
      case StratagemCategory.move:
        return 'Move Phase';
      case StratagemCategory.shooting:
        return 'Shooting Phase';
      case StratagemCategory.charge:
        return 'Charge Phase';
      case StratagemCategory.fight:
        return 'Fight Phase';
    }
  }

  Widget _buildStratagemButton(Stratagem stratagem) {
    final isExpanded = _expandedStratagems[stratagem.name] ?? false;

    return Card(
      color: Colors.grey[800],
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              stratagem.name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${stratagem.cpCost} CP',
                  style: TextStyle(
                    color: Colors.amber[300],
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.white70,
                  size: 20,
                ),
              ],
            ),
            onTap: () => setState(() {
              _expandedStratagems[stratagem.name] = !isExpanded;
            }),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 250),
            crossFadeState: isExpanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: _buildStratagemDetails(stratagem),
            secondChild: const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildStratagemDetails(Stratagem stratagem) {
    return Container(
      width: double.infinity,
      color: Colors.grey[900],
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (stratagem.when != null) ...[
            _buildDetailRow('When:', stratagem.when!),
            const SizedBox(height: 8),
          ],
          if (stratagem.target != null) ...[
            _buildDetailRow('Target:', stratagem.target!),
            const SizedBox(height: 8),
          ],
          if (stratagem.effect != null) ...[
            _buildDetailRow('Effect:', stratagem.effect!),
            const SizedBox(height: 8),
          ],
          if (stratagem.restrictions != null) ...[
            _buildDetailRow('Restrictions:', stratagem.restrictions!),
          ],
        ],
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.blue[200],
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

class StratagemButton extends StatelessWidget {
  final String currentCategory;
  final VoidCallback onPressed;

  const StratagemButton({
    super.key,
    required this.currentCategory,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = currentCategory == 'Stratagems';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
            colors: [Colors.black, Colors.lightBlue[600]!, Colors.purple[700]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.0, 0.6, 1.0],
          )
              : LinearGradient(
            colors: [Colors.grey[850]!, Colors.grey[800]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(color: Colors.purple[300]!, width: 2.0)
              : Border.all(color: Colors.grey[600]!, width: 1),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.purple.withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 4),
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.purple.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 1),
            ),
          ]
              : [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
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
                Icons.bolt,
                size: 18,
                color: isSelected ? Colors.white : Colors.grey[300],
              ),
              const SizedBox(width: 8),
              Text(
                'Stratagems',
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
