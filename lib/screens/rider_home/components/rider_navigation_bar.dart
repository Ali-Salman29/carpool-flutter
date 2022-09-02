import 'package:carpool/constants.dart';
import 'package:carpool/custom_icons.dart';
import 'package:flutter/material.dart';

class RiderBottomNavigationBar extends StatelessWidget {
  final int currentItem;
  final Function onItemTapped;

  const RiderBottomNavigationBar(
      {Key? key, required this.currentItem, required this.onItemTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(25), topLeft: Radius.circular(25)),
        border: Border.all(color: Colors.black, width: 0.4),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -5),
            blurRadius: 22,
            color: Colors.black.withOpacity(0.16),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(25), topLeft: Radius.circular(25)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 5,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.steering_wheel),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CustomIcons.car,
              ),
              label: 'Cars',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CustomIcons.history_1,
              ),
              label: 'Account',
            ),
          ],
          currentIndex: currentItem,
          backgroundColor: kBackgroundColor,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).iconTheme.color,
          onTap: (index) => onItemTapped(index),
        ),
      ),
    );
  }
}
