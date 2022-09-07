import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'components/card.dart';

class SelectRide extends StatefulWidget {
  static String routeName = "/select_ride";
  const SelectRide({Key? key}) : super(key: key);

  @override
  State<SelectRide> createState() => _SelectRideState();
}

class _SelectRideState extends State<SelectRide> {
  bool isVisible = false;
  void makeVisible() {
    setState(() {
      isVisible = true;
    });
  }

  void hide() {
    setState(() {
      isVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SimpleCard(
                  title: "Lahore to Islamabad", seats: 3, price: "600"),
              Wrap(
                runSpacing: 10,
                children: [
                  TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter some text";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          icon: const Icon(
                            Icons.radio_button_checked,
                            color: Colors.white24,
                          ),
                          label: const Text("Pickup"),
                          suffixIcon: IconButton(
                              onPressed: makeVisible,
                              icon: const Icon(Icons.arrow_drop_down)))),
                  Visibility(
                    visible: isVisible,
                    child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter some text";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            label: const Text("Pickup Location #2"),
                            suffixIcon: IconButton(
                                onPressed: hide,
                                icon: const Icon(Icons.cancel)))),
                  ),
                  TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter some text";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          icon: const Icon(
                            Icons.radio_button_checked,
                            color: Colors.white24,
                          ),
                          label: const Text("Dropoff"),
                          suffixIcon: IconButton(
                              onPressed: makeVisible,
                              icon: const Icon(Icons.arrow_drop_down)))),
                  Visibility(
                    visible: isVisible,
                    child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter some text";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            label: const Text("Dropoff Location #2"),
                            suffixIcon: IconButton(
                                onPressed: hide,
                                icon: const Icon(Icons.cancel)))),
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                    icon: Icon(
                      Icons.chat,
                      color: Colors.white24,
                    ),
                    label: Text("Any instructions to driver?"),
                  )),
                ],
              ),
              const SizedBox(
                height: 320,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF212121),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          side: const BorderSide(
                            width: 1.0,
                            color: Color(0xFF038643),
                          )),
                      onPressed: () {},
                      child: const Text(
                        "Back",
                        style: TextStyle(color: Color(0xFF038643)),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF189D55),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          )),
                      onPressed: () {
                        Navigator.pushNamed(context, 'ConfirmationScreen');
                      },
                      child: const Text("Request"))
                ],
              )
            ],
          ),
        )));
  }
}
