import 'package:connect_flutterfirebase/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  registerUser() async {
    try {
      // Create a new user with email and password
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Registration",
            style: TextStyle(
                // fontWeight: FontWeight.bold,
                // fontSize: 20,
                // color: Colors.redAccent,
                // fontStyle: FontStyle.italic
                ),
          ),
          // backgroundColor: const Color.fromARGB(255, 245, 197, 52),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          child: Container(
            width: width * 0.9,
            height: 500, // Fixed height for Register screen
            padding: EdgeInsets.all(width * 0.028),
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(width * 0.04),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                    child: Text("Firebase Registration",
                        style: TextStyle(fontSize: 20))),
                SizedBox(
                  height: height * 0.05,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0))),
                ),
                SizedBox(height: height * 0.03),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.06),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amberAccent,
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(40)),
                        elevation: 10),
                    onPressed: () {
                      registerUser();
                    },
                    child: const Text("Register")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
