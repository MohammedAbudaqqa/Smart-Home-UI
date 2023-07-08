// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, camel_case_types

import 'package:flutter/material.dart';

class device_info_small_card extends StatefulWidget {
  device_info_small_card({required this.title, required this.temperature});
  String title;
  String temperature;

  @override
  State<device_info_small_card> createState() => _device_info_small_cardState();
}

class _device_info_small_cardState extends State<device_info_small_card> {
  bool isTapped = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTapped = !isTapped;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.width / 3.7,
        width: MediaQuery.of(context).size.width / 3.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isTapped ? Colors.white : Colors.black,
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                widget.title,
                style: TextStyle(
                    color: isTapped ? Colors.black : Colors.white,
                    fontSize: 16),
              ),
              Spacer(),
              Text(
                widget.temperature + " \u2103",
                style: TextStyle(
                  color: isTapped ? Colors.black : Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
