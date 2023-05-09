import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walkmate/components/Kbutton_style2.dart';

import 'package:walkmate/components/k_appbar.dart';
import 'package:walkmate/components/opacitiy_button.dart';
import 'package:walkmate/styles/k_colors.dart';
import 'package:walkmate/styles/k_text_styles.dart';
import 'package:walkmate/theme/theme_modal.dart';

class SetLimit extends StatefulWidget {
  const SetLimit({super.key});

  @override
  State<SetLimit> createState() => _SetLimitState();
}

class _SetLimitState extends State<SetLimit> {
 late double limit= 0; 
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ThemeModal themeNotifier, child) {
        return Scaffold(
          backgroundColor:
              themeNotifier.isDark ? KColor.baseBlack : KColor.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: KAppBar(
              onPressed: () async {
                await themeNotifier.getThemePreferences();
                themeNotifier.isDark
                    ? await themeNotifier.setIsDark(false)
                    : await themeNotifier.setIsDark(true);
              },
              textColor: KColor.white,
              color: KColor.stickerColor,
              arcColor: themeNotifier.isDark ? KColor.baseBlack : KColor.white,
            ),
          ),
          body: Container(
            color: themeNotifier.isDark ? KColor.baseBlack : KColor.white,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .4,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  decoration: const BoxDecoration(
                    color: KColor.stickerColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .04,
                      ),
                      Text("Set Your Walking Goal Now",
                          style: KTextStyle.headline1white),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .05,
                      ),
                      Text(
                        "Your determination and effort is inspiring. Keep pusing yourself to reach new height",
                        style: KTextStyle.subtitle7Dark,
                      ),
                    ],
                  ),
                ),
                // Slider(value: 4, onChanged: (value){
                //   setState(() {
                //     limit = value;
                //   });
                // }), 
               
                SizedBox(height: MediaQuery.of(context).size.height * .2),
                OpacityButton(text: "Set Limit"),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                const kbutton_style2(text: "History"),
              ],
            ),
          ),
        );
      },
    );
  }
}
