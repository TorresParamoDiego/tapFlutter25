import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  final String text;
  final Color textColor;
  final Color bgColor;
  const MyButton({
    super.key,
    required this.text,
    required this.textColor, 
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){}, 
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: textColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color:textColor,width: 2)
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(text)
    );
  }
}