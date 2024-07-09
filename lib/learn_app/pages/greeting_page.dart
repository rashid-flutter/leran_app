import 'package:edukids/learn_app/pages/learn_basics.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final String photoPath;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.photoPath,
  }) : super(key: key);

  void _showImageAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
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
        fixedSize: const Size(200, 50),
        backgroundColor: Colors.white60,
        minimumSize: const Size(90, 50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
      ),
      onPressed: () {
        _showImageAlertDialog(context);
      },
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}

class GreetingPage extends StatelessWidget {
  final List<Map<String, dynamic>> greetings = [
    {'text': 'Hello', 'photoPath': 'assets/greeting/hello.gif'},
    {'text': 'Good Bye', 'photoPath': 'assets/greeting/goodbye.gif'},
    {'text': 'Good Morning', 'photoPath': 'assets/greeting/morning.gif'},
    {'text': 'Good Afternoon', 'photoPath': 'assets/greeting/after.gif'},
    {'text': 'Good Night', 'photoPath': 'assets/greeting/night.gif'},
    {'text': 'See You Later', 'photoPath': 'assets/greeting/seeyoulater.gif'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(213, 178, 211, 231),
      appBar: AppBar(
        title: const Text('Sign Language Translator'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
          ),
          const Text(
            'Greetings',
            style: TextStyle(
              color: Colors.white,
              fontSize: 29,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              itemCount: greetings.length,
              itemBuilder: (context, index) {
                final greeting = greetings[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomElevatedButton(
                        text: greeting['text'],
                        photoPath: greeting['photoPath'],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
