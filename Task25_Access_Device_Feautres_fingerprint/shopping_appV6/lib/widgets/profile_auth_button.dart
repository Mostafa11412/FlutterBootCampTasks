// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shopping_app/view/profile_screen.dart';

class ProfileAuthButton extends StatelessWidget {
  const ProfileAuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    final LocalAuthentication localAuth = LocalAuthentication();

    // Function to authenticate user before navigating
    Future<void> authenticateAndNavigate() async {
      bool canCheckBiometrics = await localAuth.canCheckBiometrics;
      bool isDeviceSupported = await localAuth.isDeviceSupported();

      if (!canCheckBiometrics || !isDeviceSupported) {
        print("Biometric authentication not available on this device.");
        return;
      }

      bool isAuthenticated = false;
      try {
        isAuthenticated = await localAuth.authenticate(
          localizedReason: "Scan your fingerprint to access your profile",
          options: const AuthenticationOptions(
            biometricOnly: true,
            stickyAuth: true,
          ),
        );
      } catch (e) {
        print("Error during authentication: $e");
      }

      if (isAuthenticated) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
      }
    }

    return IconButton(
        onPressed: () {
          authenticateAndNavigate();
        },
        icon: const Icon(
          Icons.person,
          size: 30,
        ));
  }
}
