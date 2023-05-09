import 'package:flutter/material.dart';
import 'package:walkmate/styles/k_colors.dart';
import 'package:walkmate/styles/k_text_styles.dart';

class KButtonStyle1 extends StatelessWidget {
  String text; 
   KButtonStyle1({
    super.key,
    required this.text, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(  
      width: MediaQuery.of(context).size.width * .85,
      height: 55,
      alignment: Alignment.center,
      decoration: BoxDecoration(  
        color:KColor.stickerColor, 
        borderRadius: BorderRadius.circular(30)
      ),
      child: Text(text , style: KTextStyle.subtitle1LightMode), 
    );
  }
}
