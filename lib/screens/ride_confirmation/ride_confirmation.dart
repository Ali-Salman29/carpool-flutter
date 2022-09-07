import 'package:flutter/material.dart';

class RideConfirmation extends StatelessWidget {
  const RideConfirmation({Key? key}) : super(key: key);
  static String routeName = "/ride_confirmation";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 200,
            ),
            const Center(
              child: Text(
                "Congratulations",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 100,
              width: 200,
              child: Center(
                child: Text(
                  "The Driver has received your request, He/She will contact you to confirm the ride. Before that you can also cancel the request ",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFFE8E8E8)),
                ),
              ),
            ),
            const SizedBox(
              height: 250,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF212121),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        side: const BorderSide(
                          width: 1.0,
                          color: Color(0xFF038643),
                        )),
                    onPressed: () {},
                    child: const Text(
                      "Back To Home",
                      style: TextStyle(color: Color(0xFF038643)),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF189D55),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        )),
                    onPressed: () {},
                    child: const Text("Check Updates"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
