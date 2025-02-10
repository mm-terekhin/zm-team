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
                  // CustomPaint(
                  //   size: Size(double.infinity, 400),
                  //   painter: DownloadPainter(),
                  // ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 50,
                    ),
                    padding: const EdgeInsets.all(
                      12,
                    ),
                    decoration: const BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(10, (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: _currentDot >= index
                                ? Colors.blueAccent
                                : Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
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
