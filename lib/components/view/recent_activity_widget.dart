import 'package:alubank_flutter/components/view/box_home_widget.dart';
import 'package:alubank_flutter/components/view/division_widget.dart';
import 'package:alubank_flutter/components/view/dot_widget.dart';
import 'package:alubank_flutter/theme/theme_colors.dart';

import 'package:flutter/material.dart';

import '../../data/bank_inherited.dart';

class RecentActivity extends StatelessWidget {
  const RecentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: BoxHome(boxComponent: _RecentActivityContent()),
    );
  }
}

class _RecentActivityContent extends StatefulWidget {
  const _RecentActivityContent({super.key});

  @override
  State<_RecentActivityContent> createState() => _RecentActivityContentState();
}

class _RecentActivityContentState extends State<_RecentActivityContent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child:
                        DotWidget(color: ThemeColors.recentActivity['spent']),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saída',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        '\$${BankInherited.of(context).values.spent}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child:
                        DotWidget(color: ThemeColors.recentActivity['income']),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Entrada',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        '\$${BankInherited.of(context).values.earned}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              'Limite de gastos: \$500,00',
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: LinearProgressIndicator(
                    value: BankInherited.of(context).values.spent / 500,
                    minHeight: 7,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: DivisionWidget(),
          ),
          Text(
              'Esse mês você gastou ${spentAndEarned()} com jogos. Tente abaixar esse custo!'),
          TextButton(
              onPressed: () {},
              child: const Text(
                'Diga-me como!',
                style: TextStyle(fontSize: 17),
              ))
        ],
      ),
    );
  }

  double spentAndEarned() {
    double result = (BankInherited.of(context).values.spent /
            BankInherited.of(context).values.earned) *
        100;
    if (result.isNaN) {
      return 0;
    }
    return result;
  }
}
