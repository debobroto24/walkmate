import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:walkmate/components/Kbutton_style2.dart';
// import 'package:walkmate/components/Kslider.dart';
import 'dart:ui' as ui;
import 'package:walkmate/components/k_appbar.dart';
import 'package:walkmate/components/kbutton_style1.dart';
import 'package:walkmate/components/opacitiy_button.dart';
import 'package:walkmate/provider/checkpoint_provider.dart';
import 'package:walkmate/styles/k_colors.dart';
import 'package:walkmate/styles/k_text_styles.dart';
import 'package:walkmate/theme/theme_modal.dart';

class CheckPoint extends StatefulWidget {
  const CheckPoint({super.key});

  @override
  State<CheckPoint> createState() => _CheckPointState();
}

class _CheckPointState extends State<CheckPoint> {
  double checkpoint = 0;
  // List<double> checkpointList = [];

  late ThemeModal themeNotifier;
  late CheckPointProvider checkPointProvider;
  @override
  Widget build(BuildContext context) {
    themeNotifier = Provider.of<ThemeModal>(context);
    checkPointProvider = Provider.of<CheckPointProvider>(context);
    return Scaffold(
      backgroundColor: themeNotifier.isDark ? KColor.baseBlack : KColor.white,
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
              height: MediaQuery.of(context).size.height * .3,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      KSliderWidget(context),
                      const SizedBox(width: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Completed",
                            style: KTextStyle.headline5Dark,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "${checkpoint.toInt()}",
                                    style: KTextStyle.headline1white),
                                TextSpan(text: "m", style: KTextStyle.caption1),
                              ]),
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * .08),
                          Text(
                            "Target",
                            style: KTextStyle.headline5Dark,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "5000",
                                    style: KTextStyle.headline1white),
                                TextSpan(text: "m", style: KTextStyle.caption1),
                              ]),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.topLeft,
              child: Text("CHECKPOINTS", style: themeNotifier.isDark? KTextStyle.headline2White: KTextStyle.headline2Black),
            ),
            CheckPointListWidget(checkPointProvider: checkPointProvider, themeNotifier: themeNotifier,),
            SizedBox(
              height: MediaQuery.of(context).size.height * .012,
            ),
            GestureDetector(
                onTap: () {
                  if (checkpoint > 0) {
                    checkPointProvider.setCheckPointList(checkpoint);
                  }
                },
                child: KButtonStyle1(text: "Check point")),
            const SizedBox(height: 20),
            const kbutton_style2(text: "Mark As Completed"),
          ],
        ),
      ),
    );
  }

  ClipRRect KSliderWidget(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      child: Container(
        width: MediaQuery.of(context).size.width * .17,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(width: 2, color: Colors.white),
        ),
        child: SliderTheme(
          data: SliderThemeData(
            
              inactiveTrackColor: Colors.transparent,
              trackHeight: MediaQuery.of(context).size.width * .17 - 4,
              disabledActiveTrackColor: Colors.transparent,
              activeTickMarkColor: KColor.white,
              activeTrackColor: KColor.white,
              inactiveTickMarkColor: Colors.transparent,
              trackShape: const KRoundedRectSliderTrackShape(),
              // trackShape: RoundedRectSliderTrackShape(),
              // trackShape: RectangularSliderTrackShape(),
              // overlayShape: SliderComponentShape.noOverlay,
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
              thumbShape: SliderComponentShape.noOverlay),
          child: RotatedBox(
            quarterTurns: 3,
            child: Slider(
              value: checkpoint,
              min: 0,
              max: 5000,
              divisions: 4,
              onChanged: (double value) {
                setState(() {
                  checkpoint = value;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CheckPointListWidget extends StatelessWidget {

  const CheckPointListWidget({
    super.key,
    required this.themeNotifier, 
    required this.checkPointProvider,
  });

  final CheckPointProvider checkPointProvider;
  final ThemeModal themeNotifier; 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .27,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: checkPointProvider.checkPointList.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Checkpoint ${index + 1}", style: themeNotifier.isDark? KTextStyle.subtitle1White: KTextStyle.subtitle1Black,),
                Text("${checkPointProvider.checkPointList[index].toInt()}m",  style: themeNotifier.isDark? KTextStyle.subtitle1White: KTextStyle.subtitle1Black,),
              ],
            ),
          );
        },
      ),
    );
  }
}

