import 'package:flutter/material.dart';
import 'package:shopping_app/homePage.dart';
import 'package:shopping_app/widgets/customButton.dart';
import 'package:shopping_app/widgets/customFormFeild.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
        title: const Text('Sprints Shopping App'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 32, horizontal: 18), // Adding padding around the column.
        child: SingleChildScrollView(
          // Enables scrolling to prevent keyboard from overlay above widgets.
          child: Form(
            key: formKey, // Assigning the global key to the form.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing:
                  40, // Spacing between fields instead of sized box after every widget.
              children: [
                // Custom field for the full name.
                CustomFormFeild(
                  title: "Full Name", // Title for the field.
                  hint: "Please Enter Your Full-Name", // Placeholder hint text.
                  controller: fullNameC,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    // Validation logic for full name field.
                    if (fullNameC.text.isEmpty) {
                      return "Full Name Field Shouldn't be empty.";
                    }
                    if (fullNameC.text[0] != fullNameC.text[0].toUpperCase()) {
                      return "Full Name Should Start with UpperCase Letter.";
                    }
                  },
                ),
                // Custom field for email address.
                CustomFormFeild(
                  title: "Email Address", // Title for the field.
                  hint:
                      "Please Enter Your Email-Address", // Placeholder hint text.
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
                    title: "Password",
                    hint: "Please Enter Your password",
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
                          p1Obscure ? Icons.visibility_off : Icons.visibility,
                          color: Colors.blue,
                        ))),
                // Custom field for confirming password input.
                CustomFormFeild(
                    title: "Password Confirm",
                    hint: "Please Re-Enter Your password",
                    controller: rePasswordC,
                    isObscured: p2Obscure, // Toggles password visibility.
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      // Validation logic for confirming password field.
                      if (rePasswordC.text.isEmpty) {
                        return "Password Confirm Field Shouldn't be empty.";
                      }

                      if (rePasswordC.text != passwordC.text) {
                        return "Password and Confirm Password Are Not the Same.";
                      }
                    },
                    suffixIcon: IconButton(
                        onPressed: () {
                          // Toggles visibility of confirm password field.
                          p2Obscure = !p2Obscure;
                          setState(() {});
                        },
                        icon: Icon(
                          p2Obscure ? Icons.visibility_off : Icons.visibility,
                          color: Colors.blue,
                        ))),

                // Custom button for submitting the form.
                CustomButton(
                  buttonTitle: "SignUp", // Title of the button.
                  onPressed: () {
                    if (formKey.currentState!
                        .validate()) // Validates form fields.
                    {
                      _showDialog(
                          context); // Displays success dialog if success.
                    } else {
                      // Displays error snackbar if validation fails.
                      SnackBar s = SnackBar(
                          content: Text(
                        "Invalid Data Entered",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white, fontSize: 18),
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(s);
                    }
                  },
                  buttonColor: Colors.blue,
                  textStyle: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Function to display dialog after successful sign-up.
_showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(
          "Account created successfully",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20),
        ),
        actions: [
          TextButton(
              onPressed: () {
                // Navigates to the HomePage and clears navigation stack.
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                  (route) => false,
                );
              },
              child: Text(
                "Close",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.blue, fontSize: 20),
              ))
        ],
      );
    },
  );
}
