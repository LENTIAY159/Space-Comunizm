import 'package:flutter/material.dart';

class EnhancementsButton extends StatelessWidget {
  final String currentCategory;
  final VoidCallback onPressed;

  const EnhancementsButton({
    super.key,
    required this.currentCategory,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = currentCategory == 'Enhancements';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
            colors: [Colors.black, Colors.amber[600]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
              : null,
          color: isSelected ? null : Colors.grey[850],
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(color: Colors.amber[400]!, width: 1.5)
              : Border.all(color: Colors.grey[700]!, width: 1),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.amber.withOpacity(0.3),
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
                Icons.upgrade,
                size: 18,
                color: isSelected ? Colors.white : Colors.grey[300],
              ),
              const SizedBox(width: 8),
              Text(
                'Enhancements',
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