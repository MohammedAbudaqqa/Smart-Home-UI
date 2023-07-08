import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DeviceTile extends StatelessWidget {
  void Function(bool) onChanged;
  String iconPath;
  String deviceName;
  bool deviceStatus;

  DeviceTile(
      {required this.onChanged,
      required this.iconPath,
      required this.deviceName,
      required this.deviceStatus});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 1,
              offset: const Offset(0, 1)),
        ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Container(
              height: double.infinity,
              width: 100,
              decoration: BoxDecoration(
                  color: deviceStatus ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image.asset(
                  iconPath,
                  color: deviceStatus ? Colors.white : Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Connected",
                    style: TextStyle(fontSize: 16, color: Colors.grey[400]),
                  ),
                  Text(
                    deviceName,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12)),
                        width: 80,
                        height: 30,
                        child: const Center(child: Text("Bedroom")),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12)),
                        width: 80,
                        height: 30,
                        child: const Center(child: Text("Bedroom")),
                      )
                    ],
                  ),
                ],
              ),
            ),
            CupertinoSwitch(
                activeColor: Colors.black,
                value: deviceStatus,
                onChanged: onChanged)
          ],
        ),
      ),
    );
  }
}
