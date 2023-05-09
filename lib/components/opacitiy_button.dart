import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walkmate/styles/k_colors.dart';

class OpacityButton extends StatelessWidget {
  String text;
  bool isDark;
  double opacity; 
  OpacityButton({
    this.opacity = 0, 
    required this.text,
    this.isDark = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: opacity,
          child: Container(
            width: MediaQuery.of(context).size.width * .85,
            height: 55,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30)),
        
            // child: Text(text , style: KTextStyle.subtitle1LightMode),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * .85,
          height: 55,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: opacity ==0 ? KColor.grey350: KColor.transparent,
              borderRadius: BorderRadius.circular(30)),
          child: Text(
            text,
            style: TextStyle(
              color: opacity==0 ? KColor.grey : KColor.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: GoogleFonts.inter().fontFamily,
            ),
          ),
        ),
      ],
    );
  }
}
