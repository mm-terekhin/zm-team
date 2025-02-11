import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import '../../../features/features.dart';
import '../../shared.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
    required this.dto,
  });

  final GetLinkResponseDto dto;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentDot = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (_currentDot < 10) {
        setState(() {
          _currentDot++;
        });
      } else {
        timer.cancel();
        _navigateToHome();
      }
    });
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => widget.dto.isEmpty
            ? const MainScreen()
            : WebViewScreen(
                uri: widget.dto.toUri,
              ),
      ),
    );
  }

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
          body: SafeArea(
            right: false,
            left: false,
            bottom: false,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 125,
                  ),
                  const Text(
                    'Splash',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 36,
                      fontFamily: 'MuseoModerno',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  CustomPaint(
                    size: const Size(double.infinity, 250), // Размер виджета
                    painter: LoadingPainter(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LoadingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, -20);

    path.conicTo(
      size.width * 0.1,
      0,
      size.width * 0.3,
      size.height * 0.05,
      1,
    );

    path.conicTo(
      size.width * 0.5,
      size.height * 0.1,
      size.width * 0.7,
      size.height * 0.1,
      1,
    );

    path.conicTo(
      size.width * 0.9,
      size.height * 0.1,
      size.width,
      size.height * 0.2,
      1,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
