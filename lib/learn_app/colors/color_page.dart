// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import '../pages/learn_basics.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final String photoPath;
  final Color buttonColor;

  const CustomElevatedButton({
    super.key,
    required this.buttonText,
    required this.photoPath,
    required this.buttonColor,
  });

  void _showImageAlertDialog({
    required BuildContext context,
    required String title,
    required String photoPath,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(photoPath, height: 300, width: 300),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(180, 40),
        backgroundColor: buttonColor,
        minimumSize: const Size(90, 50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
      ),
      onPressed: () {
        _showImageAlertDialog(
          context: context,
          title: buttonText,
          photoPath: photoPath,
        );
      },
      child: Text(
        buttonText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}

class ColorPage extends StatefulWidget {
  const ColorPage({super.key});

  @override
  State<ColorPage> createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  final List<Map<String, dynamic>> colors = [
    {
      'text': 'Red',
      'photoPath': 'assets/color/red.gif',
      'color': const Color.fromARGB(172, 218, 77, 67)
    },
    {
      'text': 'Orange',
      'photoPath': 'assets/color/orange.gif',
      'color': const Color.fromARGB(255, 227, 158, 53)
    },
    {
      'text': 'Yellow',
      'photoPath': 'assets/color/yellow.gif',
      'color': const Color.fromARGB(180, 235, 219, 76)
    },
    {
      'text': 'Green',
      'photoPath': 'assets/color/green.gif',
      'color': const Color.fromARGB(194, 76, 175, 79)
    },
    {
      'text': 'Blue',
      'photoPath': 'assets/color/blue.gif',
      'color': const Color.fromARGB(201, 68, 150, 218)
    },
    {
      'text': 'Black',
      'photoPath': 'assets/color/black.gif',
      'color': Colors.black87
    },
    {
      'text': 'White',
      'photoPath': 'assets/color/white.gif',
      'color': Colors.white70
    },
  ];

  @override
  Widget build(BuildContext context) {
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
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LearnBasics()),
              );
            },
          ),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Colors',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 29,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                itemCount: colors.length,
                itemBuilder: (context, index) {
                  final color = colors[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomElevatedButton(
                      buttonText: color['text'],
                      photoPath: color['photoPath'],
                      buttonColor: color['color'],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
