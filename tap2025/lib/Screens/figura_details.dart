import 'package:flutter/material.dart';
import 'package:tap2025/utils/counter_widget.dart';
import 'package:tap2025/utils/figura_entity.dart';
import 'package:tap2025/utils/my_button.dart';
import 'package:tap2025/utils/reviews_list.dart';
import 'package:tap2025/utils/simple_rating_bar.dart';

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
      backgroundColor: const Color.fromARGB(255, 220, 220, 220),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(bottom: 48),
            children: [
              AspectRatio(
                aspectRatio: 0.86,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final imageHeight = constraints.maxHeight * 0.7;
                    final imageHorizontalMargin = constraints.maxWidth * 0.15;
                    final imageBottomMargin = constraints.maxHeight * 0.07;
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: widget.figura.color,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          margin: EdgeInsets.only(bottom: 26),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding:  EdgeInsets.only(
                                left: imageHorizontalMargin,
                                right: imageHorizontalMargin,
                                bottom: imageBottomMargin,
                              ),
                              child: Image.network(
                                widget.figura.image,
                                height: imageHeight,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: CounterWidget(
                            currentCount: count, 
                            color: widget.figura.color,
                            onIncreaseClicked: (){
                              setState(() {
                                count++;
                              });
                            },
                            onDecreaseClicked: () {
                              setState(() {
                                if(count>0){
                                  count--;
                                }
                              });
                            },
                          )
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 58,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.figura.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SimpleRatingBar(color: widget.figura.color),
                      ],
                    ),
                    SizedBox(height: 18,),
                    Text(
                      widget.figura.dscp,
                      style: TextStyle(color: Color(0xFFB0B1B4),fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Reviews',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'See all',
                          style: TextStyle(
                            color: Color(0xFFD81C33), 
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        ],
                    ),
                    SizedBox(height: 16,),
                    ReviewsList(),
                  ],
                ),
              )
            ],
          ),
          Container(
            color: widget.figura.color,
            padding: EdgeInsets.only(left: 14, right: 24,top: 40,bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Image.network(
                    'https://flutter4fun.com/wp-content/uploads/2021/09/back.png',
                    width: 32,
                  ),
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                ),
                Text(
                  'Figuras',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Image.network(
                  'https://flutter4fun.com/wp-content/uploads/2021/09/shop_white.png',
                  width: 32,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 48,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black
                        ),
                        children: [
                          TextSpan(
                            text: '\$',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: widget.figura.price,
                            style:TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ), 
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    height: 48,
                    child: MyButton(
                      text: 'Buy Now',
                      textColor: Colors.white,
                      bgColor: widget.figura.color,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}