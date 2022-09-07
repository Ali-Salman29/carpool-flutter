import 'package:carpool/providers/auth.dart';
import 'package:carpool/screens/rider_home/rider_home.dart';
import 'package:flutter/material.dart';
import 'package:carpool/components/gradient_button.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  static String routeName = "/signin";
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> signIn() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));
      final response = await Provider.of<Auth>(context, listen: false).signIn(
        username.text, password.text,
      );
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      if (response['status']){
        Navigator.of(context).pushNamed(RiderHome.routeName);
      } else if (response.containsKey('message')){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response['message']),
          backgroundColor: Colors.red.shade300,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text('hello'),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "SignIn ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Email or Phone ",
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.white24, width: 2)),
                          hintStyle: TextStyle(color: Colors.white38),
                        ),
                        keyboardType: TextInputType.text,
                        controller: username,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter some text";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Password ",
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.white24, width: 2)),
                          hintStyle: TextStyle(color: Colors.white38),
                        ),
                        keyboardType: TextInputType.text,
                        controller: password,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter some text";
                          }
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: (() {}),
                              child: const Text(
                                "Forget Password?",
                                style:
                                TextStyle(color: Colors.white38, fontSize: 15),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GradientButton(
                          buttonText: 'SIGN IN',
                          onPressed: signIn,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}