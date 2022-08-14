import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SlidePuzzle extends StatefulWidget {
  const SlidePuzzle({Key? key}) : super(key: key);

  @override
  State<SlidePuzzle> createState() => _SlidePuzzleState();
}

class _SlidePuzzleState extends State<SlidePuzzle> {
  int valueSlider = 2;

  @override
  Widget build(BuildContext context) {
    double border = 5;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(actions: []),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: SafeArea(
            child: Column(
          children: [
            //kolme riviä, eka tekstille, toka puzzlelle, kolmas puzzlen sliderille
            Container(
              child: Text(
                "Slide puzzle ${valueSlider}x$valueSlider",
              ),
            ),
            Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 66, 63, 63),
                  border: Border.all(width: border, color: Colors.green),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      width: constraints.biggest.width,
                      height: constraints.biggest.width,

                      //puzzle widget
                      child: SlidePuzzleWidget(size: constraints.biggest),
                    );
                  },
                )),
            Container(
              child: Slider(
                  min: 2,
                  max: 15,
                  divisions: 13,
                  label: "${valueSlider.toString()}",
                  value: valueSlider.toDouble(),
                  onChanged: (value) {
                    setState(
                      () {
                        valueSlider = value.toInt();
                      },
                    );
                  }),
            )
          ],
        )),
      ),
    );
  }
}

class SlidePuzzleWidget extends StatefulWidget {
  Size size;
  double innerPadding;

  SlidePuzzleWidget({
    Key? key,
    required this.size,
    this.innerPadding = 5,
  }) : super(key: key);

  @override
  State<SlidePuzzleWidget> createState() => _SlidePuzzleWidgetState();
}

class _SlidePuzzleWidgetState extends State<SlidePuzzleWidget> {
  GlobalKey _globalKey = GlobalKey();
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = Size(widget.size.width - widget.innerPadding * 2,
        widget.size.width - widget.innerPadding);
    return Container(
      alignment: Alignment.center,
      child: Text("Widget"),
    );
  }

  _getImageFromWidget() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext.findRenderObject();
    size = boundary.size;
    var img = await boundary.toImage();
    var byteData = await img.toByteData(format: ImageByteFormat.png);
    var pngBytes = byteData.buffer.asUint8List();
  }
}

class SlideObject {
  Offset posDefault;
  Offset posCurrent;
  int indexDefault;
  int indexCurrent;
  bool empty;
  Size size;
  Image image;

  SlideObject({
    this.empty = false,
    required this.image,
    required this.indexCurrent,
    required this.indexDefault,
    required this.posCurrent,
    required this.posDefault,
    required this.size,
  });
}
