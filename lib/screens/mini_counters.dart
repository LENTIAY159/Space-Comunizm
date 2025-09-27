import 'package:flutter/material.dart';

class MiniCounters extends StatelessWidget {
  final int units;
  final int power;

  const MiniCounters({
    super.key,
    required this.units,
    required this.power,
  });

  static const double barHeight = 24.0;
  static const EdgeInsets contentPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 4);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: barHeight,
      padding: contentPadding,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey[900]!, Colors.grey[800]!],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        border: Border(bottom: BorderSide(color: Colors.blue[700]!, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.group, size: 16, color: Colors.blue[300]),
              SizedBox(width: 4),
              Text(
                'Units: $units',
                style: TextStyle(
                  color: Colors.blue[100],
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.bolt, size: 16, color: Colors.blue[300]),
              SizedBox(width: 4),
              Text(
                'Pts: $power',
                style: TextStyle(
                  color: Colors.blue[100],
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}