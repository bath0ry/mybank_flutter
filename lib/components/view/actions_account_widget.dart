import 'package:alubank_flutter/components/view/box_home_widget.dart';
import 'package:alubank_flutter/data/bank_inherited.dart';

import 'package:flutter/material.dart';

class AccountActions extends StatelessWidget {
  const AccountActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              'Ações da conta',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  BankInherited.of(context).values.deposit(10);
                },
                child: const BoxHome(
                    boxComponent: _AccountActionsContent(
                  icon: Icon(Icons.account_balance_wallet),
                  text: 'Depositar',
                )),
              ),
              InkWell(
                onTap: () {
                  BankInherited.of(context).values.transfer(10);
                },
                child: const BoxHome(
                    boxComponent: _AccountActionsContent(
                  icon: Icon(Icons.cached),
                  text: 'Trasnferir',
                )),
              ),
              InkWell(
                onTap: () {},
                child: const BoxHome(
                    boxComponent: _AccountActionsContent(
                  icon: Icon(Icons.center_focus_strong),
                  text: 'Ler',
                )),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _AccountActionsContent extends StatelessWidget {
  final Icon icon;
  final String text;
  const _AccountActionsContent(
      {super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8, top: 8),
            child: icon,
          ),
          Text(text)
        ],
      ),
    );
  }
}