// track shape
class KRoundedRectSliderTrackShape extends SliderTrackShape
    with BaseSliderTrackShape {
  /// Create a slider track that draws two rectangles with rounded outer edges.
  const KRoundedRectSliderTrackShape();

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required TextDirection textDirection,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool isDiscrete = false,
    bool isEnabled = false,
    double additionalActiveTrackHeight = 2,
  }) {
    assert(context != null);
    assert(offset != null);
    assert(parentBox != null);
    assert(sliderTheme != null);
    assert(sliderTheme.disabledActiveTrackColor != null);
    assert(sliderTheme.disabledInactiveTrackColor != null);
    assert(sliderTheme.activeTrackColor != null);
    assert(sliderTheme.inactiveTrackColor != null);
    assert(sliderTheme.thumbShape != null);
    assert(enableAnimation != null);
    assert(textDirection != null);
    assert(thumbCenter != null);
    // If the slider [SliderThemeData.trackHeight] is less than or equal to 0,
    // then it makes no difference whether the track is painted or not,
    // therefore the painting can be a no-op.
    if (sliderTheme.trackHeight == null || sliderTheme.trackHeight! <= 0) {
      return;
    }

    // Assign the track segment paints, which are leading: active and
    // trailing: inactive.
    final ColorTween activeTrackColorTween = ColorTween(
        begin: sliderTheme.disabledActiveTrackColor,
        end: sliderTheme.activeTrackColor);
    final ColorTween inactiveTrackColorTween = ColorTween(
        begin: sliderTheme.disabledInactiveTrackColor,
        end: sliderTheme.inactiveTrackColor);
    final Paint activePaint = Paint()
      ..color = activeTrackColorTween.evaluate(enableAnimation)!;
    final Paint inactivePaint = Paint()
      ..color = inactiveTrackColorTween.evaluate(enableAnimation)!;
    final Paint leftTrackPaint;
    final Paint rightTrackPaint;
    switch (textDirection) {
      case TextDirection.ltr:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
        break;
      case TextDirection.rtl:
        leftTrackPaint = inactivePaint;
        rightTrackPaint = activePaint;
        break;
    }

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );
    // final Radius trackRadius = Radius.circular(trackRect.height / 2);
    // final Radius activeTrackRadius =
    //     Radius.circular((trackRect.height + additionalActiveTrackHeight) / 2);
    final Radius trackRadius = Radius.circular(15);
    final Radius activeTrackRadius = Radius.circular(15);

    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        trackRect.left,
        (textDirection == TextDirection.ltr)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        thumbCenter.dx,
        (textDirection == TextDirection.ltr)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
        bottomLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
      ),
      leftTrackPaint,
    );
    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        thumbCenter.dx,
        (textDirection == TextDirection.rtl)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        trackRect.right,
        (textDirection == TextDirection.rtl)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
        bottomRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
      ),
      rightTrackPaint,
    );

    final bool showSecondaryTrack = (secondaryOffset != null) &&
        ((textDirection == TextDirection.ltr)
            ? (secondaryOffset.dx > thumbCenter.dx)
            : (secondaryOffset.dx < thumbCenter.dx));

    if (showSecondaryTrack) {
      final ColorTween secondaryTrackColorTween = ColorTween(
          begin: sliderTheme.disabledSecondaryActiveTrackColor,
          end: sliderTheme.secondaryActiveTrackColor);
      final Paint secondaryTrackPaint = Paint()
        ..color = secondaryTrackColorTween.evaluate(enableAnimation)!;
      if (textDirection == TextDirection.ltr) {
        context.canvas.drawRRect(
          RRect.fromLTRBAndCorners(
            thumbCenter.dx,
            trackRect.top,
            secondaryOffset.dx,
            trackRect.bottom,
            topRight: trackRadius,
            bottomRight: trackRadius,
          ),
          secondaryTrackPaint,
        );
      } else {
        context.canvas.drawRRect(
          RRect.fromLTRBAndCorners(
            secondaryOffset.dx,
            trackRect.top,
            thumbCenter.dx,
            trackRect.bottom,
            topLeft: trackRadius,
            bottomLeft: trackRadius,
          ),
          secondaryTrackPaint,
        );
      }
    }
  }
}




