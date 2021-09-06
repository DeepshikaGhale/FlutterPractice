import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row(
        //   children: [
        //     "Catalog App".text.xl5.bold.color(context.theme.accentColor).make(),
        //     ToggleButtons(children: [Icon(Icons.toggle_on)], isSelected: [])
        //   ],
        // ),
        "Catalog App".text.xl5.bold.color(context.theme.accentColor).make(),
        "Trending Products".text.make()
      ],
    );
  }
}
