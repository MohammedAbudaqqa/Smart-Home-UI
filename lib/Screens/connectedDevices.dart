import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/device_tile.dart';

class Devices extends StatefulWidget {
  Devices({super.key});

  @override
  State<Devices> createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {
  List smartDevices = [
    ["Smart TV", "asset/icons/smart-tv.png", true],
    ["Smart AC", "asset/icons/air-conditioner.png", false],
    ["Smart Light", "asset/icons/lamp.png", false],
    ["Smart AC", "asset/icons/fan.png", false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
              color: Colors.black,
            ),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.all(16.0),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_rounded),
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Devices',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 36),
                      ),
                      Text(
                        'Connected',
                        style: TextStyle(fontSize: 20, color: Colors.grey[400]),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Text(
                    'On',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(32)),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: smartDevices.length,
                  itemBuilder: (context, index) {
                    return DeviceTile(
                      deviceStatus: smartDevices[index][2],
                      deviceName: smartDevices[index][0],
                      iconPath: smartDevices[index][1],
                      onChanged: (p0) {
                        setState(() {
                          smartDevices[index][2] = p0;
                        });
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
