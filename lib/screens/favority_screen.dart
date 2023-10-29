import 'package:flutter/material.dart';

class FavorityPage extends StatefulWidget {
  const FavorityPage({super.key});

  @override
  State<FavorityPage> createState() => _FavorityPageState();
}

class _FavorityPageState extends State<FavorityPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("FavorityPage"),
      ),
    );
  }
}
