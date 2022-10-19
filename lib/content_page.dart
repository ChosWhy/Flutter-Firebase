import 'package:flutter/material.dart';

class ContentPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text("Content Page",style: TextStyle(color: Colors.white,fontSize: 20),)),
      ),
    );
  }
}
