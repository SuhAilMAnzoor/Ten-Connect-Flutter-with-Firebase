import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const Text("Welcome to Home Page"),
        const SizedBox(height: 50),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red
          ),
          onPressed: () async{
            FirebaseAuth.instance.signOut();
            Navigator.pop(context);
          },
          child: const Text("Sign Out",)
        ),
          ],
        ),
      )
    );
  }
}