import 'package:flutter/material.dart';
import 'mission_model.dart';
import 'dart:math' as math;

class DeploymentZoneInfo {
  final String label;
  final String dimensions;
  final Color color;

  const DeploymentZoneInfo({
    required this.label,
    required this.dimensions,
    required this.color,
  });
}

class MissionCard extends StatelessWidget {
  final String title;
  final String? description;
  final Widget? content;
  final double width;
  final Color? backgroundColor;
  final Color? borderColor;

  const MissionCard({
    super.key,
    required this.title,
    this.description,
    this.content,
    this.width = 360,
    this.backgroundColor,
    this.borderColor,
  });

  factory MissionCard.fromModel(
      dynamic mission, {
        double width = 360,
        double? tableWInches,
        double? tableHInches,
      }) {
    if (mission is MissionRule) {
      return MissionCard(
        title: mission.name,
        description: mission.short,
        width: width,
        backgroundColor: const Color(0xFF2D1B4E),
        borderColor: Colors.purple[400],
      );
    } else if (mission is PrimaryMission) {
      final rulesInfo = mission.appliesRules.isNotEmpty
          ? '\nApplied Rules: ${mission.appliesRules.join(", ")}'
          : '';

      return MissionCard(
        title: mission.name,
        description: '${mission.description}$rulesInfo',
        width: width,
        backgroundColor: const Color(0xFF1A472A),
        borderColor: Colors.green[400],
      );
    } else if (mission is SecondaryMission) {
      return MissionCard(
        title: mission.name,
        description: '${mission.description}\n\nSecondary Mission',
        width: width,
        backgroundColor: const Color(0xFF2D4A1B),
        borderColor: Colors.lightGreen[400],
      );
    } else if (mission is Gambit) {
      return MissionCard(
        title: mission.name,
        description: '${mission.description}\n\nGambit',
        width: width,
        backgroundColor: const Color(0xFF4A2D1B),
        borderColor: Colors.orange[400],
      );
    } else if (mission is MissionMap) {
      return MissionCard(
        title: mission.name,
        width: width,
        backgroundColor: const Color(0xFF1B2D4A),
        borderColor: Colors.blue[400],
        content: MissionMapWidget(
          map: mission,
          tableWInches: tableWInches ?? 44,
          tableHInches: tableHInches ?? 60,
        ),
      );
    }

    return MissionCard(
      title: 'Unknown Mission',
      description: 'Unknown mission type',
      width: width,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor ?? const Color(0xFF1E1F22),
        border: Border.all(
          color: borderColor ?? Colors.white24,
          width: 1.5,
        ),
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(11),
                topRight: Radius.circular(11),
              ),
              color: (backgroundColor ?? const Color(0xFF1E1F22)).withOpacity(0.8),
            ),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                letterSpacing: 0.3,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (description != null) ...[
                  Text(
                    description!,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  if (content != null) const SizedBox(height: 16),
                ],
                if (content != null) content!,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MissionMapWidget extends StatelessWidget {
  final MissionMap map;
  final double tableWInches;
  final double tableHInches;

  const MissionMapWidget({
    super.key,
    required this.map,
    required this.tableWInches,
    required this.tableHInches,
  });

  /// Преобразование координат из базового размера в текущий размер стола
  MapPoint _normalizePoint(MapPoint point) {
    final normalizedX = point.x / map.baseW;
    final normalizedY = point.y / map.baseH;
    return MapPoint(
      id: point.id,
      x: normalizedX * tableWInches,
      y: normalizedY * tableHInches,
      type: point.type,
      label: point.label,
    );
  }

  /// Преобразование списка точек
  List<MapPoint> _normalizePoints(List<MapPoint> points) {
    return points.map(_normalizePoint).toList();
  }

  @override
  Widget build(BuildContext context) {
    const double maxMapWidth = 328.0;
    const double maxMapHeight = 420.0;

    final double scaleX = maxMapWidth / tableHInches;
    final double scaleY = maxMapHeight / tableWInches;
    final double scale = math.min(scaleX, scaleY);

    final double displayWidth = tableHInches * scale;
    final double displayHeight = tableWInches * scale;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Карта
        Container(
          width: maxMapWidth,
          height: maxMapHeight,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white24, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: SizedBox(
              width: displayWidth,
              height: displayHeight,
              child: CustomPaint(
                painter: MissionMapPainter(
                  map: map,
                  tableWInches: tableWInches,
                  tableHInches: tableHInches,
                  scale: scale,
                  normalizePoint: _normalizePoint,
                  normalizePoints: _normalizePoints,
                ),
                size: Size(displayWidth, displayHeight),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Информация о зонах под картой
        Container(
          width: maxMapWidth,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            border: Border.all(color: Colors.white24, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: _buildZoneInfoWidget(),
        ),
      ],
    );
  }

  Widget _buildZoneInfoWidget() {
    final deploymentInfo = _calculateDeploymentZonesWidget();

    if (deploymentInfo.isEmpty) {
      return const Text(
        'No deployment zones',
        style: TextStyle(
          color: Colors.white54,
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Deployment Zones:',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        // Используем Wrap для автоматического переноса элементов
        Wrap(
          spacing: 16, // Горизонтальный отступ между элементами
          runSpacing: 8, // вертикальный отступ между строками
          children: deploymentInfo.map((info) => _buildZoneInfoItem(info)).toList(),
        ),
      ],
    );
  }

  Widget _buildZoneInfoItem(DeploymentZoneInfo info) {
    return Container(
      constraints: const BoxConstraints(minWidth: 120, maxWidth: 140),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                info.label.substring(0, 2), // Только смодзи
                style: TextStyle(
                  color: info.color,
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  info.label.substring(2).trim(), // Только текст
                  style: TextStyle(
                    color: info.color,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              info.dimensions,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<DeploymentZoneInfo> _calculateDeploymentZonesWidget() {
    final List<DeploymentZoneInfo> result = [];

    // считаем для зон атакующего
    if (map.attackerZones.isNotEmpty) {
      final zoneDimensions = _calculateZoneDimensionsWidget(map.attackerZones);
      if (zoneDimensions.isNotEmpty) {
        result.add(DeploymentZoneInfo(
          label: '🔴 Attacker',
          dimensions: zoneDimensions,
          color: Colors.red[300]!,
        ));
      }
    }

    // считаем для зон защитника
    if (map.defenderZones.isNotEmpty) {
      final zoneDimensions = _calculateZoneDimensionsWidget(map.defenderZones);
      if (zoneDimensions.isNotEmpty) {
        result.add(DeploymentZoneInfo(
          label: '🟢 Defender',
          dimensions: zoneDimensions,
          color: Colors.green[300]!,
        ));
      }
    }

    return result;
  }

  String _calculateZoneDimensionsWidget(List<List<MapPoint>> zones) {
    if (zones.isEmpty) return '';

    // Для каждой зоны вычисляем границы и находим общие размеры
    double minX = double.infinity;
    double maxX = double.negativeInfinity;
    double minY = double.infinity;
    double maxY = double.negativeInfinity;

    for (final zone in zones) {
      final normalizedZone = _normalizePoints(zone);

      for (final point in normalizedZone) {
        minX = math.min(minX, point.x);
        maxX = math.max(maxX, point.x);
        minY = math.min(minY, point.y);
        maxY = math.max(maxY, point.y);
      }
    }

    if (minX == double.infinity) return '';

    final width = (maxX - minX).round();
    final height = (maxY - minY).round();

    return '${width}"×${height}"';
  }
}

class MissionMapPainter extends CustomPainter {
  final MissionMap map;
  final double tableWInches;
  final double tableHInches;
  final double scale;
  final MapPoint Function(MapPoint) normalizePoint;
  final List<MapPoint> Function(List<MapPoint>) normalizePoints;

  MissionMapPainter({
    required this.map,
    required this.tableWInches,
    required this.tableHInches,
    required this.scale,
    required this.normalizePoint,
    required this.normalizePoints,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Фон
    paint.color = const Color(0xFF2A2A2A);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    _drawZones(canvas, size, paint);
    _drawGrid(canvas, size, paint);
    _drawCenterLines(canvas, size, paint);
    _drawSpecialNumberBoundary(canvas, size, paint);
    _drawPoints(canvas, size, paint);
    _drawDistanceLines(canvas, size, paint);
    _drawDebugOverlay(canvas, size, paint);
  }

  /// Преобразование координат из базового размера в текущий размер стола
  MapPoint _normalizePoint(MapPoint point) {
    return normalizePoint(point);
  }

  /// Преобразование списка точек
  List<MapPoint> _normalizePoints(List<MapPoint> points) {
    return normalizePoints(points);
  }

  void _drawSpecialNumberBoundary(Canvas canvas, Size size, Paint paint) {
    // Проверяем, есть ли specialNumber для отображения
    if (map.specialNumber == null || map.specialNumber! <= 0) return;

    final centerX = tableWInches / 2; // центр в мировых координатах
    final centerY = tableHInches / 2;
    final radius = map.specialNumber!;

    // Преобразуем центр и радиус в экранные координаты
    final scaledCenterX = (centerY / tableHInches) * size.width;
    final scaledCenterY = (centerX / tableWInches) * size.height;
    final scaledRadius = (radius / tableHInches) * size.width;

    // Настраиваем стиль для пунктирной линии
    paint.color = Colors.grey;
    paint.strokeWidth = 2.0;
    paint.style = PaintingStyle.stroke;

    // Рисуем пунктирную окружность
    final path = Path();
    _addDashedCircle(path, Offset(scaledCenterX, scaledCenterY), scaledRadius);
    canvas.drawPath(path, paint);

    // Добавляем подпись с числом
    final labelText = '${map.specialNumber!.toInt()}"';
    final labelPosition = Offset(
      scaledCenterX + scaledRadius * 0.7, // Позиция справа-вверх от центра
      scaledCenterY - scaledRadius * 0.7,
    );

    _drawSpecialNumberLabel(canvas, labelPosition, labelText);
  }

  void _addDashedCircle(Path path, Offset center, double radius) {
    const double dashLength = 8.0;
    const double dashGap = 4.0;
    final double circumference = 2 * math.pi * radius;
    final int dashCount = (circumference / (dashLength + dashGap)).floor();

    for (int i = 0; i < dashCount; i++) {
      final double startAngle = (i * (dashLength + dashGap) / radius);
      final double endAngle = startAngle + (dashLength / radius);

      final double startX = center.dx + radius * math.cos(startAngle);
      final double startY = center.dy + radius * math.sin(startAngle);
      final double endX = center.dx + radius * math.cos(endAngle);
      final double endY = center.dy + radius * math.sin(endAngle);

      path.moveTo(startX, startY);
      path.lineTo(endX, endY);
    }
  }

  void _drawSpecialNumberLabel(Canvas canvas, Offset position, String text) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.orange,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              offset: Offset(1, 1),
              blurRadius: 2,
              color: Colors.black54,
            ),
          ],
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    // Рисуем полупрозрачный фон для лучшей читаемости
    final backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(0.6)
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          position.dx - 4,
          position.dy - 2,
          textPainter.width + 8,
          textPainter.height + 4,
        ),
        const Radius.circular(4),
      ),
      backgroundPaint,
    );

    textPainter.paint(canvas, position);
  }

  void _drawZones(Canvas canvas, Size size, Paint paint) {
    // Зоны атакующего
    paint.color = const Color(0x66CC0000);
    for (final zone in map.attackerZones) {
      final normalizedZone = _normalizePoints(zone);
      final path = _createPolygonPath(normalizedZone, size);
      canvas.drawPath(path, paint);
    }

    // Зоны защитника
    paint.color = const Color(0x6600CC00);
    for (final zone in map.defenderZones) {
      final normalizedZone = _normalizePoints(zone);
      final path = _createPolygonPath(normalizedZone, size);
      canvas.drawPath(path, paint);
    }
  }

  Path _createPolygonPath(List<MapPoint> points, Size size) {
    final path = Path();
    if (points.isEmpty) return path;

    final scaledPoints = _scaleZonePoints(points, size);
    final first = scaledPoints.first;
    path.moveTo(first.dx, first.dy);

    for (int i = 1; i < scaledPoints.length; i++) {
      final p = scaledPoints[i];
      path.lineTo(p.dx, p.dy);
    }

    // Замыкаем точно к расчётной первой точке
    path.lineTo(first.dx, first.dy);
    path.close();

    // Если есть specialNumber, создаём путь с исключённой центральной зоной
    if (map.specialNumber != null && map.specialNumber! > 0) {
      final neutralZonePath = _createNeutralZonePath(size);
      // Используем Path.combine для вычитания нейтральной зоны
      final combinedPath = Path.combine(PathOperation.difference, path, neutralZonePath);
      return combinedPath;
    }

    return path;
  }

  Path _createNeutralZonePath(Size size) {
    final centerX = tableWInches / 2; // центр в мировых координатах
    final centerY = tableHInches / 2;

    // specialNumber остаётся константой в дюймах, но масштабируется пропорционально
    final radius = map.specialNumber!;

    // Преобразуем центр и радиус в экранные координаты
    final scaledCenterX = (centerY / tableHInches) * size.width;
    final scaledCenterY = (centerX / tableWInches) * size.height;
    final scaledRadius = (radius / tableHInches) * size.width; // используем масштаб по X

    final neutralPath = Path();
    neutralPath.addOval(Rect.fromCircle(
      center: Offset(scaledCenterX, scaledCenterY),
      radius: scaledRadius,
    ));

    return neutralPath;
  }

  void _drawGrid(Canvas canvas, Size size, Paint paint) {
    paint
      ..color = const Color(0x33FFFFFF)
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    final int h = tableHInches.round();
    final int w = tableWInches.round();

    // Вертикальные: 0..H по X
    for (int i = 0; i <= h; i++) {
      final double x = (i / h) * size.width;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Горизонтальные: 0..W по Y
    for (int i = 0; i <= w; i++) {
      final double y = (i / w) * size.height;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    _drawGridLabels(canvas, size, paint);
  }

  void _drawGridLabels(Canvas canvas, Size size, Paint paint) {
    const int labelStep = 6;
    final int h = tableHInches.round();
    final int w = tableWInches.round();

    for (int i = labelStep; i < h; i += labelStep) {
      final double x = (i / h) * size.width;
      _drawLabel(canvas, Offset(x, size.height - 15), '${i}', Colors.white54);
    }
    for (int i = labelStep; i < w; i += labelStep) {
      final double y = (i / w) * size.height;
      _drawLabel(canvas, Offset(5, y), '${i}', Colors.white54);
    }

    _drawLabel(canvas, const Offset(2, 12), '(0,0)', Colors.white70);
    _drawLabel(canvas, Offset(size.width - 60, 12), '(${tableHInches.toInt()},0)', Colors.white70);
    _drawLabel(canvas, Offset(2, size.height - 5), '(0,${tableWInches.toInt()})', Colors.white70);
    _drawLabel(canvas, Offset(size.width - 80, size.height - 5),
        '(${tableHInches.toInt()},${tableWInches.toInt()})', Colors.white70);
    _drawLabel(canvas, Offset(size.width / 2 - 60, 12),
        '${tableHInches.toInt()}"×${tableWInches.toInt()}"', Colors.yellow);
  }

  void _drawLabel(Canvas canvas, Offset position, String text, Color color) {
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w400),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(canvas, position);
  }

  void _drawCenterLines(Canvas canvas, Size size, Paint paint) {
    paint.color = Colors.white54;
    paint.strokeWidth = 1.5;
    paint.style = PaintingStyle.stroke;

    final path = Path();

    final centerX = size.width / 2;
    _addDashedLine(path, Offset(centerX, 0), Offset(centerX, size.height));

    final centerY = size.height / 2;
    _addDashedLine(path, Offset(0, centerY), Offset(size.width, centerY));

    canvas.drawPath(path, paint);
  }

  void _addDashedLine(Path path, Offset start, Offset end) {
    const double dashLength = 6.0;
    const double dashGap = 3.0;

    final distance = (end - start).distance;
    final dashCount = (distance / (dashLength + dashGap)).floor();

    final dx = (end.dx - start.dx) / distance;
    final dy = (end.dy - start.dy) / distance;

    for (int i = 0; i < dashCount; i++) {
      final dashStart = Offset(
        start.dx + dx * i * (dashLength + dashGap),
        start.dy + dy * i * (dashLength + dashGap),
      );
      final dashEnd = Offset(
        dashStart.dx + dx * dashLength,
        dashStart.dy + dy * dashLength,
      );

      path.moveTo(dashStart.dx, dashStart.dy);
      path.lineTo(dashEnd.dx, dashEnd.dy);
    }
  }

  void _drawDistanceLines(Canvas canvas, Size size, Paint paint) {
    final normalizedPoints = _normalizePoints(map.points);
    final objectivePoints = normalizedPoints.where((p) => p.type == 'objective').toList();
    if (objectivePoints.isEmpty) return;

    paint.color = Colors.yellowAccent.withOpacity(0.5);
    paint.strokeWidth = 2.5;
    paint.style = PaintingStyle.stroke;

    // Центр стола в мировых координатах
    final centerX = tableWInches / 2;
    final centerY = tableHInches / 2;

    final isCenterPointExists = objectivePoints.any((p) {
      return (p.x - centerX).abs() < 0.5 && (p.y - centerY).abs() < 0.5;
    });

    for (final point in objectivePoints) {
      if ((point.x - centerX).abs() < 0.5 && (point.y - centerY).abs() < 0.5) continue;
      _drawPathFromCenterToPoint(
        canvas, size, paint, centerX, centerY, point, objectivePoints, isCenterPointExists,
      );
    }
  }

  void _drawPathFromCenterToPoint(
      Canvas canvas,
      Size size,
      Paint paint,
      double centerX,
      double centerY,
      MapPoint targetPoint,
      List<MapPoint> allPoints,
      bool centerPointExists
      ) {
    final List<MapPoint> pathPoints = [];
    if (centerPointExists) {
      pathPoints.add(MapPoint(id: 'center', x: centerX, y: centerY, type: 'center'));
    }

    MapPoint currentPoint = MapPoint(id: 'current', x: centerX, y: centerY, type: 'center');

    final horizontalPoint = allPoints.where((p) =>
    (p.y - centerY).abs() < 0.5 &&
        ((p.x > centerX && p.x < targetPoint.x) || (p.x < centerX && p.x > targetPoint.x))
    ).toList();

    final verticalPoint = allPoints.where((p) =>
    (p.x - targetPoint.x).abs() < 0.5 &&
        ((p.y > centerY && p.y < targetPoint.y) || (p.y < centerY && p.y > targetPoint.y))
    ).toList();

    if (horizontalPoint.isNotEmpty) {
      horizontalPoint.sort((a, b) =>
          (a.x - centerX).abs().compareTo((b.x - centerX).abs()));
      final nextPoint = horizontalPoint.first;
      pathPoints.add(nextPoint);
      _drawSegmentWithDistance(canvas, size, paint, currentPoint, nextPoint, true);
      currentPoint = nextPoint;

      final verticalFromHorizontal = allPoints.where((p) =>
      (p.x - currentPoint.x).abs() < 0.5 &&
          ((p.y > currentPoint.y && p.y < targetPoint.y) || (p.y < currentPoint.y && p.y > targetPoint.y))
      ).toList();

      if (verticalFromHorizontal.isNotEmpty) {
        verticalFromHorizontal.sort((a, b) =>
            (a.y - currentPoint.y).abs().compareTo((b.y - currentPoint.y).abs()));
        final nextVerticalPoint = verticalFromHorizontal.first;
        pathPoints.add(nextVerticalPoint);
        _drawSegmentWithDistance(canvas, size, paint, currentPoint, nextVerticalPoint, false);
        currentPoint = nextVerticalPoint;
      }
    } else if (verticalPoint.isNotEmpty) {
      verticalPoint.sort((a, b) =>
          (a.y - centerY).abs().compareTo((b.y - centerY).abs()));
      final nextPoint = verticalPoint.first;
      pathPoints.add(nextPoint);
      _drawSegmentWithDistance(canvas, size, paint, currentPoint, nextPoint, false);
      currentPoint = nextPoint;

      if ((currentPoint.x - targetPoint.x).abs() > 0.5) {
        _drawSegmentWithDistance(canvas, size, paint, currentPoint, targetPoint, true);
      }
      return;
    }

    if ((currentPoint.x - targetPoint.x).abs() > 0.5) {
      final horizontalTarget = MapPoint(id: 'temp', x: targetPoint.x, y: currentPoint.y, type: 'temp');
      _drawSegmentWithDistance(canvas, size, paint, currentPoint, horizontalTarget, true);
      currentPoint = horizontalTarget;
    }
    if ((currentPoint.y - targetPoint.y).abs() > 0.5) {
      _drawSegmentWithDistance(canvas, size, paint, currentPoint, targetPoint, false);
    }
  }

  void _drawSegmentWithDistance(
      Canvas canvas,
      Size size,
      Paint paint,
      MapPoint startPoint,
      MapPoint endPoint,
      bool isHorizontal
      ) {
    final scaledStart = _scalePoint(startPoint, size);
    final scaledEnd = _scalePoint(endPoint, size);

    canvas.drawLine(scaledStart, scaledEnd, paint);

    final distance = isHorizontal
        ? (endPoint.x - startPoint.x).abs()
        : (endPoint.y - startPoint.y).abs();

    if (distance > 0.5) {
      final midPoint = Offset(
        (scaledStart.dx + scaledEnd.dx) / 2,
        (scaledStart.dy + scaledEnd.dy) / 2,
      );

      _drawDistanceLabel(canvas, midPoint, distance.round(), !isHorizontal);
    }
  }

  void _drawDistanceLabel(Canvas canvas, Offset position, int distance, bool isVertical) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: '${distance}"',
        style: const TextStyle(
          color: Colors.yellow,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    final offset = isVertical
        ? Offset(position.dx + 8, position.dy - textPainter.height / 2)
        : Offset(position.dx - textPainter.width / 2, position.dy - 16);

    final backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(0.7)
      ..style = PaintingStyle.fill;

    canvas.drawRect(
      Rect.fromLTWH(
        offset.dx - 2,
        offset.dy - 1,
        textPainter.width + 4,
        textPainter.height + 2,
      ),
      backgroundPaint,
    );

    textPainter.paint(canvas, offset);
  }

  void _drawPoints(Canvas canvas, Size size, Paint paint) {
    final normalizedPoints = _normalizePoints(map.points);

    for (final point in normalizedPoints) {
      final scaledPoint = _scalePoint(point, size);

      Color pointColor;
      switch (point.type) {
        case 'objective':
          pointColor = Colors.white;
          break;
        case 'attacker_zone':
          pointColor = Colors.red;
          break;
        case 'defender_zone':
          pointColor = Colors.green;
          break;
        default:
          pointColor = Colors.grey;
      }

      paint.color = Colors.black;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(scaledPoint, 8, paint);

      paint.color = pointColor;
      canvas.drawCircle(scaledPoint, 6, paint);

      if (point.type == 'objective') {
        paint.color = Colors.black;
        paint.strokeWidth = 1.5;
        paint.style = PaintingStyle.stroke;

        canvas.drawLine(
          Offset(scaledPoint.dx - 3, scaledPoint.dy - 3),
          Offset(scaledPoint.dx + 3, scaledPoint.dy + 3),
          paint,
        );
        canvas.drawLine(
          Offset(scaledPoint.dx + 3, scaledPoint.dy - 3),
          Offset(scaledPoint.dx - 3, scaledPoint.dy + 3),
          paint,
        );
      }

      if (point.type == 'objective') {
        // Показываем текущие мировые координаты в метке
        _drawLabel(
          canvas,
          Offset(scaledPoint.dx + 10, scaledPoint.dy - 5),
          '(${point.x.round()},${point.y.round()})',
          Colors.cyan,
        );
      }
    }
  }

  void _drawDebugOverlay(Canvas canvas, Size size, Paint paint) {
    // Debug: показываем базовые и текущие размеры стола
    _drawLabel(
      canvas,
      Offset(size.width - 120, size.height - 25),
      'Base: ${map.baseW.toInt()}×${map.baseH.toInt()}',
      Colors.orange,
    );

    // Debug: показываем specialNumber если есть
    if (map.specialNumber != null) {
      _drawLabel(
        canvas,
        Offset(size.width - 120, size.height - 40),
        'Neutral: ${map.specialNumber!.toInt()}"',
        Colors.orange,
      );
    }
  }

  /// Масштабирование точек зон игроков с учетом текущих размеров поля
  List<Offset> _scaleZonePoints(List<MapPoint> points, Size size) {
    return points.map((point) => _scaleZonePoint(point, size)).toList();
  }

  /// Масштабирование одной точки зоны игрока
  Offset _scaleZonePoint(MapPoint point, Size size) {
    // Преобразуем в экранные координаты (с учетом поворота осей)
    final dx = (point.y / tableHInches) * size.width;
    final dy = (point.x / tableWInches) * size.height;

    // Клампп внутрь холста на под-пиксель
    const eps = 0.5;
    final x = dx.clamp(0.0, size.width - eps);
    final y = dy.clamp(0.0, size.height - eps);
    return Offset(x, y);
  }

  Offset _scalePoint(MapPoint point, Size size) {
    // Экран X ← inches Y, экран Y ← inches X
    final dx = (point.y / tableHInches) * size.width;
    final dy = (point.x / tableWInches) * size.height;

    // Клампп внутрь холста на под-пиксель
    const eps = 0.5; // визуально убирает «выпадение» на границе
    final x = dx.clamp(0.0, size.width - eps);
    final y = dy.clamp(0.0, size.height - eps);
    return Offset(x, y);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}