import 'package:flutter/material.dart';
import '../data/z_datachment_model/detachment_model.dart';
import '../data/z_datachment_model/detachment_rule.dart';
import '../data/z_datachment_model/enhancement_model.dart';
import '../data/z_datachment_model/restriction_model.dart';
import '../data/z_datachment_model/stratagem_model.dart';
import '../data/z_unit_models/keyword_converter.dart';

class DetachmentButton extends StatelessWidget {
  final VoidCallback onPressed;

  const DetachmentButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.grey[500]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[400]!, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: const Icon(Icons.military_tech, size: 18, color: Colors.white),
          label: const Text(
            'Detachment',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              letterSpacing: 0.5,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
        ),
      ),
    );
  }
}

class DetachmentDetailPage extends StatelessWidget {
  final Detachment detachment;

  const DetachmentDetailPage({
    super.key,
    required this.detachment,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(detachment.name, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.grey[900]!, Colors.black87],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey[850]!, Colors.black87],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader('Detachment Rules'),
              ...detachment.additionalRules.map((rule) => _buildRuleWidget(rule)).toList(),
              if (detachment.enhancements.isNotEmpty) ...[
                const SizedBox(height: 24),
                _buildSectionHeader('Enhancements'),
                ...detachment.enhancements.map((e) => _buildEnhancementWidget(e)).toList(),
              ],
              if (detachment.stratagems.isNotEmpty) ...[
                const SizedBox(height: 24),
                _buildSectionHeader('Stratagems'),
                ...detachment.stratagems.map((s) => _buildStratagemWidget(s)).toList(),
              ],
              if (detachment.restrictions.isNotEmpty) ...[
                const SizedBox(height: 24),
                _buildSectionHeader('Restrictions'),
                ...detachment.restrictions.map((r) => _buildRestrictionWidget(r)).toList(),
              ],
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red[800]!, Colors.red[700]!],
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  Widget _buildRuleWidget(AdditionalRule rule) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey[850]!, Colors.grey[900]!],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amberAccent.withOpacity(0.4), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              rule.name,
              style: const TextStyle(
                color: Colors.amberAccent,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              rule.description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEnhancementWidget(Enhancement enhancement) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey[850]!, Colors.grey[900]!],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amberAccent.withOpacity(0.4), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              enhancement.name,
              style: const TextStyle(
                color: Colors.amberAccent,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              enhancement.description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStratagemWidget(Stratagem stratagem) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey[850]!, Colors.grey[900]!],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.deepPurple.withOpacity(0.4), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  stratagem.name,
                  style: const TextStyle(
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.deepPurple[800]!, Colors.deepPurple[900]!],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${stratagem.cpCost} CP',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (stratagem.when != null) ...[
              _buildStratagemDetailRow('When:', stratagem.when!),
            ],
            if (stratagem.target != null) ...[
              _buildStratagemDetailRow('Target:', stratagem.target!),
            ],
            if (stratagem.effect != null) ...[
              _buildStratagemDetailRow('Effect:', stratagem.effect!),
            ],
            if (stratagem.restrictions != null) ...[
              _buildStratagemDetailRow('Restrictions:', stratagem.restrictions!, isRestriction: true),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStratagemDetailRow(String label, String value, {bool isRestriction = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: label,
              style: TextStyle(
                color: isRestriction ? Colors.orange : Colors.white70,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            TextSpan(
              text: ' $value',
              style: TextStyle(
                color: isRestriction ? Colors.orange : Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRestrictionWidget(Restriction restriction) {
    Color restrictionColor;
    switch (restriction.type) {
      case RestrictionType.unitBan:
      case RestrictionType.keywordBan:
        restrictionColor = Colors.redAccent;
        break;
      case RestrictionType.keywordLimit:
      case RestrictionType.unitLimit:
        restrictionColor = Colors.amber;
        break;
      default:
        restrictionColor = Colors.white70;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey[850]!, Colors.grey[900]!],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: restrictionColor.withOpacity(0.4), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  _getRestrictionIcon(restriction.type),
                  color: restrictionColor,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            _getRestrictionTypeText(restriction.type),
                            style: TextStyle(
                              color: restrictionColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                          if (restriction.maxCount != null) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: restrictionColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'MAX ${restriction.maxCount}',
                                style: TextStyle(
                                  color: restrictionColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        restriction.description,
                        style: TextStyle(
                          color: restrictionColor.withOpacity(0.9),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (restriction.unitNames.isNotEmpty ||
                restriction.keywords.isNotEmpty ||
                restriction.factionKeywords.isNotEmpty) ...[
              const SizedBox(height: 8),
              _buildRestrictionTargets(restriction, restrictionColor),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildRestrictionTargets(Restriction restriction, Color color) {
    return Wrap(
      spacing: 6,
      runSpacing: 4,
      children: [
        ...restriction.unitNames.map((unitName) => _buildTargetChip(
          unitName,
          color,
          Icons.person,
        )),
        ...restriction.keywords.map((keyword) => _buildTargetChip(
          KeywordConverter.toReadable(keyword),
          color,
          Icons.tag,
        )),
        ...restriction.factionKeywords.map((factionKeyword) => _buildTargetChip(
          KeywordConverter.factionToReadable(factionKeyword),
          color.withOpacity(0.8),
          Icons.flag,
        )),
      ],
    );
  }

  Widget _buildTargetChip(String label, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.1), color.withOpacity(0.2)],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 12,
            color: color,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  String _getRestrictionTypeText(RestrictionType type) {
    switch (type) {
      case RestrictionType.unitBan:
        return 'UNIT BAN';
      case RestrictionType.keywordBan:
        return 'KEYWORD BAN';
      case RestrictionType.unitLimit:
        return 'UNIT LIMIT';
      case RestrictionType.keywordLimit:
        return 'KEYWORD LIMIT';
      default:
        return 'RESTRICTION';
    }
  }

  IconData _getRestrictionIcon(RestrictionType type) {
    switch (type) {
      case RestrictionType.unitBan:
      case RestrictionType.keywordBan:
        return Icons.block;
      case RestrictionType.keywordLimit:
      case RestrictionType.unitLimit:
        return Icons.lock;
      default:
        return Icons.warning;
    }
  }
}

class DetachmentListPage extends StatelessWidget {
  final List<Detachment> detachments;
  final Detachment? selectedDetachment;
  final Function(Detachment) onDetachmentSelected;

  const DetachmentListPage({
    super.key,
    required this.detachments,
    required this.selectedDetachment,
    required this.onDetachmentSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Detachment', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.grey[900]!, Colors.black87],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey[850]!, Colors.black87],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: detachments.length,
          itemBuilder: (context, index) {
            return _buildDetachmentTile(detachments[index], context);
          },
        ),
      ),
    );
  }

  Widget _buildDetachmentTile(Detachment detachment, BuildContext context) {
    final isSelected = selectedDetachment?.name == detachment.name;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isSelected
              ? [Colors.blue[800]!.withOpacity(0.3), Colors.blue[900]!.withOpacity(0.2)]
              : [Colors.grey[850]!, Colors.grey[900]!],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? Colors.blue[400]! : Colors.grey[700]!,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isSelected ? Colors.blue.withOpacity(0.3) : Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        title: Text(
          detachment.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        subtitle: detachment.restrictions.isNotEmpty
            ? Text(
          '${detachment.restrictions.length} restriction${detachment.restrictions.length != 1 ? 's' : ''}',
          style: const TextStyle(
            color: Colors.white60,
            fontSize: 13,
          ),
        )
            : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected)
              const Icon(Icons.check, color: Colors.blueAccent, size: 24),
            const SizedBox(width: 12),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.grey[700]!, Colors.grey[800]!],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                icon: const Icon(Icons.info_outline, color: Colors.white70, size: 24),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetachmentDetailPage(detachment: detachment),
                  ),
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          onDetachmentSelected(detachment);
        },
      ),
    );
  }
}