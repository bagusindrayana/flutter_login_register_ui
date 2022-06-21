import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  const MainButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (e) {
        widget.onPressed();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3f000000),
              blurRadius: 4,
              offset: Offset(0, 6),
            ),
          ],
          color: const Color(0xffff6363),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 1,
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
