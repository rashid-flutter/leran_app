// ignore_for_file: non_constant_identifier_names

import 'package:final_project/learn_app/pages/learn_basics.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final String photoPath;

  const CustomElevatedButton({
    super.key,
    required this.buttonText,
    required this.photoPath,
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
        fixedSize: const Size(170, 50),
        backgroundColor: Colors.white60,
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
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}

class ExpressionPage extends StatefulWidget {
  @override
  State<ExpressionPage> createState() => _ExpressionPageState();
}

class _ExpressionPageState extends State<ExpressionPage> {
  final List<Map<String, dynamic>> expressions = [
    {'text': 'Happy', 'photoPath': 'assets/expression/happy.gif'},
    {'text': 'Angry', 'photoPath': 'assets/expression/angry.gif'},
    {'text': 'Bored', 'photoPath': 'assets/expression/bored.gif'},
    {'text': 'Sad', 'photoPath': 'assets/expression/sad.gif'},
    {'text': 'Excited', 'photoPath': 'assets/expression/excited.gif'},
    {'text': 'Nervous', 'photoPath': 'assets/expression/nervous.gif'},
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Expressions',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 29,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                itemCount: expressions.length,
                itemBuilder: (context, index) {
                  final expression = expressions[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomElevatedButton(
                          buttonText: expression['text'],
                          photoPath: expression['photoPath'],
                        ),
                      ],
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
