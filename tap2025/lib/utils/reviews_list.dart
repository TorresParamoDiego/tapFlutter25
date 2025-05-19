import 'package:flutter/material.dart';

class ReviewsList extends StatelessWidget {
  final List<String> reviewImages=['https://i.pravatar.cc/301','https://i.pravatar.cc/302','https://i.pravatar.cc/303','https://i.pravatar.cc/304','https://i.pravatar.cc/305'];
  final String imageURL='https://images.icon-icons.com/1509/PNG/512/viewmorehorizontal_104501.png';
  ReviewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index){
          if(index == reviewImages.length){
            return Image.network(imageURL);
          }
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              reviewImages[index]
            ),
          );
        },
        separatorBuilder: (_,index)=>SizedBox(width: 18,),
        itemCount: reviewImages.length +1,
      ),
    );
  }
}