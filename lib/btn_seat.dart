import 'package:flutter/material.dart';

class BtnSeat extends StatefulWidget {
  final bool isSpecialSeat;
  final int seatNumber;
  final String seatLetter;
  final bool isBlocked;
  final double size;
  final Color color;
  final Color iconColor;
  final IconData toggleIcon;
  final Color toggleColor;
  final Function(String seatLetter, int seatNumber) onTap;
  const BtnSeat({
    Key? key,
    this.isSpecialSeat = false,
    required this.seatNumber,
    required this.seatLetter,
    this.isBlocked = false,
    this.size = 30,
    this.color = Colors.blue,
    this.iconColor = Colors.white,
    this.toggleIcon = Icons.person,
    this.toggleColor = Colors.black,
    required this.onTap,
  }) : super(key: key);

  @override
  State<BtnSeat> createState() => _BtnSeatState();
}

class _BtnSeatState extends State<BtnSeat> {
  bool _toggle = false;

  @override
  void initState() {
    _toggle = widget.isBlocked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (_toggle) {
      content = Icon(
        widget.toggleIcon,
        color: widget.toggleColor,
        size: widget.size,
      );
    } else {
      if (widget.isSpecialSeat) {
        content = Icon(
          size: widget.size,
          Icons.accessible_outlined,
          color: widget.iconColor,
        );
      } else {
        content = Center(
          child: Text(
            widget.seatNumber.toString(),
            style:
                TextStyle(color: widget.iconColor, fontSize: widget.size * 0.7),
          ),
        );
      }
    }

    return GestureDetector(
      onTap: () {
        if (widget.isBlocked) {
          return;
        }
        widget.onTap(widget.seatLetter, widget.seatNumber);
        setState(() {
          _toggle = !_toggle;
        });
      },
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.size * 0.2),
          color: widget.color,
        ),
        child: content,
      ),
    );
  }
}
