import 'package:flutter/material.dart';

import 'package:walkmate/components/k_appbar.dart';
import 'package:walkmate/components/kbutton_style1.dart';
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
        backgroundColor: themeNotifier.isDark ? KColor.baseBlack : KColor.white,
        // appBar: PreferredSize(
        //   preferredSize:  Size.fromHeight(100),
        //   child: Padding(
        //     padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
        //     child: KAppBar(
        //       color: themeNotifier.isDark? KColor.black: KColor.white,
        //       textColor: KColor.stickerColor,
        //       onPressed:   () async {
        //     await themeNotifier.getThemePreferences();
        //     themeNotifier.isDark
        //         ? await themeNotifier.setIsDark(false)
        //         : await themeNotifier.setIsDark(true);
        //   },
        //     ),
        //   ),
        // ),

        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: KAppBar(
                onPressed:   () async {
            await themeNotifier.getThemePreferences();
            themeNotifier.isDark
                ? await themeNotifier.setIsDark(false)
                : await themeNotifier.setIsDark(true);
          },
         color: themeNotifier.isDark? KColor.baseBlack: KColor.white, textColor: Colors.green)),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Set your walking goal today",
                style: themeNotifier.isDark
                    ? KTextStyle.headline1Dark
                    : KTextStyle.headline1Lite,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Stack(
                  children: [
                    const Positioned.fill(
                      child: Image(
                        image: AssetImage('assets/images/person.png'),
                      ),
                    ),
                    Positioned(
                      bottom: 17,
                      child: KButtonStyle1(text: "Get Started"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
