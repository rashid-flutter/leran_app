import 'package:final_project/learn_app/pages/camera_page.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final String output;

  const ResultPage({Key? key, required this.output}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Container(
                width: 426,
                height: 250,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(176, 255, 255, 255),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Sentence',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Divider(
                        height: 0,
                        thickness: 1,
                        color: Color(0x59757575),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        widget.output,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CameraPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 40),
                backgroundColor: Colors.white,
                elevation: 0.8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Another Sentence',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
