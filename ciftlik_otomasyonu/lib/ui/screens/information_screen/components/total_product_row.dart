import "package:flutter/material.dart";

import 'total_product_tile.dart';

class TotalProductRow extends StatelessWidget {
  const TotalProductRow({
    Key? key,
    required this.totalEgg,
    required this.totalMilk,
    required this.totalWool,
  }) : super(key: key);

  final String totalEgg;
  final String totalMilk;
  final String totalWool;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TotalProductWidget(label: 'Total Egg', totalProduct: totalEgg),
        const Spacer(),
        TotalProductWidget(label: 'Total Milk', totalProduct: totalMilk),
        const Spacer(),
        TotalProductWidget(label: 'Total Wool', totalProduct: totalWool),
      ],
    );
  }
}
