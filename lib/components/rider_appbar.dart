import 'package:carpool/constants.dart';
import 'package:carpool/custom_icons.dart';
import 'package:flutter/material.dart';

class RiderAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String? title;
  final bool canPop;

  const RiderAppBar({Key? key, this.title, this.canPop=true}): preferredSize = const Size.fromHeight(70), super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? Text(
        title!,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: kTextColor, fontSize: 24),
      ): null,
      leading:  IconButton(
        icon: Icon(
          canPop? Icons.arrow_back_ios_rounded: CustomIcons.menu,
        ),
        onPressed: () {
          if (canPop){
            Navigator.of(context).pop();
          } else {
            Scaffold.of(context).openDrawer();
          }
        },
      ),
      backgroundColor: kBackgroundColor,
      centerTitle: true,
      elevation: 0.0,
      automaticallyImplyLeading: false,
    );
  }
}
