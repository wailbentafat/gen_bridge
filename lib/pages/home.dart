import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: const Color.fromARGB(255, 139, 207, 122),
      title: const Text(
        'GEN B',
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.account_circle,size: 8,color: Colors.white24,),
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: const Center(
        child: Text(
          'Welcome to GEN B',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
