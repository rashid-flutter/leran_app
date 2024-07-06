// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../pages/camera_page.dart';
import '../pages/features_page.dart';
import '../pages/learn_basics.dart';

class CurveBar extends StatefulWidget {
  const CurveBar({super.key});

  @override
  State<CurveBar> createState() => _CurveBarState();
}

class _CurveBarState extends State<CurveBar> {
  int index = 1;
  final List<Widget> _pages = const [
    CameraPage(),
    FeaturesPage(),
    LearnBasics(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = [
      const Icon(Icons.translate, size: 30),
      const Icon(Icons.home, size: 30),
      const Icon(Icons.menu_book_outlined, size: 30),
    ];
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: _pages[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(
            color: Colors.black87,
          ),
        ),
        child: CurvedNavigationBar(
          color: Colors.white,
          backgroundColor: Colors.transparent,
          items: items,
          height: 60,
          index: index,
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
    );
  }
}
