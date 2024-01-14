import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
home: QRcode(),
);
}
}

class QRcode extends StatefulWidget {
@override
_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<QRcode> {
final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
late QRViewController controller;

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('QR Code Scanner'),
),
body: Column(
children: <Widget>[
Expanded(
flex: 4,
child: QRView(
key: qrKey,
onQRViewCreated: _onQRViewCreated,
overlay: QrScannerOverlayShape(
borderColor: Colors.red,
borderRadius: 10,
borderLength: 30,
borderWidth: 10,
cutOutSize: 300,
),
),
),
Expanded(
flex: 1,
child: Center(
child: Text('Scan QR Code within the frame'),
),
),
],
),
);
}

void _onQRViewCreated(QRViewController controller) {
this.controller = controller;
controller.scannedDataStream.listen((scanData) {
// Handle the scanned data (e.g., navigate to a new screen with the data)
print('Scanned data: $scanData');
});
}

@override
void dispose() {
controller.dispose();
super.dispose();
}
}