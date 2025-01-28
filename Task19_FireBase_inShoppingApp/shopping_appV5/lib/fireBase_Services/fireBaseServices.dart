// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseServices {
  //two functions to handle sign in and sign up using firebase authentication.
  static Future<String> signUp(
      String email, String password, BuildContext contex) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        ScaffoldMessenger.of(contex).showSnackBar(
            const SnackBar(content: Text("Registered Succefully")));
        return "Success";
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(contex)
          .showSnackBar(SnackBar(content: Text(e.message ?? "Error")));
    } catch (e) {
      ScaffoldMessenger.of(contex)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
    return "";
  }

  static Future<String> signIn(
      String email, String password, BuildContext contex) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        ScaffoldMessenger.of(contex)
            .showSnackBar(const SnackBar(content: Text("Welcome Back")));
        return "Success";
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(contex)
          .showSnackBar(SnackBar(content: Text(e.message ?? "Error")));
    } catch (e) {
      ScaffoldMessenger.of(contex)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
    return "";
  }
}
