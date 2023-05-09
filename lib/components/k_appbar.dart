
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walkmate/components/my_arc.dart';

import 'package:walkmate/styles/k_colors.dart';

class KAppBar extends StatelessWidget {
   Color arcColor;
   VoidCallback onPressed; 
   Color  color; 
   Color textColor;
   KAppBar({
    this.arcColor = KColor.stickerColor, 
    required this.onPressed, 
     this.color = KColor.baseBlack,
     this.textColor = KColor.white, 
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation:  0 , 
      backgroundColor: color,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: color, 
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "WalkMate",
            style: TextStyle(
              color: textColor,
              fontSize: 31,
              fontWeight: FontWeight.w700,
              fontFamily: GoogleFonts.inter().fontFamily,
            ),
          ),
          MyArc(
            borderColor: arcColor,
            diameter: 30,
           onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}

