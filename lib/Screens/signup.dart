import 'package:dream_dose/Controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:dream_dose/widgets/widgets.dart';
import 'package:dream_dose/Screens/screens.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _surNameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  'Sign up',
                  style: TextStyle(
                    fontSize: 38,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.3,
                  ),
                ),
              ),
              Image.asset(
                "assets/images/signup.png",
                height: 210,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    buildTextField('Name', false, _nameTextController),
                    const SizedBox(height: 15),
                    buildTextField('Surname', false, _surNameTextController),
                    const SizedBox(height: 15),
                    buildTextField('Email', false, _emailTextController),
                    const SizedBox(height: 15),
                    buildTextField('Password', true, _passwordTextController),
                    Container(
                      padding: const EdgeInsets.only(top: 30),
                      child: Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () async {
                            String name = _nameTextController.text;
                            String surname = _surNameTextController.text;
                            String email = _emailTextController.text;
                            String password = _passwordTextController.text;

                            User user = User(
                              name: name,
                              surname: surname,
                              email: email,
                              password: password,
                            );
                            await user.registerUser(user, password);
                            Navigator.push(
                              (context),
                              MaterialPageRoute(builder: (context) => Roles()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              backgroundColor: const Color(0xFF6EBF5D),
                              minimumSize: const Size(290, 55)),
                          child: const Text(
                            'Create Account',
                            style: TextStyle(color: Colors.white, fontSize: 21),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20, left: 5),
                      child: Column(
                        children: [
                          const Text(
                            "You already have an account!",
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
                                  builder: (context) => const Login(),
                                ),
                              );
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF6EBF5D),
                              ),
                            ),
                          ),
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
