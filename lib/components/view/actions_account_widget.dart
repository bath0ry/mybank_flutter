import 'package:alubank_flutter/components/view/box_home_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AccountActions extends StatelessWidget {
  const AccountActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
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
                onTap: () {},
                child: BoxHome(
                    boxComponent: _AccountActionsContent(
                  icon: Icon(Icons.account_balance_wallet),
                  text: 'Depositar',
                )),
              ),
              InkWell(
                onTap: () {},
                child: BoxHome(
                    boxComponent: _AccountActionsContent(
                  icon: Icon(Icons.cached),
                  text: 'Trasnferir',
                )),
              ),
              InkWell(
                onTap: () {},
                child: BoxHome(
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
    return Container(
      width: 70,
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
