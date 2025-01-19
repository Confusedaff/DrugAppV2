import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:camera/camera.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableContours: true,
      enableLandmarks: true,
    ),
  );
  List<Face> _faces = [];
  bool _isDetecting = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[0], ResolutionPreset.medium);

    await _cameraController.initialize();
    _cameraController.startImageStream((CameraImage image) async {
      if (!_isDetecting) {
        _isDetecting = true;
        await _processCameraImage(image);
        _isDetecting = false;
      }
    });
    setState(() {});
  }

  Future<void> _processCameraImage(CameraImage image) async {
    try {
      // Save the image to a temporary file
      final Directory tempDir = await getTemporaryDirectory();
      final String tempPath = '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
      final XFile file = await _cameraController.takePicture();

      // Pass the file path to InputImage
      final InputImage inputImage = InputImage.fromFilePath(file.path);

      // Detect faces
      final List<Face> faces = await _faceDetector.processImage(inputImage);

      // Update the state with detected faces
      setState(() {
        _faces = faces;
      });

      // Delete the temporary file
      await File(tempPath).delete();
    } catch (e) {
      debugPrint('Error processing image: $e');
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      //appBar: AppBar(
       // title: Center(
         // child: Text(
          //  'Scan',
           // style: TextStyle(fontWeight: FontWeight.bold,),
          //),
       // ),
      
      body: _cameraController.value.isInitialized
          ? Stack(
              children: [
                // Fullscreen camera preview
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height -
                      kToolbarHeight, // Exclude the AppBar height
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationZ(-270 * 3.1415927 / 180),
                    child: CameraPreview(_cameraController),
                  ),
                ),
                // Face detection bounding boxes
                ..._faces.map((face) {
                  final rect = face.boundingBox;

                  // Ensure accurate scaling
                  final previewSize = _cameraController.value.previewSize!;
                  final screenRatio = MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height - kToolbarHeight);
                  final previewRatio = previewSize.height / previewSize.width;

                  final scaleX = screenRatio > previewRatio
                      ? MediaQuery.of(context).size.width /
                          previewSize.height
                      : (MediaQuery.of(context).size.height - kToolbarHeight) /
                          previewSize.width;
                  final scaleY = scaleX;

                  return Positioned(
                    left: rect.left * scaleX,
                    top: rect.top * scaleY,
                    width: rect.width * scaleX,
                    height: rect.height * scaleY,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 3),
                      ),
                    ),
                  );
                }).toList(),
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
