import 'package:carpool/constants.dart';
import 'package:flutter/material.dart';

class AddItemCard extends StatelessWidget {
  final String header;
  final String message;
  final String buttonText;
  final VoidCallback onPressed;

  const AddItemCard(
      {Key? key,
      required this.header,
      required this.message,
      required this.buttonText,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: BorderDirectional(
          top: BorderSide(color: kTextLightColor),
          bottom: BorderSide(color: kTextLightColor),
        ),
      ),
      child: Wrap(
        runSpacing: 10,
        children: [
          Text(
            header,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(message, style: const TextStyle(color: kTextLightColor),),
          InkWell(
            child: Text(buttonText, style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor),),
            onTap: (){},
          ),
        ],
      ),
    );
  }
}
