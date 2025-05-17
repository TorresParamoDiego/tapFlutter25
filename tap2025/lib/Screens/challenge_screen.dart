import 'package:flutter/material.dart';
import 'package:tap2025/utils/figura_entity.dart';
import 'package:tap2025/utils/my_button.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenge App'),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            margin: EdgeInsets.only(left: 20,top: 32,right: 20,bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/menu.png'),
                Text('Figuras.',style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),),
                Image.asset('assets/bag.png')
              ],
            ),
        ),
          Expanded(
          child: Center(
          child: ListView.builder(
            padding: const EdgeInsets.all(20.0),
            itemBuilder: (BuildContext context, int index) {
              return FiguraWidget(figuraList[index]);
            },
            itemCount: figuraList.length,
            ),
          ),
        )
        ],
      ),
    );
  }
}

class FiguraWidget extends StatelessWidget{
  final String name;
  final String image;
  final String price;
  final Color color;

  FiguraWidget(FiguraEntity figuraList, {super.key}):
  name=figuraList.name,
  image=figuraList.image,
  price=figuraList.price,
  color=figuraList.color;


  @override
  Widget build(BuildContext context) {
    final textStyle=TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
    return AspectRatio(
      aspectRatio: 1.25,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final topPadding=constraints.maxHeight*0.2;
          final leftPadding=constraints.maxWidth*0.1;
          final imageWidth =constraints.maxWidth*0.6;
          return Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: topPadding),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(24)
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding( 
                      padding: EdgeInsets.only(
                        top: topPadding,
                        left: leftPadding,
                      ), 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: textStyle.copyWith(
                              fontSize: 20,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '\$',
                                  style: textStyle.copyWith(fontSize: 16),
                                ),
                                TextSpan(
                                  text: price,
                                  style: textStyle.copyWith(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ) ,
                          ),
                          SizedBox(
                            height: 40,
                            width: 90,
                            child: MyButton(
                              text: 'Buy Now',
                              textColor: color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: imageWidth,
                    child: Image.asset(
                      image,
                    ),
                  )
                ],
              )
            ]
          );
        } ,
      ),
    );
  }
}

