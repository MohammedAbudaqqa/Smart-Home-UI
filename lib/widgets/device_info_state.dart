// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeviceInfo extends StatefulWidget {
  String aboutDevice;

  DeviceInfo({
    super.key,
    required this.aboutDevice,
  });

  @override
  State<DeviceInfo> createState() => _DeviceInfoState();
}

class _DeviceInfoState extends State<DeviceInfo> {
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
        height: 65,
        width: MediaQuery.of(context).size.width / 2.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: isTapped ? Colors.black : Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lightbulb_outline_rounded,
              color: isTapped ? Colors.white : Colors.black,
            ),
            Text(
              widget.aboutDevice,
              style: TextStyle(
                color: isTapped ? Colors.white : Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
