import 'package:flutter/material.dart';
import 'package:g_cinema_layout/btn_seat.dart';

class RowSeats extends StatelessWidget {
  final int totalSeats;
  final String seatLetter;
  final double sizeButton;
  final Color color;
  final Color iconColor;
  final IconData toggleIcon;
  final Color toggleColor;
  final List<int> specialSeats;
  final List<int> blockSeats;
  final Function(String seatLetter, int) onTap;
  const RowSeats({
    Key? key,
    required this.totalSeats,
    required this.seatLetter,
    this.specialSeats = const [],
    this.blockSeats = const [],
    required this.onTap,
    this.sizeButton = 30,
    this.color = Colors.blue,
    this.iconColor = Colors.white,
    this.toggleIcon = Icons.person,
    this.toggleColor = Colors.black,
  }) : super(key: key);

  List<Widget> _generateSeats() {
    List<Widget> seats = [];
    for (int i = 1; i <= totalSeats; i++) {
      seats.add(BtnSeat(
        seatNumber: i,
        seatLetter: seatLetter,
        size: sizeButton - (sizeButton * 0.1),
        isSpecialSeat: specialSeats.contains(i),
        isBlocked: blockSeats.contains(i),
        color: color,
        iconColor: iconColor,
        toggleIcon: toggleIcon,
        toggleColor: toggleColor,
        onTap: onTap,
      ));
      seats.add(SizedBox(width: sizeButton * 0.1)); //space between seats
    }
    return seats;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _generateSeats(),
    );
  }
}
