// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceCard extends StatelessWidget {
  String iconPath;
  String deviceName;
  bool powerStat;
  void Function(bool) onChanged;
  SmartDeviceCard(
      {super.key,
      required this.deviceName,
      required this.iconPath,
      required this.powerStat,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 28, 16, 16),
      decoration: BoxDecoration(
        color: powerStat ? Colors.black : Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageIcon(
            size: 60,
            color: powerStat ? Colors.white : Colors.black,
            AssetImage(iconPath),
          ),
          const Spacer(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Row(
                children: [
                  Text(
                    deviceName,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: powerStat ? Colors.white : Colors.black),
                  ),
                  const Spacer(),
                  RotatedBox(
                    quarterTurns: -1,
                    child: CupertinoSwitch(
                        activeColor: Colors.white,
                        trackColor: Colors.grey[1200],
                        thumbColor: powerStat ? Colors.black : Colors.white,
                        value: powerStat,
                        onChanged: onChanged),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
