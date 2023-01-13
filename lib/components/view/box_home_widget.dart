import 'package:flutter/material.dart';

class BoxHome extends StatelessWidget {
  final Widget boxComponent; //passando por parametro
  const BoxHome({super.key, required this.boxComponent});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          boxShadow: kElevationToShadow[4],
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).cardColor),
      padding: const EdgeInsets.all(16),
      child: boxComponent,
    );
  }
}

//criando esse widget para passar pra home componentizado, para poder criar varios widget iguais com o mesmo componente