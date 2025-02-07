import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Note: Dummy data is used for the name since there is no need
            // to implement Firestore or a database for storing additional user data.
            // This task focuses on biometric authentication.
            // The same applies to localization for new content.
            const Text("User Name: Mostafa"),
            Text("User Email: ${FirebaseAuth.instance.currentUser!.email}")
          ],
        ),
      ),
    );
  }
}
