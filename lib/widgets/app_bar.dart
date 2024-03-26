import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return FutureBuilder<DocumentSnapshot>(
      future:
          FirebaseFirestore.instance.collection('Users').doc(user?.uid).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting for the data to load, show a loading indicator
          return CircularProgressIndicator();
        }
        String name = snapshot.data!.get('name');

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset(
                    'assets/images/user.jpg',
                    height: 50,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 20),
                    child: const Text(
                      'Hello ,',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 160,
              ),
              Container(
                child: const Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: const Icon(
                  Icons.notifications,
                  size: 30,
                  color: Colors.white,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
