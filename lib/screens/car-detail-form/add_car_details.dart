import 'package:flutter/material.dart';
import '/components/gradient_button.dart';

class AddCarDetails extends StatefulWidget {
  const AddCarDetails({Key? key}) : super(key: key);
  static String routeName = "/add_car_details";

  @override
  State<AddCarDetails> createState() => _AddCarDetailsState();
}

class _AddCarDetailsState extends State<AddCarDetails> {
  TextEditingController carModel = TextEditingController();
  TextEditingController registeredYear = TextEditingController();
  TextEditingController registrationNo = TextEditingController();
  TextEditingController numberPlate = TextEditingController();
  TextEditingController color = TextEditingController();

  final carKey = GlobalKey<FormState>();

  void validateinputs() {
    if (carKey.currentState!.validate()) {
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
          key: carKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Wrap(
              runSpacing: 5,
              children: [
                const Text(
                  "Add a Car",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.start,
                ),
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
                  controller: carModel,
                ),
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
                  controller: registeredYear,
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
                  ),
                  controller: registrationNo,
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
                  controller: numberPlate,
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
                  ),
                  controller: color,
                ),
                GradientButton(
                  buttonText: 'Add a Car',
                  isCircular: true,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
