import 'package:flutter/material.dart';
import 'package:model_viewer/model_viewer.dart';

class viewbody extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<viewbody> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Model Viewer")),
        body: ModelViewer(
          src: 'assets/TEST.glb',
          alt: "A 3D model of an astronaut",
          ar: true,
          autoRotate: true,
          cameraControls: true,
        ),
      ),
    );
  }
}
