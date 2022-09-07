import 'package:carpool/screens/ride_detail_form/ride_detail_form.dart';
import 'package:carpool/screens/rider_home/rider_home.dart';
import 'screens/Car-detail-form/add_car_details.dart';
import 'screens/car_home/carslist.dart';
import 'package:flutter/material.dart';
import 'theme.dart';
import 'routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carpool',
      theme: theme(),
      initialRoute: RiderHome.routeName,
      routes: routes,
      supportedLocales: const [Locale('en', 'US')],
    );
  }
}
