import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BoxHome extends StatelessWidget {
  final Widget boxComponent; //passando por parametro
  const BoxHome({super.key, required this.boxComponent});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: boxComponent,
      decoration: BoxDecoration(
          boxShadow: kElevationToShadow[4],
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).cardColor),
      padding: EdgeInsets.all(16),
    );
  }
}

//criando esse widget para passar pra home componentizado, para poder criar varios widget iguais com o mesmo componente