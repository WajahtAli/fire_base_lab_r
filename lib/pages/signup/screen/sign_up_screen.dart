import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_lab_r/pages/home/screen/home_screen.dart';
import 'package:firebase_lab_r/pages/login/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'SignUp',
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                  hintText: 'Eneter your email',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: password,
              obscureText: isObscure,
              decoration: InputDecoration(
                  hintText: 'Enter your password',
                  suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      child: isObscure == true
                          ? const Icon(Icons.remove_red_eye)
                          : const Icon(Icons.remove_red_eye_outlined)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: email.text.trim(),
                          password: password.text.trim())
                      .then((value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen())));
                },
                child: const Text('Sign Up')),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account'),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
