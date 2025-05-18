import 'package:flutter/material.dart';
import 'package:tap2025/utils/counter_widget.dart';
import 'package:tap2025/utils/figura_entity.dart';

class FiguraDetails extends StatefulWidget {
  final FiguraEntity figura;
  const FiguraDetails({super.key, required this.figura});

  @override
  State<FiguraDetails> createState() => _FiguraDetailsState();
}

class _FiguraDetailsState extends State<FiguraDetails> {
  var count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: AspectRatio(
        aspectRatio: 0.86,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final imageHeight = constraints.maxHeight * 0.7;
            final imageHorizontalMargin = constraints.maxWidth * 0.15;
            final imageBottomMargin = constraints.maxHeight * 0.07;
            return Container(
              decoration: BoxDecoration(
                color: widget.figura.color,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.network(
                  'https://images.cults3d.com/1-X0WO4v5fpUztQgTx4bm6bZ_K4=/516x516/filters:no_upscale():format(webp)/https://fbi.cults3d.com/uploaders/27976287/illustration-file/c0dd2c4e-497b-41dc-a6d0-c57a5415cc38/02.png',
                  height: imageHeight,
                ),
              ),
            );
          },
          /*child: Center(
            child: CounterWidget(
              currentCount: count, 
              color: widget.juice.color,
              onIncreaseClicked: (){
                setState(() {
                  count++;
                });
              },
              onDecreaseClicked: () {
                setState(() {
                  count--;
                });
              },
            ),
          ),*/
        ),
      ),
    );
  }
}