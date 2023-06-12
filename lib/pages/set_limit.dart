import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:walkmate/components/Kbutton_style2.dart';
import 'package:walkmate/components/Kslider.dart';
import 'dart:ui' as ui;
import 'package:walkmate/components/k_appbar.dart';
import 'package:walkmate/components/opacitiy_button.dart';
import 'package:walkmate/route/routegenerator.dart';
import 'package:walkmate/styles/k_colors.dart';
import 'package:walkmate/styles/k_text_styles.dart';
import 'package:walkmate/theme/theme_modal.dart';

class SetLimit extends StatefulWidget {
  const SetLimit({super.key});

  @override
  State<SetLimit> createState() => _SetLimitState();
}

class _SetLimitState extends State<SetLimit> {
  double opacity = 0.0;
  ui.Image? customImage;
  var assetImage = "assets/images/slider_icon.png";
  late int limit = 0;
  Future<ui.Image> load(String asset) async {
    ByteData data = await rootBundle.load(asset);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: 20, targetWidth: 40);
    ui.FrameInfo frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }

  double rating = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load(assetImage).then((image) {
      setState(() {
        customImage = image;
      });
    });
  }

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
                KSliderin(context),
                // KSlider(),
                SizedBox(height: MediaQuery.of(context).size.height * .2),
                OpacityButton(
                  pressed: () => Navigator.of(context).pushNamed(RouteGenerator.checkPointPage),
                  text: "Set Limit",
                  opacity: opacity,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                const kbutton_style2(text: "History"),
              ],
            ),
          ),
        );
      },
    );
  }

  Container KSliderin(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .95,
      alignment: Alignment.center,
      height: 50,
      child: Center(
        child: SliderTheme(
          data: SliderThemeData(
            activeTrackColor: Colors.grey.withOpacity(.3),
            inactiveTrackColor: Colors.grey.withOpacity(.3),
            // thumbColor: Colors.green,
            thumbShape: customImage != null
                ? SliderThumbImgage(image: customImage!)
                : RoundSliderThumbShape(),
              
            // thumbShape: CircleThumbShape(thumbRadius:20)
          ),
          child: Slider(
            value: rating,
            
            onChanged: (double value) {
              setState(() {
                rating = value;
                opacity = (value / 5) / 1000;
              });
            },
            min: 0,
            max: 5000,
            divisions: 2,
          ),
        ),
      ),
    );
  }
}

class SliderThumbImgage extends SliderComponentShape {
  final ui.Image image;
  SliderThumbImgage({required this.image});
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(10, 10);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    var canvas = context.canvas;
    // Offset center = const Offset(15, 25);
    // var paintCr = Paint()..color = KColor.stickerColor;
    // canvas.drawCircle(center, 15, paintCr);
    // paintCr.shader = ui.Gradient.linear(
    // const  Offset(12,12),
    // const  Offset(20,20) ,
    //   [
    //     Colors.red,
    //     Colors.red,
    //   ],
    //    [0.90, 1.0],
    //   TileMode.repeated, null
    // );
    // canvas.drawCircle(center, 15, paintCr);
    // stckoverflow

//     var paint = Paint();
//     paint.color = Colors.red;
//     paint.style = PaintingStyle.fill;

//     paint.shader = ui.Gradient.linear(
//         Offset(15, 15),
//         //the line interval is 20
//         Offset(20, 20),
//         [
//           //give transparent to start color, give actual line color to the end color
//           Colors.transparent,
//           Colors.red
//         ],
// //The interval [0.0,0.9] is transparent, and the interval [0.9,1.0] is red. So it looks like drawing red lines
//         [0.90, 1.0],
//         //just repeat the gradient
//         TileMode.repeated,
//         null);
//     canvas.drawCircle(const Offset(20, 25), 15, paint);

    // image code
    final picWidth = image.width;
    final picHeight = image.height;

    Offset picOffset = Offset(
      (center.dx - (picWidth / 2)),
      (center.dy - (picHeight / 2)),
    );

    Paint paint = Paint()..filterQuality = FilterQuality.high ;
    canvas.drawImage(image, picOffset, paint);
  }
}
