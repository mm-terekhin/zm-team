import 'package:flutter/material.dart';
import 'home_button.dart';

class DefaultAppBat extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBat({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: const Padding(
        padding: EdgeInsets.only(left: 16),
        child: HomeButton(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
