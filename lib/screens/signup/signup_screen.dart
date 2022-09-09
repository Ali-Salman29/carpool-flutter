import 'package:carpool/components/gradient_button.dart';
import 'package:carpool/constants.dart';
import 'package:carpool/screens/signin/singin.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  static String routeName = "/signup";

  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  final signUpkey = GlobalKey<FormState>();

  void validateSignupform() {
    if (signUpkey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: signUpkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.3,
                  child: const Center(
                      child: Image(image: AssetImage("assets/app_icon.png"))
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Wrap(
                    runSpacing: 10,
                    children: [
                      const Text(
                        "SignUp",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "Username",
                        ),
                        controller: username,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "Email",
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: email,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "Phone",
                        ),
                        keyboardType: TextInputType.phone,
                        controller: phone,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "Password",
                        ),
                        obscureText: true,
                        controller: password,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "Confirm Password",
                        ),
                        obscureText: true,
                        controller: confirmPassword,
                      ),
                      GradientButton(
                        buttonText: "SIGN UP",
                        onPressed: validateSignupform,
                        isCircular: true,
                        margin: const EdgeInsets.symmetric(vertical: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(color: kTextLightColor),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(SignIn.routeName);
                            },
                            child: Text(
                              "Sign in",
                              style: TextStyle(color: Theme.of(context).primaryColor),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
