import 'package:connect_flutterfirebase/screens/register.dart';
import 'package:connect_flutterfirebase/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loader = false;

  login() async {
    try {
      setState(() {
        loader = true;
      });
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Home()));
      setState(() {
        loader = false;
      });
    } catch (e) {
      setState(() {
        loader = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context)
        .size
        .height; //getting screen height and width of device
    final width = MediaQuery.of(context).size.width;
    // print("rebuid");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Login",
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Container(
            width: width * 0.9, // Get the 90% of scReen width
            height: height * 0.85, //Get the 85% of screen height
            padding: EdgeInsets.all(width * 0.028),
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(width * 0.04),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                    child: Text("Login with Firebase",
                        style: TextStyle(fontSize: 20))),
                SizedBox(
                  height: height * 0.05,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      )),
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
                        // padding: EdgeInsets.symmetric(vertical: height * 0.02),
                        elevation: 10),
                    onPressed: () {
                      login();
                    },
                    child: const Text("Login")),
                SizedBox(
                  height: height * 0.03,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register()));
                  },
                  child: const Center(child: Text("Already have an account?")),
                ),
                Visibility(
                    visible: loader, child: const CircularProgressIndicator()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
