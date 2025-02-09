import 'package:flutter/material.dart';

import '../../../../shared/shared.dart';
import '../../info.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/bg_splash_img.png',
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const DefaultAppBat(),
          body: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(
                    3.14,
                  ),
                  child: Image.asset(
                    'assets/images/salmon_fish.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Salmon',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      'Anadromous fish, migrates from oceans  to rivers '
                      'to spawn. It reaches a length of up to 150 '
                      'cm and a weight of up to 40 kg.  It lives in '
                      'the northern seas and rivers.',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InfoBox(),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
