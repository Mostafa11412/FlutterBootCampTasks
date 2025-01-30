// ignore_for_file: body_might_complete_normally_nullable, use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/view/authentication/signUp.dart';
import 'package:shopping_app/fireBase_Services/fireBaseServices.dart';
import 'package:shopping_app/view/homePage.dart';
import 'package:shopping_app/widgets/customButton.dart';
import 'package:shopping_app/widgets/customFormFeild.dart';
import 'package:shopping_app/widgets/languageTriggerButton.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Controllers for text fields in the form.
  late TextEditingController emailAdressC;
  late TextEditingController fullNameC;
  late TextEditingController passwordC;
  late TextEditingController rePasswordC;

  // Bool variables to toggle password visibility.
  bool p1Obscure = true;
  bool p2Obscure = true;

  // A global key for validating the form.
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    // Initializing the text controllers.
    emailAdressC = TextEditingController();
    fullNameC = TextEditingController();
    passwordC = TextEditingController();
    rePasswordC = TextEditingController();
  }

  @override
  void dispose() {
    // close text controllers to stop controller from listening to text feild after leaving sign up page.
    super.dispose();
    emailAdressC.dispose();
    fullNameC.dispose();
    passwordC.dispose();
    rePasswordC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(tr("AppBarTitle")),
          actions: const [LanguageTriggerButton()],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 32,
              horizontal: 18), // Adding padding around the column.
          child: SingleChildScrollView(
            // Enables scrolling to prevent keyboard from overlay above widgets.
            child: Form(
              key: formKey, // Assigning the global key to the form.
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing:
                      30, // Spacing between fields instead of sized box after every widget.
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    // Custom field for email address.
                    CustomFormFeild(
                      title: tr("email"), // Title for the field.
                      hint: tr("EnterEmail"), // Placeholder hint text.
                      controller: emailAdressC,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        // Validation logic for email field.
                        if (emailAdressC.text.isEmpty) {
                          return "Email Address Field Shouldn't be empty.";
                        }
                        if (!emailAdressC.text.contains('@')) {
                          return "Email Address Should Contain @.";
                        }
                      },
                    ),
                    // Custom field for password input.
                    CustomFormFeild(
                        title: tr("Pasword"),
                        hint: tr("EnterPasword"),
                        controller: passwordC,
                        isObscured: p1Obscure, // Toggles password visibility.
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          // Validation logic for password field.
                          if (passwordC.text.isEmpty) {
                            return "Password Field Shouldn't be empty.";
                          }
                          if (passwordC.text.length < 6) {
                            return "Password Should Be 6 Characters at Least.";
                          }
                        },
                        suffixIcon: IconButton(
                            onPressed: () {
                              // Toggles visibility of password field.
                              p1Obscure = !p1Obscure;
                              setState(() {});
                            },
                            icon: Icon(
                              p1Obscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.blue,
                            ))),

                    // Custom button for submitting the form.
                    CustomButton(
                      buttonTitle: tr("SignIn"), // Title of the button.
                      onPressed: () async {
                        if (formKey.currentState!
                            .validate()) // Validates form fields.
                        {
                          String response = await FirebaseServices.signIn(
                              emailAdressC.text, passwordC.text, context);
                          if (response == "Success") {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                              (route) => false,
                            );
                          }
                        }
                      },
                      buttonColor: Colors.blue,
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ),
                        (route) => false,
                      ),
                      child: Text.rich(
                        TextSpan(
                            text: tr("Dont Have Account"),
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black),
                            children: [
                              TextSpan(
                                  text: tr("SignUp"),
                                  style: TextStyle(color: Colors.blue[900]))
                            ]),
                      ),
                    )
                  ]),
            ),
          ),
        ));
  }
}
