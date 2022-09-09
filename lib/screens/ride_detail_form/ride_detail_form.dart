import 'package:carpool/components/custom_search_delegate.dart';
import 'package:carpool/components/gradient_button.dart';
import 'package:carpool/custom_icons.dart';
import 'package:carpool/components/rider_appbar.dart';
import 'package:carpool/models/ride.dart';
import 'package:carpool/providers/rider.dart';
import 'package:carpool/services/ride_api_service.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import '../../providers/auth.dart';

class AddRideDetails extends StatefulWidget {
  const AddRideDetails({Key? key}) : super(key: key);
  static String routeName = "/add_ride_form";

  @override
  State<AddRideDetails> createState() => _AddRideDetailsState();
}

class _AddRideDetailsState extends State<AddRideDetails> {
  final formKey = GlobalKey<FormState>();

  String? _token;
  List<Car> cars = [];
  List<City> cities = [];
  bool _isLoading = false;

  Car? selectedCar;
  City? selectedToCity;
  City? selectedFromCity;

  TextEditingController numberOfSeats = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController toCity = TextEditingController();
  List<TextEditingController> pickups = [TextEditingController()];
  TextEditingController fromCity = TextEditingController();
  List<TextEditingController> dropOffs = [TextEditingController()];

  List<String> genders = ['Male', 'Female', 'Both'];
  String selectedGender = "Male";

  Future<void> onSubmit() async{
    if (formKey.currentState!.validate()) {
      final Ride ride = Ride(
        availableSeats: int.parse(numberOfSeats.text),
        bookedSeats: 0,
        gender: selectedGender.toUpperCase(),
        route: CityRoute(
            toCity: selectedToCity!, fromCity: selectedFromCity!, rate: 0),
        car: selectedCar!,
        date: DateTime.parse(date.text),
        pickupLocations: pickups.map((e) => e.text).toList(),
        dropOffLocations: dropOffs.map((e) => e.text).toList(),
      );
      setState(() {
        _isLoading = true;
      });
      await RideApiService(_token!).addARide(ride);
      Navigator.of(context).pop();
      setState(() {
        _isLoading = false;
      });
    }
  }

  void addPickup() {
    setState(() {
      pickups.add(TextEditingController());
    });
  }

  void removePickup(index) {
    if (index != 0){
      setState(() {
        pickups.removeAt(index);
      });
    }
  }

  void addDropOff() {
    setState(() {
      dropOffs.add(TextEditingController());
    });
  }

  void removeDropOff(index) {
    if (index != 0){
      setState(() {
        dropOffs.removeAt(index);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _token = Provider.of<Auth>(context, listen: false).userToken;
    cities = Provider.of<Rider>(context, listen: false).cities;
    cars = Provider.of<Rider>(context, listen: false).cars;
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
                  DropdownButtonFormField<Car>(
                    isExpanded: true,
                    icon: const Icon(Icons.arrow_drop_down_circle),
                    decoration: const InputDecoration(
                      hintText: "Select a Car",
                      icon: Icon(
                        CustomIcons.taxi,
                      ),
                    ),
                    value: selectedCar,
                    items: cars
                        .map((item) => DropdownMenuItem<Car>(
                              value: item,
                              child: Text(item.car),
                            ))
                        .toList(),
                    validator: (Car? item) {
                      if (item == null) {
                        return 'Please select a car';
                      }
                      return null;
                    },
                    onChanged: ((Car? item) {
                      setState(() {
                        selectedCar = item;
                      });
                    }),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "The value can't be empty";
                      } else if (int.tryParse(value) == null || int.parse(value) < 1){
                        return "The value should be a positive integer";
                      } else if (int.parse(value) > 7){
                        return "The value should be less than 7";
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
                    firstDate: DateTime.now().add(const Duration(hours: 5)),
                    lastDate: DateTime.now().add(const Duration(days: 3)),
                    use24HourFormat: false,
                    dateHintText: 'Date and Time',
                    locale: Localizations.localeOf(context),
                  ),
                  DropdownButtonFormField(
                    isExpanded: true,
                    icon: const Icon(Icons.arrow_drop_down_circle),
                    decoration: const InputDecoration(
                      hintText: "Select a Car",
                      icon: Icon(
                        CustomIcons.person,
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
                    controller: fromCity,
                    readOnly: true,
                    onTap: () async {
                      final data = await showSearch(
                          context: context,
                          delegate: CustomSearchDelegate(searchTerms: cities),
                          useRootNavigator: true);
                      if (data != null) {
                        fromCity.text = data.name;
                        selectedFromCity = data;
                      }
                    },
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
                    controller: toCity,
                    readOnly: true,
                    onTap: () async {
                      final data = await showSearch(
                          context: context,
                          delegate: CustomSearchDelegate(searchTerms: cities),
                          useRootNavigator: true);
                      if (data != null) {
                        toCity.text = data.name;
                        selectedToCity = data;
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: "To City",
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
                    isLoading: _isLoading,
                    onPressed: onSubmit,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
