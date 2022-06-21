import 'package:flutter/material.dart';

class MainInput extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final Icon? icon;
  const MainInput({Key? key, required this.hintText,this.icon, this.controller})
      : super(key: key);

  @override
  State<MainInput> createState() => _MainInputState();
}

class _MainInputState extends State<MainInput> {
  var border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(50),
    borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3f000000),
            blurRadius: 4,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.all(25),
          border: border,
          focusedBorder: border,
          enabledBorder: border,
          errorBorder: border,
          disabledBorder: border,
          prefixIcon: (widget.icon != null)?Padding(
              padding: EdgeInsets.only(left: 15, right: 10),
              child: widget.icon):null,
        ),
      ),
    );
  }
}
