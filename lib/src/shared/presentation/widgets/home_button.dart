import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zm_test_task/src/features/features.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        padding: WidgetStatePropertyAll(
          EdgeInsets.all(
            10,
          ),
        ),
        shape: WidgetStatePropertyAll(
          CircleBorder(),
        ),
        backgroundColor: WidgetStatePropertyAll(
          Colors.white,
        ),
        elevation: WidgetStatePropertyAll(0),
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const MainScreen(),
          ),
        );
      },
      child: SvgPicture.asset('assets/icons/home.svg'),
    );
  }
}
