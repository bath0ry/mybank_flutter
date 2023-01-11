import 'package:alubank_flutter/theme/app_theme.dart';
import 'package:alubank_flutter/theme/theme_colors.dart';

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: kElevationToShadow[4],
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(18)),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: ThemeColors.headerGradientColors)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 80, 16, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(TextSpan(text: '\$', children: [
                  TextSpan(
                      text: '100,00',
                      style: Theme.of(context).textTheme.bodyLarge)
                ])),
                Text(
                  'Saldo Disponivel',
                ),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.account_circle,
                  size: 35,
                ))
          ],
        ),
      ),
    );
  }
}
