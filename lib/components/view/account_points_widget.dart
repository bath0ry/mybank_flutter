import 'package:alubank_flutter/components/view/box_home_widget.dart';
import 'package:alubank_flutter/components/view/division_widget.dart';
import 'package:alubank_flutter/components/view/dot_widget.dart';
import 'package:alubank_flutter/theme/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AccountPoints extends StatelessWidget {
  const AccountPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text('Pontos da conta',
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            BoxHome(
              boxComponent: _AccountPointsContent(),
            ),
          ],
        ));
  }
}

class _AccountPointsContent extends StatelessWidget {
  const _AccountPointsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pontos totais:',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          '3000',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: DivisionWidget(),
        ),
        Text(
          'Objetivos:',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 17, top: 13),
          child: Row(
            children: [
              DotWidget(color: ThemeColors.recentActivity['freeDeliver']),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  'Entrega grátis: 15000pts',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
            DotWidget(color: ThemeColors.recentActivity['streamingMonth']),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                '1 mês de streaming: 30000pts',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            )
          ],
        )
      ],
    );
  }
}
