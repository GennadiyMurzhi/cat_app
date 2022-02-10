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
      onPressed: () => onPressed(),
      child: Text(
          label,
      ),
    );
  }

}