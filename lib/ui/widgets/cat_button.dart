import 'package:flutter/material.dart';

class CatButton extends StatelessWidget{
  final String label;
  final Function onPressed;

  const CatButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF351F52))
      ),
      onPressed: () => onPressed(),
      child: Text(
          label,
        style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Bahnschrift'
        ),
      ),
    );
  }

}