import 'package:carpool/models/ride.dart';
import 'package:carpool/providers/app_settings.dart';
import 'package:carpool/providers/rider.dart';
import 'package:carpool/services/ride_api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth.dart';
import '/components/gradient_button.dart';

class AddCarDetails extends StatefulWidget {
  const AddCarDetails({Key? key}) : super(key: key);
  static String routeName = "/add_car_details";

  @override
  State<AddCarDetails> createState() => _AddCarDetailsState();
}

class _AddCarDetailsState extends State<AddCarDetails> {
  String? _token;
  bool _isLoading = false;

  TextEditingController carModel = TextEditingController();
  TextEditingController registeredYear = TextEditingController();
  TextEditingController seatingCapacity = TextEditingController();
  TextEditingController registrationNo = TextEditingController();
  TextEditingController color = TextEditingController();

  final carKey = GlobalKey<FormState>();

  Future<void> onSubmit() async {
    if (carKey.currentState!.validate()) {
      final Car car = Car(
          car: carModel.text,
          makeYear: int.parse(registeredYear.text),
          color: color.text,
          seatingCapacity: int.parse(seatingCapacity.text),
          registrationNumber: registrationNo.text,
      );
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Rider>(context, listen: false).addACar(car);
      Provider.of<AppSettings>(context, listen: false).setPageNo(1);
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _token = Provider.of<Auth>(context, listen: false).userToken;
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
                  keyboardType: TextInputType.number,
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
                    hintText: "Registration ID",
                  ),
                  controller: registrationNo,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Seating Capacity",
                  ),
                  controller: seatingCapacity,
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
                  onPressed: onSubmit,
                  isLoading: _isLoading,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
