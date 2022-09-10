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
        runSpacing: 5,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    ),
                    ...pickups
                        .map((e) => Row(
                              children: [
                                const SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  'o $e',
                                  style: const TextStyle(
                                      fontSize: 14, color: kTextLightColor),
                                ),
                              ],
                            ))
                        .toList(),
                    const SizedBox(
                      height: 10,
                    ),
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
                    ),
                    ...dropOffs
                        .map((e) => Row(
                              children: [
                                const SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  'o $e',
                                  style: const TextStyle(
                                      fontSize: 14, color: kTextLightColor),
                                ),
                              ],
                            ))
                        .toList(),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFF54565D),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text(date, style: const TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Wrap(
                      spacing: 10,
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(car, style: const TextStyle(fontWeight: FontWeight.w600),),
                        const Icon(Icons.not_listed_location, size: 20,),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Wrap(
                      spacing: 10,
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text('$peopleLeft People Left', style: const TextStyle(fontWeight: FontWeight.w600),),
                        const Icon(CustomIcons.person, size: 20,),
                      ],
                    )
                  ],
                ),
              )
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
              child: const Text('Request Ride'),
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
}
