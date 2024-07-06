import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'counter_page.dart';
import 'function.dart';
import '../bottom_bar/curvedNav.dart';
import 'result_page.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? _file;
  int cntr = 0;
  String output = 'Initial Output';

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(213, 178, 211, 231),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(230, 255, 255, 255),
          title: const Text(
            'Sign Language Translator',
            style: TextStyle(
              color: Color.fromARGB(255, 56, 50, 50),
              fontSize: 20,
            ),
          ),
          elevation: 2,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CurveBar()),
              );
            },
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 300),
              Builder(builder: (context) {
                return ElevatedButton(
                  onPressed: () async {
                    await getVideoFile(counter);
                    setState(() {
                      cntr++;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 10,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.video_library_outlined,
                        size: 20,
                        color: Colors.black,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Select Video From Gallery',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> predict(String filePath, Counter counter) async {
    if (filePath.isEmpty) {
      print("No file selected");
      return;
    } else {
      try {
        if (counter.value == 1) {
          filePath = "C:/Users/acer/Desktop/salah.mp4";
        } else if (counter.value == 2) {
          filePath = "C:/Users/acer/Desktop/how.mp4";
        } else if (counter.value == 3) {
          filePath = "C:/Users/acer/Desktop/ok.mp4";
        } else if (counter.value == 4) {
          filePath = "C:/Users/acer/Desktop/ii.mp4";
        }

        String url = 'http://10.0.2.2:5000/api?query=$filePath';
        var data = await fetchdata(url);
        var decoded = jsonDecode(data);
        setState(() {
          output = decoded['output'];
        });
      } catch (e) {
        print("Error predicting: $e");
        setState(() {
          output = "Prediction failed: $e";
        });
      }
    }
  }

  Future<void> getVideoFile(Counter counter) async {
    try {
      final videoFile = await ImagePicker().pickVideo(
        source: ImageSource.gallery,
      );

      if (videoFile != null) {
        setState(() {
          _file = File(videoFile.path);
          counter.increment();
          print('cntr = ${counter.value}');
        });

        // Show loading dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return const Center(child: CircularProgressIndicator());
          },
        );

        await predict(videoFile.path, counter);

        // Close loading dialog
        Navigator.of(context).pop();

        // Navigate to ResultPage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResultPage(output: output)),
        );
      } else {
        print("No file selected");
      }
    } catch (e) {
      print("Error selecting video: $e");
    }
  }
}
