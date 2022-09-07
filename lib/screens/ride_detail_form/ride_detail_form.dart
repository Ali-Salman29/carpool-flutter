import 'package:carpool/components/gradient_button.dart';
import 'package:carpool/custom_icons.dart';
import 'package:carpool/custom_icons.dart';
import 'package:carpool/screens/rider_home/components/rider_appbar.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

class AddRideDetails extends StatefulWidget {
  const AddRideDetails({Key? key}) : super(key: key);
  static String routeName = "/add_ride_form";

  @override State<AddRideDetails> createState() => _AddRideDetailsState();
}

class _AddRideDetailsState extends State<AddRideDetails> {
  final formKey = GlobalKey<FormState>();

  List<String> cars = <String>['City', 'Civic', 'sonata', 'Mercedes S class'];
  String selectedCar = "City";

  TextEditingController numberOfSeats = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController to = TextEditingController();
  List<TextEditingController> pickups = [TextEditingController()];
  TextEditingController from = TextEditingController();
  List<TextEditingController> dropOffs = [TextEditingController()];

  List<String> genders = ['Male', 'Female', 'Both'];
  String selectedGender = "Male";

  void addPickup() {
    setState(() {
      pickups.add(TextEditingController());
    });
  }

  void removePickup(index) {
    setState(() {
      pickups.removeAt(index);
    });
  }

  void addDropOff() {
    setState(() {
      dropOffs.add(TextEditingController());
    });
  }

  void removeDropOff(index) {
    setState(() {
      dropOffs.removeAt(index);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RiderAppBar(),
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                runSpacing: 5,
                children: [
                  const Text(
                    "Ride Details",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  DropdownButtonFormField(
                    isExpanded: true,
                    icon: const Icon(Icons.arrow_drop_down_circle),
                    decoration: const InputDecoration(
                      hintText: "Select a Car",
                      icon: Icon(
                        CustomIcons.car,
                      ),
                    ),
                    value: selectedCar,
                    items: cars
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            ))
                        .toList(),
                    onChanged: ((String? val) {
                      setState(() {
                        selectedCar = val!;
                      });
                    }),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter some text";
                      }
                      return null;
                    },
                    controller: numberOfSeats,
                    decoration: const InputDecoration(
                      hintText: "Number of seats available",
                      icon: Icon(
                        Icons.airline_seat_recline_normal,
                      ),
                    ),
                  ),
                  DateTimePicker(
                    icon: const Icon(Icons.date_range),
                    type: DateTimePickerType.dateTime,
                    dateMask: 'd MMMM, yyyy - hh:mm a',
                    controller: date,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    use24HourFormat: false,
                    dateHintText: 'Date and Time',
                    locale: Localizations.localeOf(context),
                  ),
                  DropdownButtonFormField(
                    isExpanded: true,
                    icon: const Icon(
                      CustomIcons.person_svgrepo_com__1_,
                    ),
                    decoration: const InputDecoration(
                      hintText: "Select a Car",
                      icon: Icon(
                        Icons.person,
                      ),
                    ),
                    value: selectedGender,
                    items: genders
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            ))
                        .toList(),
                    onChanged: ((String? val) {
                      setState(() {
                        selectedGender = val!;
                      });
                    }),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter some text";
                      }
                      return null;
                    },
                    controller: to,
                    decoration: const InputDecoration(
                      hintText: "To",
                      icon: Icon(Icons.radio_button_checked_rounded),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 40,
                    ),
                    child: Wrap(
                      runSpacing: 5,
                      children: [
                        ...pickups
                            .asMap()
                            .entries
                            .map(
                              (entry) => TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter some text";
                                  }
                                  return null;
                                },
                                controller: entry.value,
                                decoration: InputDecoration(
                                    hintText:
                                        "Pickup Location ${entry.key + 1}",
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.cancel),
                                      onPressed: () => removePickup(entry.key),
                                    )),
                              ),
                            )
                            .toList(),
                        TextButton(
                          onPressed: addPickup,
                          child: const Text('Add a pickup'),
                        )
                      ],
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter some text";
                      }
                      return null;
                    },
                    controller: from,
                    decoration: const InputDecoration(
                      hintText: "From",
                      icon: Icon(Icons.radio_button_checked_rounded),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 40,
                    ),
                    child: Wrap(
                      runSpacing: 5,
                      children: [
                        ...dropOffs
                            .asMap()
                            .entries
                            .map(
                              (entry) => TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter some text";
                                  }
                                  return null;
                                },
                                controller: entry.value,
                                decoration: InputDecoration(
                                    hintText:
                                        "Dropoff Location ${entry.key + 1}",
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.cancel),
                                      onPressed: () {
                                        removeDropOff(entry.key);
                                      },
                                    )),
                              ),
                            )
                            .toList(),
                        TextButton(
                          onPressed: addDropOff,
                          child: const Text('Add a dropoff'),
                        )
                      ],
                    ),
                  ),
                  GradientButton(
                    buttonText: 'Add a Ride',
                    isCircular: true,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    onPressed: () {},
                  )
                ],
              ),
            )),
      ),
    );
  }
}
