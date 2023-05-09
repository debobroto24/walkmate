import 'package:flutter/material.dart';
import 'package:walkmate/components/appbar/my_arc.dart';
import 'package:walkmate/styles/k_colors.dart';
import 'package:walkmate/styles/k_text_styles.dart';
import 'package:walkmate/theme/theme_modal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModal themeNotifier, child) {
      // final provider = Provider.of<ThemeModal>(context).getThemePreferences();
      return Scaffold(
        backgroundColor: themeNotifier.isDark?KColor.baseBlack : KColor.white,
        appBar: PreferredSize(
          preferredSize:const Size.fromHeight(100),
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "WalkMate",
                  style: TextStyle(
                    color: KColor.stickerColor,
                    fontSize: 31,
                    fontWeight: FontWeight.w700,
                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),
                ),
                MyArc(
                  color: KColor.stickerColor, 
                  diameter: 30,
                  onPressed: () async {
                  await themeNotifier.getThemePreferences();
                    themeNotifier.isDark
                        ?await themeNotifier.setIsDark(false)
                        :await themeNotifier.setIsDark(true);

                  },
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Set your walking goal today",
                style: KTextStyle.headline1,
              ), 
              const SizedBox(height:20),
              Stack(  
                children:  [
                 
                   Image(  
                    height: 400 ,
                  image: AssetImage('assets/images/person.png'), 
                               ),
              
                ],
              )
               
               
            ],
          ),
        ),
      );
    });
  }
}
