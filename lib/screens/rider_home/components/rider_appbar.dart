import 'package:carpool/constants.dart';
import 'package:carpool/custom_icons.dart';
import 'package:flutter/material.dart';

class RiderAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String? title;

  const RiderAppBar({Key? key, this.title}): preferredSize = const Size.fromHeight(80), super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? Text(
        title!,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: kTextColor, fontSize: 24),
      ): null,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0.0,
      automaticallyImplyLeading: true,
    );
  }
}
