// import 'package:flutter/material.dart';
// import 'package:arcore_plugin/arcore_plugin.dart';
// import 'package:vector_math/vector_math_64.dart' as vector;



// class ARBody extends StatelessWidget {
//   ArCoreViewController? arCoreViewController; 
  

//   _onArCoreViewCreated(ArCoreViewController _arcoreViewController){
//     arCoreViewController=_arcoreViewController;
//     _addSphere(_arcoreViewController);
//   }

//   _addSphere(ArCoreViewController _arCoreViewController){
//     final material = ArCoreMaterial(color: Colors.deepOrange);
//     final sphere = ArCoreSphere(materials: [material], radius: 0.2);           
//     final node = ArCoreNode(
//           shape: sphere,
//           position: vector.Vector3(
//            0,
//            0,
//           -1,
//         ),            
//     );

//    _arcoreViewController.add(node);

//   } 
// @override
// void dispose() {
//  arCoreViewController.dispose();
//   super.dispose();
// }

// @override
// Widget build(BuildContext context){
//   return Scaffold(
//        body: ArCoreView(onArCoreViewCreated: _onArCoreViewCreated,),
//   );
// }
// }

