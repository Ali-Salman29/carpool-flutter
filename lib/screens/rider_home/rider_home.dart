import 'package:carpool/components/custom_drawer.dart';
import 'package:carpool/screens/rider_home/components/rider_appbar.dart';
import 'package:carpool/screens/rider_home/components/rider_navigation_bar.dart';
import 'package:carpool/screens/rider_ride/rider_ride.dart';
import 'package:carpool/screens/CarHome/carslist.dart';
import 'components/historycard.dart';
import 'package:flutter/material.dart';

class RiderHome extends StatefulWidget {
  static String routeName = "/rider_home";

  const RiderHome({Key? key}) : super(key: key);

  @override
  State<RiderHome> createState() => _RiderHomeState();
}

class _RiderHomeState extends State<RiderHome> {
  int _selectedIndex = 0;
  final List<String> _menuItems = ['Rides', 'Cars', 'History'];
  final List<Widget> _widgetOptions = <Widget>[
    const RiderRide(),
   const CarsList(),
    HistoryCard(ridenumber:"200923", route: "Lahore to Islamabad", carname: "Mehran", dateTime:"10-09-2022")
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),
        appBar: RiderAppBar(
          title: _menuItems[_selectedIndex],
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: RiderBottomNavigationBar(
          currentItem: _selectedIndex,
          onItemTapped: _onItemTapped,
        ));
  }
}
