import 'package:flutter/material.dart';
import 'package:walkmate/styles/k_colors.dart';
import 'package:walkmate/styles/k_text_styles.dart';

class kbutton_style2 extends StatelessWidget {
  final String text; 
  const kbutton_style2({
    required this.text, 
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(  
       height: 55,
      width: MediaQuery.of(context).size.width * .85,
      alignment: Alignment.center,
      decoration:  BoxDecoration(
        border: Border.all(color: KColor.stickerColor,width: 1.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(  
        text,  
        style: KTextStyle.bodyText1Green,
      )
    );
  }
}