import 'package:flutter/material.dart';
import '../pages/learn_basics.dart';

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

class AlphabetPage extends StatefulWidget {
  const AlphabetPage({super.key});

  @override
  State<AlphabetPage> createState() => _AlphabetPageState();
}

class _AlphabetPageState extends State<AlphabetPage> {
  final Map<String, String> alphabetPaths = {
    'A': 'assets/alphabet/A.jpg',
    'B': 'assets/alphabet/B.jpg',
    'C': 'assets/alphabet/C.jpg',
    'D': 'assets/alphabet/D.jpg',
    'E': 'assets/alphabet/E.jpg',
    'F': 'assets/alphabet/F.jpg',
    'G': 'assets/alphabet/G.jpg',
    'H': 'assets/alphabet/H.jpg',
    'I': 'assets/alphabet/I.jpg',
    'J': 'assets/alphabet/J.gif',
    'K': 'assets/alphabet/K.jpg',
    'L': 'assets/alphabet/L.jpg',
    'M': 'assets/alphabet/M.jpg',
    'N': 'assets/alphabet/N.jpg',
    'O': 'assets/alphabet/O.jpg',
    'P': 'assets/alphabet/P.jpg',
    'Q': 'assets/alphabet/Q.jpg',
    'R': 'assets/alphabet/R.jpg',
    'S': 'assets/alphabet/S.jpg',
    'T': 'assets/alphabet/T.jpg',
    'U': 'assets/alphabet/U.jpg',
    'V': 'assets/alphabet/V.jpg',
    'W': 'assets/alphabet/W.jpg',
    'X': 'assets/alphabet/X.jpg',
    'Y': 'assets/alphabet/Y.jpg',
    'Z': 'assets/alphabet/Z.gif',
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
                'Alphabets',
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
                children: alphabetPaths.entries.map((entry) {
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
