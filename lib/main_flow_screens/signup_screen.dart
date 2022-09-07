import 'package:carpool/components/gradient_button.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
            key: signUpkey,
            child: Form(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                        child: Image(image: AssetImage("lib/assets/car.png"))),
                    const Text(
                      "SignUp",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Wrap(
                      runSpacing: 20,
                      children: [
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
                          buttonText: "Sign UP",
                          onPressed: () {
                            validateSignupform();
                          },
                          isCircular: true,
                          margin: const EdgeInsets.symmetric(vertical: 20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(color: Colors.white54),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Sign in",
                                  style: TextStyle(color: Colors.green),
                                ))
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
