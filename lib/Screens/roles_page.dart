import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_dose/Screens/screens.dart';
import 'package:dream_dose/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Roles extends StatefulWidget {
  const Roles({super.key});

  @override
  State<Roles> createState() => _RolesState();
}

class _RolesState extends State<Roles> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Stack(
      children: [
        const LoginBack(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 35),
                        child: Text(
                          'Dream',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 42,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        'Dose',
                        style: TextStyle(
                          color: Color(0xFF6EBF5D),
                          fontSize: 42,
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  'Are you a dreamer or a night owl !!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (user != null) {
                        try {
                          await FirebaseFirestore.instance
                              .collection('Users')
                              .doc(user.uid)
                              .update({
                            'role': 'Dreamer',
                          });
                          await user.reload();
                          Navigator.push(
                            (context),
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
                        } catch (e) {
                          print('Error adding the role: $e');
                        }
                      } else {
                        print('No user signed in!');
                      }
                    },
                    child: Container(
                      height: 200,
                      width: 160,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          colors: [
                            Color.fromARGB(255, 45, 45, 45),
                            Color.fromARGB(255, 56, 56, 56)
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 20, bottom: 10),
                            child: Text(
                              'Dreamer!',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15),
                            child: Icon(
                              Icons.nights_stay_rounded,
                              color: Colors.white,
                              size: 100,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (user != null) {
                        try {
                          await FirebaseFirestore.instance
                              .collection('Users')
                              .doc(user.uid)
                              .update({
                            'role': 'Owl',
                          });
                          await user.reload();
                          Navigator.push(
                            (context),
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
                        } catch (e) {
                          print('Error adding the role: $e');
                        }
                      } else {
                        print('No user signed in!');
                      }
                    },
                    child: Container(
                      height: 200,
                      width: 160,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          colors: [
                            Color.fromARGB(255, 45, 45, 45),
                            Color.fromARGB(255, 56, 56, 56)
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 20, bottom: 10),
                            child: Text(
                              'Night Owl!',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.desktop_mac_outlined,
                            color: Colors.white,
                            size: 100,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      (context),
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  child: Text("Home"),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
