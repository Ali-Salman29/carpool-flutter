import 'package:carpool/constants.dart';
import 'package:carpool/custom_icons.dart';
import 'package:flutter/material.dart';

class RideCard extends StatelessWidget {
  final String toCity;
  final String fromCity;
  final List<String> pickups;
  final List<String> dropOffs;
  final String date;
  final String car;
  final int peopleLeft;
  final String riderName;
  final String riderImageUrl;
  final double riderRating;
  final VoidCallback onRequestRide;

  const RideCard(
      {Key? key,
      required this.toCity,
      required this.fromCity,
      required this.pickups,
      required this.dropOffs,
      required this.date,
      required this.car,
      required this.peopleLeft,
      required this.riderName,
      required this.riderImageUrl,
      required this.riderRating,
      required this.onRequestRide})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Wrap(
        runSpacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildBadge('Seats: $peopleLeft'),
              buildBadge(car),
              buildBadge(date),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
<<<<<<< Updated upstream
                    Wrap(
                      spacing: 5,
                      children: [
                        const Icon(
                          CustomIcons.radio_button_on,
                          color: kSelectedItemColor,
                        ),
                        Text(
                          fromCity,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
=======
                    Text(
                      fromCity,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
>>>>>>> Stashed changes
                    ),
                    ...pickups.map((e) => buildLocation(e, CustomIcons.radio_button_on)).toList(),
                    const SizedBox(
                      height: 10,
                    ),
<<<<<<< Updated upstream
                    Wrap(
                      spacing: 5,
                      children: [
                        const Icon(
                          CustomIcons.radio_button_on,
                          color: kSelectedItemColor,
                        ),
                        Text(
                          toCity,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
=======
                    Text(
                      toCity,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
>>>>>>> Stashed changes
                    ),
                    ...dropOffs.map((e) => buildLocation(e, CustomIcons.radio_button_on)).toList(),
                  ],
                ),
              ),
            ],
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 18,
              backgroundColor: kTextColor,
              child: CircleAvatar(
                radius: 17,
                backgroundImage: NetworkImage(riderImageUrl),
              ),
            ),
            title: Text(riderName, style: const TextStyle(color: kTextLightColor, fontSize: 16),),
            subtitle: Text('$riderRating'),
            trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
              ),
              child: const Text('Request Ride', style: TextStyle(fontWeight: FontWeight.w600),),
              onPressed: onRequestRide,
            ),
            contentPadding: EdgeInsets.zero,
            horizontalTitleGap: 10,
            dense:true,
            tileColor: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget buildLocation(String location, IconData iconData) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, bottom: 8.0),
      child: Row(
        children: [
          Icon(iconData, size: 16.0),
          SizedBox(width: 8.0),
          Expanded(
            flex: 1,
            child: Text(
              location,
              style: TextStyle(
                fontSize: 14.0,
                letterSpacing: 1.62,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBadge(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Colors.grey, width: 1)),
        color: const Color(0xFF54565D),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold),),
    );
  }
}
