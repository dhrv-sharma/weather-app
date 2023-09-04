import 'package:flutter/material.dart';

class loacation extends StatefulWidget {
  const loacation({super.key});

  @override
  State<loacation> createState() => _loacationState();
}

class _loacationState extends State<loacation> {
  @override // actual build is done from this side 
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Text("This is location activity"),
    );
  }
}
