import 'package:blaze_cafe/utils/context_ext.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  late CameraController _controller;
  late List<CameraDescription> _descriptions;
  var error = '';
  var _inited = false;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> init() async {
    try {
      var cameraPermission = await Permission.camera.status;
      if (cameraPermission == PermissionStatus.permanentlyDenied) {
        error = 'No camera permission';
        _inited = true;

        return false;
      }
      if (cameraPermission == PermissionStatus.denied) {
        cameraPermission = await Permission.camera.request();
        if (cameraPermission == PermissionStatus.permanentlyDenied) {
          error = 'No camera permission';
          _inited = true;
          return false;
        }
      }

      var microPermission = await Permission.microphone.status;
      if (microPermission == PermissionStatus.permanentlyDenied) {
        error = 'No microphone permission';
        _inited = true;

        return false;
      }
      if (microPermission == PermissionStatus.denied) {
        microPermission = await Permission.microphone.request();
        if (microPermission == PermissionStatus.permanentlyDenied) {
          error = 'No microphone permission';
          _inited = true;

          return false;
        }
      }

      _descriptions = await availableCameras();

      if (_descriptions.isEmpty) {
        _inited = true;

        return false;
      }

      _controller = CameraController(
        _descriptions[0],
        ResolutionPreset.max,
      );
      await _controller.initialize();
      _inited = true;

      return true;
    } catch (e) {
      _inited = true;

      return false;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR'),
        centerTitle: true,
        backgroundColor: context.theme.primaryColor,
      ),
      body: FutureBuilder(
        future: _inited ? null : init(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child:
                  CircularProgressIndicator(color: context.theme.primaryColor),
            );
          }
          if (snapshot.data ?? false) {
            return SizedBox.expand(child: CameraPreview(_controller));
          }

          return Center(
            child: Text(
              error.isEmpty ? 'Camera is not available' : error,
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
