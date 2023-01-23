import 'package:alubank_flutter/data/bank_inherited.dart';
import 'package:alubank_flutter/data/bank_service.dart';
import 'package:alubank_flutter/theme/theme_colors.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  late final BankService service;

  @override
  void initState() {
    service = BankService(Dio());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {});
      },
      child: Container(
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
                        text: BankInherited.of(context)
                            .values
                            .available
                            .toString(),
                        style: Theme.of(context).textTheme.bodyLarge)
                  ])),
                  const Text(
                    'Saldo Disponivel',
                  ),
                ],
              ),
              FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Erro'),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text.rich(
                          TextSpan(
                            text: 'R\$',
                            children: <TextSpan>[
                              TextSpan(
                                  text: snapshot.data.toString(),
                                  style: Theme.of(context).textTheme.bodyLarge)
                            ],
                          ),
                        ),
                        const Text('Dolar to Real'),
                      ],
                    );
                  }
                  return Text('Erro na API');
                },
                future: service.getDolarToReal(),
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
      ),
    );
  }
}
