// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'learn_basics.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(70, 60),
        backgroundColor: const Color.fromARGB(178, 255, 255, 255),
        padding: const EdgeInsets.symmetric(horizontal: 0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: const TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1),
          fontSize: 30,
        ),
      ),
    );
  }
}

class NumbersPage extends StatefulWidget {
  const NumbersPage({super.key});

  @override
  State<NumbersPage> createState() => _NumbersPageState();
}

class _NumbersPageState extends State<NumbersPage> {
  final Map<String, String> numberPaths = {
    '1': 'assets/numbers/1.png',
    '2': 'assets/numbers/2.png',
    '3': 'assets/numbers/3.png',
    '4': 'assets/numbers/4.png',
    '5': 'assets/numbers/5.png',
    '6': 'assets/numbers/6.png',
    '7': 'assets/numbers/7.png',
    '8': 'assets/numbers/8.png',
    '9': 'assets/numbers/9.png',
    '10': 'assets/numbers/10.gif',
  };

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
                'Numbers',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 29,
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 40,
                crossAxisSpacing: 20,
                padding: const EdgeInsets.all(60),
                children: numberPaths.entries.map((entry) {
                  return CustomElevatedButton(
                    buttonText: entry.key,
                    onPressed: () {
                      _showImageAlertDialog(
                        context: context,
                        title: entry.key,
                        photoPath: entry.value,
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
