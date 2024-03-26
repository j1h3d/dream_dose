import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dream_dose/widgets/widgets.dart';
import 'package:dream_dose/Screens/screens.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const LoginBack(),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const HomeAppBar(),
                  SizedBox(
                    height: 270,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/images/Mountains.jpg',
                                ),
                              ),
                              const Positioned(
                                top: 155,
                                left: 15,
                                child: Text(
                                  '7 Nights to transform you bedtime \nfor better sleep',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const Positioned(
                                top: 220,
                                left: 22,
                                child: Text(
                                  '7 Sessions',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 183, 183, 183),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/images/Mountains.jpg',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/images/Mountains.jpg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                        );
                      } catch (error) {
                        print("Sign Out error $error");
                      }
                    },
                    child: Text('Logout'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
