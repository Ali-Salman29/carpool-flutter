import 'package:carpool/constants.dart';
import 'package:carpool/custom_icons.dart';
import 'package:carpool/providers/app_settings.dart';
import 'package:carpool/screens/rider_home/rider_home.dart';
import 'package:carpool/screens/search_ride/search_ride.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    bool isRiderMode = Provider.of<AppSettings>(context, listen: false).isRiderMode;
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
      child: Drawer(
        backgroundColor: kBackgroundColor,
        child: ListView(
          children: [
            SizedBox(
              height: 200,
              child: DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color(0xFF434343),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CircleAvatar(
                            child: Text('A'),
                            radius: 30,
                          ),
                          Icon(CustomIcons.menu)
                        ],
                      ),
                      const Text(
                        'Jamie Dunn',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'salman@gmail.com',
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  )),
            ),
            if(!isRiderMode)
            ...[ListTile(
                leading: const Icon(
                  CustomIcons.home,
                ),
                title: const Text(
                  "Share a Ride",
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(RiderHome.routeName);
                  Provider.of<AppSettings>(context, listen: false).switchRiderMode();
                }),
            ListTile(
                leading: const Icon(
                  CustomIcons.history,
                ),
                title: const Text(
                  "Your Rides",
                ),
                onTap: () {}),
            ],
            if (isRiderMode)
              ...[
                ListTile(
                    leading: const Icon(
                      CustomIcons.search,
                    ),
                    title: const Text(
                      "Search a Ride",
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(SearchRide.routeName);
                      Provider.of<AppSettings>(context, listen: false).switchRiderMode();
                    }),
              ],
            ListTile(
                leading: const Icon(
                  CustomIcons.settings,
                ),
                title: const Text(
                  "Account Settings",
                ),
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}
