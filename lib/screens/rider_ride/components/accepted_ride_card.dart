import 'package:carpool/custom_icons.dart';

import 'package:flutter/material.dart';

import '../../../constants.dart';

class AcceptedRideCard extends StatelessWidget {
  final String fromCity;
  final String toCity;
  final String pickUp;
  final String dropOff;
  final String userName;
  final String userUrl;
  final VoidCallback onWhatsAppClick;

  const AcceptedRideCard(
      {Key? key,
      required this.fromCity,
      required this.toCity,
      required this.pickUp,
      required this.dropOff,
      required this.userName,
      required this.userUrl,
      required this.onWhatsAppClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        border: BorderDirectional(
          top: BorderSide(color: kTextLightColor),
          bottom: BorderSide(color: kTextLightColor),
        ),
      ),
      child: Wrap(
        runSpacing: 7,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              "$fromCity - $toCity",
              style: const TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              "$pickUp - $dropOff",
              style: const TextStyle(color: kTextLightColor),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 18,
              backgroundColor: kTextColor,
              child: CircleAvatar(
                radius: 17,
                backgroundImage: NetworkImage(userUrl),
              ),
            ),
            title: Text(
              userName,
              style: const TextStyle(color: kTextLightColor, fontSize: 16),
            ),
            trailing: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(0, 0),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(CustomIcons.whatsapp),
              label: const Text("WhatsApp"),
              onPressed: () {},
            ),
            contentPadding: EdgeInsets.zero,
            horizontalTitleGap: 10,
            dense: true,
          ),
        ],
      ),
    );
  }
}
