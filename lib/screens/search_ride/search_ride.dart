import 'package:carpool/components/custom_drawer.dart';
import 'package:carpool/components/gradient_button.dart';
import 'package:carpool/custom_icons.dart';
import 'package:carpool/screens/rides/rides.dart';
import 'package:carpool/components/custom_search_delegate.dart';
import 'package:carpool/services/ride_api_service.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import '../../providers/auth.dart';
import '../../models/ride.dart';
import '../../providers/user_ride.dart';

class SearchRide extends StatefulWidget {
  static String routeName = "/search_ride";

  const SearchRide({Key? key}) : super(key: key);

  @override
  State<SearchRide> createState() => _SearchRideState();
}

class _SearchRideState extends State<SearchRide> {
  late String _token;
  int? toCityID;
  int? fromCityID;
  List<City> toCities = [];
  List<City> fromCities = [];
  bool _isLoading = false;

  TextEditingController date =
      TextEditingController(text: DateTime.now().toString());
  TextEditingController toCity = TextEditingController();
  TextEditingController fromCity = TextEditingController();

  void onSearchRide() {
    Provider.of<UserRide>(context, listen: false).setRideArgument(toCityID, fromCityID, date.text);
    Navigator.of(context).pushNamed(Rides.routeName);
  }

  Future<void> getFromCities(String date) async {
    if (fromCities.isEmpty) {
      setState(() {
        _isLoading = true;
      });
      final response = await RideApiService(_token).fromCities(date);
      if (response['success']) {
        List<dynamic> jsonRides = response['response'];
        fromCities = jsonRides
            .map((e) => City.fromMap(e as Map<String, dynamic>))
            .toList();
        toCities = [];
      }
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> getToCities(String date, int fromCityID) async {
    if (toCities.isEmpty) {
      setState(() {
        _isLoading = true;
      });
      final response = await RideApiService(_token).toCities(date, fromCityID);
      if (response['success']) {
        List<dynamic> jsonRides = response['response'];
        toCities = jsonRides
            .map((e) => City.fromMap(e as Map<String, dynamic>))
            .toList();
      }
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _token = Provider.of<Auth>(context, listen: false).userToken!;
    getFromCities(DateTime.now().toString());
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/map.png',
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 40,
                      child: Builder(
                        builder: (context) => IconButton(
                          icon: const Icon(CustomIcons.menu),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Wrap(
                  runSpacing: 5,
                  children: [
                    DateTimePicker(
                        icon: const Icon(Icons.date_range),
                        type: DateTimePickerType.date,
                        dateMask: 'd MMMM, yyyy',
                        controller: date,
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2023),
                        use24HourFormat: false,
                        dateHintText: 'Date',
                        locale: Localizations.localeOf(context),
                        onChanged: (value) async {
                          fromCities = [];
                          await getFromCities(value);
                        }),
                    TextFormField(
                      controller: fromCity,
                      readOnly: true,
                      onTap: () async {
                        final data = await showSearch(
                            context: context,
                            delegate:
                                CustomSearchDelegate(searchTerms: fromCities),
                            useRootNavigator: true);
                        if (data != null && data.id !=null) {
                          fromCity.text = data.name;
                          fromCityID = data.id;
                          await getToCities(date.text, data.id!);
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "From City",
                        icon: Icon(
                          Icons.radio_button_on,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: toCity,
                      readOnly: true,
                      onTap: () async {
                        final data = await showSearch(
                            context: context,
                            delegate:
                                CustomSearchDelegate(searchTerms: toCities),
                            useRootNavigator: true);
                        if (data != null && data.id !=null) {
                          toCityID = data.id;
                          toCity.text = data.name;
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "To City",
                        icon: Icon(
                          Icons.radio_button_on,
                        ),
                      ),
                    ),
                    GradientButton(
                      buttonText: 'Find a Ride',
                      isCircular: true,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      onPressed: onSearchRide,
                    )
                  ],
                ),
              )
            ],
          ),
          if (_isLoading)
            Positioned(
                child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                    ),
                    child: Center(child: CircularProgressIndicator())))
        ],
      ),
    );
  }
}
