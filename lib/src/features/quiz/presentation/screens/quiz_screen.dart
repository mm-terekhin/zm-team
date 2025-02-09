import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';

enum Fish {
  walleye,
  pike,
  salmon,
  tuna;

  String toText() {
    switch (this) {
      case Fish.walleye:
        return 'Walleye';
      case Fish.pike:
        return 'Pike';
      case Fish.salmon:
        return 'Salmon';
      case Fish.tuna:
        return 'Tuna';
    }
  }

  String imagePath() {
    switch (this) {
      case Fish.walleye:
        return 'assets/images/walleye_fish.png';
      case Fish.pike:
        return 'assets/images/pike_fish.png';
      case Fish.salmon:
        return 'assets/images/salmon_fish.png';
      case Fish.tuna:
        return 'assets/images/tuna_fish.png';
    }
  }
}

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

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
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Quiz',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 36,
                      fontFamily: 'MuseoModerno',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'What kind of fish migrates from the ocean to the rivers to spawn?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GridView(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                    ),
                    children: Fish.values
                        .map(
                          (fish) => _Card(
                            fish: fish,
                          ),
                        )
                        .toList(),
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

class _Card extends StatelessWidget {
  const _Card({
    required this.fish,
  });

  final Fish fish;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/bg_quiz_card.png'),
            ),
          ),
          child: Transform.translate(
            offset: const Offset(50, 0),
            child: Image.asset(
              fish.imagePath(),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          fish.toText(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}