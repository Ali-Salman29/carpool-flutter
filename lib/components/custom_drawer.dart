import 'package:carpool/constants.dart';
import 'package:carpool/custom_icons.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
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
                          Icon(CustomIcons.burger_list_menu_navigation_svgrepo_com)
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
            ListTile(
                leading: const Icon(
                  CustomIcons.home_svgrepo_com,
                ),
                title: const Text(
                  "Share A Ride",
                ),
                onTap: () {}),
            ListTile(
                leading: const Icon(
                  CustomIcons.history_svgrepo_com__1_,
                ),
                title: const Text(
                  "Your Rides",
                ),
                onTap: () {}),
            ListTile(
                leading: const Icon(
                  CustomIcons.settings_svgrepo_com,
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
