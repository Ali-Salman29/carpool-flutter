import 'package:flutter/material.dart';
import '/components/gradient_button.dart';

class AddCarDetails extends StatefulWidget {
  const AddCarDetails({Key? key}) : super(key: key);

  @override
  State<AddCarDetails> createState() => _AddCarDetailsState();
}

class _AddCarDetailsState extends State<AddCarDetails> {
  TextEditingController carmodel = TextEditingController();
  TextEditingController registeredyear = TextEditingController();
  TextEditingController registeration = TextEditingController();
  TextEditingController numberplate = TextEditingController();
  TextEditingController color = TextEditingController();

  final carkey = GlobalKey<FormState>();

  void validateinputs() {
    if (carkey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Form(
        key: carkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                "Add a Car",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Car model",
                    ),
                    controller: carmodel,
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Registered Year",
                    ),
                    controller: registeredyear,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Registeration Number",
                      hintStyle: TextStyle(color: Colors.white38),
                    ),
                    controller: registeration,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Number Plate",
                    ),
                    controller: numberplate,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "color",
                      hintStyle: TextStyle(color: Colors.white38),
                    ),
                    controller: color,
                  ),
                  const SizedBox(
                    height: 150,
                  ),

                  GradientButton(
                      buttonText: "Add a Car",
                      onPressed: () {
                        validateinputs();
                      })
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
