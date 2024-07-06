import 'package:flutter/material.dart';
import '../alphabet/alphabet_page.dart';
import '../colors/color_page.dart';
import '../bottom_bar/curvedNav.dart';
import '../expression/expression_page.dart';
import 'greeting_page.dart';
import 'numbers_page.dart';

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
        fixedSize: const Size(180, 40),
        backgroundColor: Colors.white,
        minimumSize: const Size(90, 50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 19,
        ),
      ),
    );
  }
}

class LearnBasics extends StatefulWidget {
  const LearnBasics({super.key});

  @override
  State<LearnBasics> createState() => _LearnBasicsState();
}

class _LearnBasicsState extends State<LearnBasics> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(213, 178, 211, 231),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(230, 255, 255, 255),
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
                MaterialPageRoute(builder: (context) => CurveBar()),
              );
            },
          ),
        ),
        body: Column(
          children: [
            const Spacer(
              flex: 4,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 200,
              ),
            ),
            const Text(
              'Learn Basics',
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 29,
              ),
            ),
            const Spacer(
              flex: 6,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
            ),
            CustomElevatedButton(
              buttonText: 'Alphabets',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AlphabetPage()),
                );
              },
            ),
            const Spacer(
              flex: 4,
            ),
            CustomElevatedButton(
              buttonText: 'Numbers',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NumbersPage()),
                );
              },
            ),
            const Spacer(
              flex: 4,
            ),
            CustomElevatedButton(
              buttonText: 'Colors',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ColorPage()),
                );
              },
            ),
            const Spacer(
              flex: 4,
            ),
            CustomElevatedButton(
              buttonText: 'Expression',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExpressionPage()),
                );
              },
            ),
            const Spacer(
              flex: 4,
            ),
            CustomElevatedButton(
              buttonText: 'Greetings',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GreetingPage()),
                );
              },
            ),
            const Spacer(
              flex: 20,
            ),
          ],
        ),
      ),
    );
  }
}
