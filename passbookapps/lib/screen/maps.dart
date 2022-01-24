import 'package:flutter/material.dart';

class maps extends StatefulWidget {
  @override
  _mapsState createState() => _mapsState();
}

class _mapsState extends State<maps> with SingleTickerProviderStateMixin {
  TransformationController? controller;
  AnimationController? animationController;

  Animation<Matrix4>? animation;
  final double minScale = 2;
  final double maxScale = 2;
  double scale = 1;
  OverlayEntry? entry;
  Curves? curves;

  @override
  void initState() {
    super.initState();

    controller = TransformationController();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    )
      ..addListener(() => controller!.value = animation!.value)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          removeOverlay();

          entry = OverlayEntry(
            builder: (context) {
              final renderBox = context.findRenderObject()! as RenderBox;
              final offset = renderBox.localToGlobal(Offset.zero);
              final size = MediaQuery.of(context).size;
              final opacity =
                  ((scale - 1) / (maxScale - 1)).clamp(scale - 1, maxScale - 1);
              return Stack(
                children: <Widget>[
                  Positioned.fill(
                      child: Opacity(
                          opacity: opacity,
                          child: Container(color: Colors.black))),
                  Positioned(
                      left: offset.dx,
                      top: offset.dy,
                      width: size.width,
                      child: buildImage())
                ],
              );
            },
          );
        }
      });
  }

  @override
  void dispose() {
    controller!.dispose();
    animationController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Maps",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: buildImage()
          // Container(
          //   child: InteractiveViewer(
          //       transformationController: controller,
          //       clipBehavior: Clip.none,
          //       panEnabled: false,
          //       minScale: minScale,
          //       maxScale: maxScale,
          //       onInteractionEnd: (details) {
          //         resetAnimation();
          //       },
          //       child: AspectRatio(
          //         aspectRatio: 1,
          //         child: ClipRRect(
          //             borderRadius: BorderRadius.circular(20),
          //             child: Image.asset(
          //                 'assets/images/260032222_311844533913555_3743807380163888560_n.png',
          //                 fit: BoxFit.cover)),
          //       )),
          // ),
        ),
      ),
    );
  }

  Widget buildImage() {
    return Builder(
      builder: (context) => InteractiveViewer(
          transformationController: controller,
          clipBehavior: Clip.none,
          panEnabled: false,
          minScale: minScale,
          maxScale: maxScale,
          onInteractionStart: (details) {
            if (details.pointerCount < 2) return;
            if (entry == null) {
              showOverlay(context);
            }
          },
          onInteractionUpdate: (details) {
            if (entry == null) return;
    
            this.scale = details.scale;
            entry!.markNeedsBuild();
          },
          onInteractionEnd: (details) {
            if (details.pointerCount != 1) return;
            resetAnimation();
          },
          child: //Container(),
          AspectRatio(
            aspectRatio: 0.65,
            child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                          'assets/images/123456789.png',
                          fit: BoxFit.fill)),
          )
          ),
    );
  }

  void showOverlay(BuildContext context) {
    final renderBox = context.findRenderObject()! as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = MediaQuery.of(context).size;
    entry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: offset.dx,
          top: offset.dy,
          width: size.width,
          child: buildImage(),
        );
      },
    );
    final overlay = Overlay.of(context)!;
    overlay.insert(entry!);
  }

  void removeOverlay() {
    entry?.remove();
    entry = null;
  }

  void resetAnimation() {
    animation = Matrix4Tween(
      begin: controller!.value,
      end: Matrix4.identity(),
    ).animate(
        CurvedAnimation(parent: animationController!, curve: Curves.easeOut));

    animationController!.forward(from: 0);
  }
}
