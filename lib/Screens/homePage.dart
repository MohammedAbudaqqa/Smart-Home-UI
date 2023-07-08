import 'package:flutter/material.dart';

import '../widgets/smart_device_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List smartDevices = [
    ["Smart\nLight", "asset/icons/lamp.png", true],
    ["Smart\nAC", "asset/icons/air-conditioner.png", false],
    ["Smart\nTV", "asset/icons/smart-tv.png", false],
    ["Smart\nAC", "asset/icons/fan.png", false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: ImageIcon(
            AssetImage("asset/icons/more.png"),
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: CircleAvatar(
                radius: 20,
                child: ClipRRect(
                  child: Image.asset("asset/images/profile.png"),
                  borderRadius: BorderRadius.circular(32),
                )),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Welcome Home',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Garret Reynolds",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Spacer(),
                ImageIcon(
                  size: 100,
                  AssetImage("asset/icons/smart-home.png"),
                  color: Colors.black,
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              "Smart Devices",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1 / 1.3,
                ),
                itemCount: smartDevices.length,
                itemBuilder: (context, index) {
                  return SmartDeviceCard(
                    deviceName: smartDevices[index][0],
                    iconPath: smartDevices[index][1],
                    powerStat: smartDevices[index][2],
                    onChanged: (value) {
                      setState(() {
                        smartDevices[index][2] = value;
                      });
                    },
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
