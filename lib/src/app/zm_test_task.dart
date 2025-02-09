import 'package:flutter/material.dart';

class ZmTestTask extends StatelessWidget {
  const ZmTestTask({
    super.key,
    required this.home,
  });

  final Widget home;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home,
    );
  }
}
