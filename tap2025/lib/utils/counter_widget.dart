import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  final int currentCount;
  final Color color;
  final VoidCallback? onIncreaseClicked;
  final VoidCallback? onDecreaseClicked;
  final textStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18);

  CounterWidget({super.key, 
    required this.currentCount, 
    required this.color, 
    this.onIncreaseClicked, 
    this.onDecreaseClicked
    
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Color(0xFFF3BE39),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 16),
          GestureDetector(
            onTap: onDecreaseClicked,
            child: Icon(Icons.remove,color: Colors.white),
          ),
          SizedBox(width: 10),
          SizedBox(
            width: 30,
            child: Text(
              currentCount.toString(),
              style: textStyle,
              textAlign: TextAlign.center,
              ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: onIncreaseClicked,
            child: Icon(Icons.add, color: Colors.white),  
          ),
          SizedBox(width: 16)
        ],
      ),
    );
  }
}