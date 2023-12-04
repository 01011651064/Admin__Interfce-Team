import 'package:flutter/material.dart';

class EditMenuPage extends StatelessWidget {
  const EditMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Menu',style: TextStyle(backgroundColor: Colors.blue,fontSize: 35),),
      ),
      body: const Center(
        child: Text('This is the Edit Menu page',style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize:  25 ),),
      ),
    );
  }
}
