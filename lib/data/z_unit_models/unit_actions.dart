import 'package:flutter/material.dart';

/// Кнопка добавления юнита (зеленый плюс)
class UnitAddButton extends StatelessWidget {
  final VoidCallback onAdd;

  const UnitAddButton({
    super.key,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.green.shade600,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onAdd,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}

/// Кнопка удаления юнита (красный крестик) - для использования в Positioned
class UnitRemoveButton extends StatelessWidget {
  final VoidCallback onRemove;

  const UnitRemoveButton({
    super.key,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.red.shade600,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onRemove,
          child: const Icon(
            Icons.close,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}

/// Кнопка дублирования юнита (синяя копия) - для использования в Positioned
class UnitDuplicateButton extends StatelessWidget {
  final VoidCallback onDuplicate;

  const UnitDuplicateButton({
    super.key,
    required this.onDuplicate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.blue.shade600,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onDuplicate,
          child: const Icon(
            Icons.content_copy,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}