import 'package:flutter/material.dart';

class SimpleCard extends StatelessWidget {
  final String title;
  final int seats;
  final String price;

  const SimpleCard(
      {Key? key, required this.title, required this.seats, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     
      child:
    Wrap(
      
      runSpacing: 20,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Wrap(
          spacing: 10,
          children: [
            Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              decoration: BoxDecoration(
                  color: const Color(0xFF707070),
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Text("seats left  :$seats"),
            ),
            
            Container(
             padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
              decoration: BoxDecoration(
                 color: const Color(0xFF707070),
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Text(price),
            ),
          ],
        )
      ],
    ) ,)
     ;
  }
}
