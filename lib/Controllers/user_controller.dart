import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String name;
  final String surname;
  final String password;
  late String role;

  User({
    required this.email,
    required this.name,
    required this.surname,
    required this.password,
  });

  Future<void> registerUser(User user, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );
      await storeDetails(userCredential.user!.uid, user);
    } catch (error) {
      print('Error registering user $error');

      print('Error - $error');
    }
  }

  Future<void> storeDetails(String userId, User user) async {
    try {
      await FirebaseFirestore.instance.collection('Users').doc(userId).set({
        'email': user.email,
        'name': user.name,
        'surname': user.surname,
      });
    } catch (e) {
      print('Error storing user details: $e');
    }
  }

  Future<void> updateRole(String role) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .update({
          'role': role,
        });
        await user.reload();
      } catch (e) {
        print('Error adding the role: $e');
      }
    } else {
      print('No user signed in!');
    }
  }
}
