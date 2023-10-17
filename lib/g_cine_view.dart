library g_cinema_layout;

import 'package:flutter/material.dart';
import 'package:g_cinema_layout/row_seats.dart';

class TheaterRows extends StatelessWidget {
  final Map<String, int> rowsByLetter;
  final Map<String, List<int>> specialSeats;
  final Map<String, List<int>> blockSeats;
  final double width;
  final double maxZoom;
  final Color color;
  final Color iconColor;
  final IconData toggleIcon;
  final Color toggleColor;
  double get _sizeButton {
    List<int> rows = rowsByLetter.values.toList();
    int maxSeats =
        rows.reduce((value, element) => value > element ? value : element);
    double sizeButton = width / (maxSeats + 1);
    return sizeButton;
  }

  final Function(String seatLetter, int seatNumber) onTap;
  const TheaterRows(
      {Key? key,
      required this.rowsByLetter,
      required this.specialSeats,
      required this.blockSeats,
      required this.width,
      this.maxZoom = 3.0,
      this.color = Colors.blue,
      this.iconColor = Colors.white,
      this.toggleIcon = Icons.person,
      this.toggleColor = Colors.black,
      required this.onTap})
      : super(key: key);

  List<Widget> _generateRows() {
    List<Widget> rows = [];
    for (var key in rowsByLetter.keys) {
      int value = rowsByLetter[key] ?? 0;
      rows.add(RowSeats(
        totalSeats: value,
        seatLetter: key,
        specialSeats: specialSeats[key] ?? [],
        blockSeats: blockSeats[key] ?? [],
        sizeButton: _sizeButton,
        onTap: onTap,
        color: color,
        iconColor: iconColor,
        toggleIcon: toggleIcon,
        toggleColor: toggleColor,
      ));
      rows.add(
          SizedBox(height: _sizeButton * 0.3)); //space between RowSeats down
    }
    return rows;
  }

  List<Widget> _generateRowsText() {
    double sizeButton = _sizeButton;
    List<Widget> rows = [];
    for (var key in rowsByLetter.keys) {
      rows.add(SizedBox(
        width: sizeButton,
        height: sizeButton,
        child: Center(
          child: Text(key, style: TextStyle(fontSize: sizeButton * 0.7)),
        ),
      ));
      rows.add(SizedBox(height: sizeButton * 0.3)); //space between letters down
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
        maxScale: maxZoom,
        child: Row(
          children: [
            Column(
              children: _generateRowsText(),
            ),
            Column(
              children: _generateRows(),
            )
          ],
        ));
  }
}
