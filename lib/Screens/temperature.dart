// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/device_info_small_card.dart';
import '../widgets/device_info_state.dart';

class Temperature extends StatelessWidget {
  const Temperature({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                "Temperature",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Living Room",
                style: TextStyle(color: Colors.grey[400], fontSize: 16),
              ),
            ],
          ),
        ),
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
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(
            children: [
              DeviceInfo(aboutDevice: "Temperature"),
              const SizedBox(
                width: 20,
              ),
              DeviceInfo(aboutDevice: "Statistics"),
            ],
          ),
          Container(
            width: 400,
            height: 350,
            child: CustomPaint(
              painter: OpenPainter2(),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "14" "\u2103",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400]),
                      ),
                      const Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: ' 22 ',
                              style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                                text: '\u2103',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Text(
                        "14" "\u2103",
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Current Temp",
                    style: TextStyle(color: Colors.grey[500], fontSize: 16),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.arrow_drop_up,
                        color: Colors.black,
                      ),
                      Text(
                        "24" "\u2103",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Current Humidily",
                    style: TextStyle(color: Colors.grey[500], fontSize: 16),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_drop_down_outlined,
                        color: Colors.grey[400],
                      ),
                      const Text(
                        '54 %',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Row(children: [
            device_info_small_card(
              temperature: '22',
              title: "Heating",
            ),
            const Spacer(),
            device_info_small_card(
              temperature: '18',
              title: "Cooling",
            ),
            const Spacer(),
            device_info_small_card(
              temperature: '20',
              title: "Airwave",
            ),
          ]),
        ]),
      )),
    );
  }
}

/////////////////////////////////////////////////////////////////
///paint
class OpenPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var Circle = Paint()..color = Color.fromARGB(255, 247, 245, 245);

    var dashBrush = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;
    canvas.drawCircle(center, radius - 70, Circle);

    var outerCircleRadius = radius - 30;
    var innerCircleRadius = radius - 20;
    for (double i = 192; i < 355; i += 12) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x2, y2), Offset(x1, y1), dashBrush);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
