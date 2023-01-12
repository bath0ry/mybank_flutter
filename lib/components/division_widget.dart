import 'package:alubank_flutter/theme/theme_colors.dart';
import 'package:flutter/cupertino.dart';

class DivisionWidget extends StatelessWidget {
  const DivisionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: BoxDecoration(border: Border.all(color: ThemeColors.divison)),
    );
  }
}
