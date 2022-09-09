import 'package:carpool/components/custom_drawer.dart';
import 'package:carpool/components/rider_appbar.dart';
import 'package:carpool/providers/app_settings.dart';
import 'package:carpool/providers/rider.dart';
import 'package:carpool/screens/cars/cars.dart';
import 'package:carpool/screens/rider_history/rider_history.dart';
import 'package:carpool/screens/rider_home/components/rider_navigation_bar.dart';
import 'package:carpool/screens/rider_ride/rider_ride.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class RiderHome extends StatefulWidget {
  static String routeName = "/rider_home";

  const RiderHome({Key? key}) : super(key: key);

  @override
  State<RiderHome> createState() => _RiderHomeState();
}

class _RiderHomeState extends State<RiderHome> {
  bool _isLoading = false;
  final List<String> _menuItems = ['Rides', 'Cars', 'History'];
  final List<Widget> _widgetOptions = <Widget>[
    const RiderRide(),
    const Cars(),
    const RiderHistory(),
  ];

  void _onItemTapped(int index) {
    Provider.of<AppSettings>(context, listen: false).setPageNo(index);
  }

  Future<void> loadRiderData() async {
    if (!Provider.of<Rider>(context, listen: false).isLoaded) {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Rider>(context, listen: false).getCars();
      await Provider.of<Rider>(context, listen: false).getCities();
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadRiderData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppSettings>(
      builder: (context, settings, chl) {
        return Scaffold(
            drawer: const CustomDrawer(),
            appBar: RiderAppBar(
              title: _menuItems[settings.pageNo],
              canPop: false,
            ),
            body: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : _widgetOptions.elementAt(settings.pageNo),
            bottomNavigationBar: RiderBottomNavigationBar(
              currentItem: settings.pageNo,
              onItemTapped: _onItemTapped,
            ));
      }
    );
  }
}
