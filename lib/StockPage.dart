import 'package:flutter/material.dart';

class StockPage extends StatelessWidget {
  const StockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock',style: TextStyle(backgroundColor: Colors.green,fontSize: 40),),
      ),
      body: const Center(
        child: Text('This is the Stock page',style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize:  30),
      ),
    )
    );
  }
}
