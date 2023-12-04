import 'package:flutter/material.dart';

class DeliveryMenPage extends StatelessWidget {
  const DeliveryMenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Men',style: TextStyle(backgroundColor: Colors.blue,fontSize: 35),)
      ),
      body: const Center(
        child: Text('This is the Delivery Men page',style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize:  25),),
      ),
    );
  }
}
