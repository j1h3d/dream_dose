import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dream_dose/widgets/widgets.dart';
import 'package:dream_dose/Screens/screens.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double spacing = screenWidth > 356 ? 20.0 : 10.0;
    return Stack(children: [
      const LoginBack(),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 40),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 38,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.3,
                  ),
                ),
              ),
              Image.asset(
                "assets/images/login.png",
                height: 210,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    buildTextField('Email', false, _emailTextController),
                    const SizedBox(height: 15),
                    buildTextField('Password', true, _passwordTextController),
                    Container(
                      padding: const EdgeInsets.only(top: 12, left: 210),
                      child: const Text(
                        'Forgot password ?',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 165, 165, 165),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 30),
                      child: Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {
                            try {
                              FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: _emailTextController.text,
                                      password: _passwordTextController.text)
                                  .then((value) {
                                print("User logged in!");

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ),
                                );
                              });
                            } catch (error) {
                              print('Error occured $error');
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                              if (states.contains(MaterialState.pressed)) {
                                return const Color.fromARGB(255, 90, 156, 76);
                              } else {
                                return const Color(0xFF6EBF5D);
                              }
                            }),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            minimumSize:
                                MaterialStateProperty.all(const Size(290, 55)),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 21),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15, left: 40),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Don't have an account ?",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 165, 165, 165),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Signup(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  " Sign Up",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF6EBF5D),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 20, right: 50),
                            child: const Text(
                              'Or connect with',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 165, 165, 165),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 28,
                              right: 28,
                              left: 28,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 15),
                                  child: Image.asset(
                                    "assets/images/facebook.png",
                                    height: 50,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 15),
                                  child: Image.asset(
                                    "assets/images/twitter.png",
                                    height: 50,
                                  ),
                                ),
                                Container(
                                  child: Image.asset(
                                    "assets/images/google.png",
                                    height: 50,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
