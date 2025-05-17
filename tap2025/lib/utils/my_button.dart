import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  final String text;
  final Color textColor;

  const MyButton({
    Key? key,
    required this.text,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){}, 
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
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