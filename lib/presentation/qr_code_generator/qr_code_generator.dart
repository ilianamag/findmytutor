// mallon ayto gia na vgainei to qr

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart'; 
import 'package:login/widgets/custom_bottom_bar_teacher.dart';
import 'package:login/widgets/appbarfortutors.dart';

class QrCodeGenerator extends StatelessWidget {
  @override
  Widget build(BuildContext context) { //an theloume prosthetoume kai id 
        String name = 'name'; //tou tutor
        String lastname = 'last_name'; //tou tutor
        String email = 'email'; //prepei na to parw apo ti vasi
        String qrCodeData = generateQRCodeData(name, lastname, email);   
         return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppWidgets.buildAppBar2(context),
        drawer: AppWidgets.buildDrawer2(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: qrCodeData,
              version: QrVersions.auto,
              size: 200.0,
            ),
          ],
        ),     
      ),
      bottomNavigationBar: _buildBottomBar2(context),
      ),
    );
  }
   Widget _buildBottomBar2(BuildContext context) {
    return CustomBottomBar2(onChanged: (BottomBarEnum2 type) {
    });
  }
  String generateQRCodeData(String name, String lastname, String email) {
  return "\nName: $name \nLastName: $lastname \nEmail: $email";
}
}



/*import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;


class QrCodeGenerator extends StatefulWidget {
  const QrCodeGenerator({Key? key}) : super(key: key);

  @override
  State<QrCodeGenerator> createState() => _QrCodeGenerator();
}

class _QrCodeGenerator extends State<QrCodeGenerator> {
  final GlobalKey globalKey = GlobalKey();
  String qrData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code Generator"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            RepaintBoundary(
              key: globalKey,
              child: Container(
                color: Colors.white,
                child: Center(
                  child: qrData.isEmpty
                      ? Text(
                          "Enter data to generate",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : QrImageView(
                          data: qrData,
                          version: QrVersions.auto,
                          size: 200,
                        ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter data",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    qrData = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                saveQRCode();
              },
              child: Text('Save QR Code'),
            ),
          ],
        ),
      ),
    );
  }

 void saveQRCode() async {
  RenderRepaintBoundary boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  ui.Image image = await boundary.toImage();
  ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  Uint8List pngBytes = byteData!.buffer.asUint8List();

  final directory = await getExternalStorageDirectory();
  print('External Storage Directory: ${directory?.path}');
  final imagePath = path.join(directory!.path, 'QRCode.png');

  await File(imagePath).writeAsBytes(pngBytes);

  print('QR code image saved at: $imagePath');
}
}*/
