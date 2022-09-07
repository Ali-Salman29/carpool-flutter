import 'package:carpool/constants.dart';
import 'package:flutter/material.dart';

class RequestedRideCard extends StatelessWidget {
  final String message;
  final String toCity;
  final String fromCity;
  final String pickUp;
  final String dropOff;
  final String userName;
  final String userUrl;

  const RequestedRideCard({
    Key? key,
    required this.message,
    required this.userName,
    required this.pickUp,
    required this.dropOff,
    required this.toCity,
    required this.fromCity,
    required this.userUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Wrap(
        runSpacing: 7,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$toCity - $fromCity',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                '$pickUp - $dropOff',
                style: const TextStyle(fontSize: 12, color: kTextLightColor),
              ),
            ],
          ),
          Text(
            message,
            style: const TextStyle(fontSize: 14, color: kTextLightColor),
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
              style: const TextStyle(color: kTextLightColor, fontSize: 14),
            ),
            trailing: Wrap(
              spacing: 10,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(0, 0),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    shape: const StadiumBorder(),
                    backgroundColor: kErrorColor,
                  ),
                  onPressed: () {},
                  child: const Text("Reject"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(0, 0),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {},
                  child: const Text("Accept"),
                ),
              ],
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
