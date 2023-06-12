import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:walkmate/styles/k_colors.dart';

class KSlider extends StatefulWidget {
  var assetImage;
  // void Function(double value) onChanged;

  KSlider({super.key, this.assetImage = "assets/images/slider_icon.png"});

  @override
  State<KSlider> createState() => _KSliderState();
}

class _KSliderState extends State<KSlider> {
  ui.Image? customImage;

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
    load(widget.assetImage).then((image) {
      setState(() {
        customImage = image;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .95,
      alignment: Alignment.center,
      height: 50,
      child: Center(
        child: SliderTheme(
          data: SliderThemeData(
            activeTrackColor: Colors.grey.withOpacity(.3),
            inactiveTrackColor: Colors.grey.withOpacity(.3),
            thumbColor: Colors.green,
            // thumbShape: customImage != null
            //     ? SliderThumbImgage(image: customImage!)
            //     : RoundSliderThumbShape(),
            thumbShape: CircleThumbShape(thumbRadius: 20),
          ),
          child: Slider(
            value: rating,
            onChanged: (double value) {
              setState(() {
                rating = value;
              });
            },
            // onChanged: widget.onChanged,
            //   onChanged: (value) => // THIS IS DEFAULT PROPERTY!
            // setState(() {
            //   // this.indexTop = value.toInt();
            //   widget.onChanged.call(value.toInt()); // THIS IS YOUR CALLBACK!
            //   // widget.value = value.toInt();
            // }),
            min: 0,
            max: 5000,
            divisions: 2,
          ),
        ),
      ),
    );
  }
}

// class SliderThumbImgage extends SliderComponentShape {
//   final ui.Image image;
//   SliderThumbImgage({required this.image});
//   @override
//   Size getPreferredSize(bool isEnabled, bool isDiscrete) {
//     return const Size(0, 0);
//   }

//   @override
//   void paint(PaintingContext context, Offset center,
//       {required Animation<double> activationAnimation,
//       required Animation<double> enableAnimation,
//       required bool isDiscrete,
//       required TextPainter labelPainter,
//       required RenderBox parentBox,
//       required SliderThemeData sliderTheme,
//       required TextDirection textDirection,
//       required double value,
//       required double textScaleFactor,
//       required Size sizeWithOverflow}) {
//     var canvas = context.canvas;
//     Offset center = const Offset(15, 25);
//     var paint = Paint()..color = KColor.stickerColor;
//     canvas.drawCircle(center, 15, paint);

//     //  var canvas = context.canvas;
//     //   final picWidth = image.width;
//     //   final picHeight = image.height;

//     //   Offset picOffset = Offset(
//     //     (center.dx - (picWidth / 2)),
//     //     (center.dy - (picHeight / 2)),
//     //   );

//     //   Paint paint = Paint()..filterQuality = FilterQuality.high;
//     //   canvas.drawImage(image, picOffset, paint);
//   }
// }

class CircleThumbShape extends SliderComponentShape {
  final double thumbRadius;
  const CircleThumbShape({this.thumbRadius = 6.0});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    // TODO: implement getPreferredSize
    throw UnimplementedError();
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
    // TODO: implement paint

    final Canvas canvas = context.canvas;

    final fillPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color =Colors.green
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, thumbRadius, fillPaint);
    canvas.drawCircle(center, thumbRadius, borderPaint);
  }
}
