import 'package:carpool/components/rider_appbar.dart';
import 'package:carpool/models/ride.dart';
import 'package:carpool/providers/auth.dart';
import 'package:carpool/providers/user_ride.dart';
import 'package:carpool/screens/rides/components/ride_card.dart';
import 'package:carpool/services/ride_api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Rides extends StatefulWidget {
  static String routeName = "/rides";

  const Rides({Key? key}) : super(key: key);

  @override
  State<Rides> createState() => _RidesState();
}

class _RidesState extends State<Rides> {
  late ScrollController _controller;
  bool _isLoading = true;
  List<Ride> _rides = [];

  void _firstLoad() async {
    final token = Provider.of<Auth>(context, listen: false).userToken;
    final RideArguments rideArguments= Provider.of<UserRide>(context, listen: false).rideArguments!;
    final response = await RideApiService(token).rides(rideArguments.date, rideArguments.fromCity, rideArguments.toCity);
    if (response['success']) {
      List<dynamic> jsonRides = response['response']['results'];
      setState(() {
        _rides = jsonRides
            .map((e) => Ride.fromMap(e as Map<String, dynamic>))
            .toList();
        _isLoading = false;
      });
    }
  }

  void _loadMore() async {
    if (_controller.position.atEdge && !(_controller.position.pixels == 0))
      print('hello');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RiderAppBar(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              controller: _controller,
              itemCount: _rides.length,
              itemBuilder: (context, index) => RideCard(
                toCity: _rides[index].route.toCity,
                fromCity: _rides[index].route.fromCity,
                pickups: _rides[index].pickupLocations,
                dropOffs: _rides[index].dropOffLocations,
                date: DateFormat.yMMMd()
                    .add_jm()
                    .format(_rides[index].date)
                    .toString(),
                car: _rides[index].car.car,
                peopleLeft: _rides[index].availableSeats,
                riderName: 'Jemie Dunn',
                riderImageUrl: 'https://i.ibb.co/Yj1Xs2k/Usama.jpg',
                riderRating: 3.4,
                onRequestRide: () {},
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
            ),
    );
  }
}
