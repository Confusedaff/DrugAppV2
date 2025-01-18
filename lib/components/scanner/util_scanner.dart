////import 'dart:typed_data';

//import 'package:camera/camera.dart';
//import 'package:drugapp/main.dart';
//import 'package:flutter/foundation.dart';
//import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

//class UtilsScanner{
  //UtilsScanner._();

 // static Future<CameraDescription> getCamera(CameraLensDirection cameraLensDirection)async{
  //  return await availableCameras().then(
  //    (List<CameraDescription> cameras) => cameras.firstWhere(
  //      (CameraDescription CameraDescription)=> CameraDescription.lensDirection == cameraLensDirection)
  //  );
//  }
//}
  //static ImageRotation rotationIntToImageRotation(int rotation){
  //switch(rotation){
   // case 0:
   // return ImageRotation.rotation0;
    //return ImageRotation.rotation90;
   //  case 180:
   // return ImageRotation.rotation180;
    //default:
    //assert(rotation == 270);
   //// return ImageRotation.rotation270;
//  }
 //}

//static Uint8List concatenatePlanes(List<Plane> planes){

 // final WriteBuffer allBytes  = WriteBuffer();
 // for(Plane plane in planes){
 //   allBytes.putUint8List(plane.bytes);
 // }
 // return allBytes.done().buffer.asUint8List();
//}
  //static FirebaseVisionImageMetadata buildMetaData(CameraImage image,ImageRotation rotation){
  //  return FirebaseVisionImageMetadata(
   //   size:Size(image.width.toDouble(),image.height.toDouble()),
   //   rawFormat: image.format.raw,
   //   planeData:
   // )
  //}
//}