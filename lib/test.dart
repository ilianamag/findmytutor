import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoApp(),
    );
  }
}
class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: ()async{
               await FlutterShare.share(
                  title: 'Share Example',
                  text: 'This is the text you want to share.',
                  linkUrl: 'https://example.com',
                  chooserTitle: 'Share via', // Android only
                );
              },
              child: const Text("share")),
            ),
        ],
      ),
    );
  }
}