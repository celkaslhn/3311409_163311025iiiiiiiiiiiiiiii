import "package:flutter/material.dart";
import 'package:syncfusion_flutter_charts/charts.dart';

class ProductPieChart extends StatelessWidget {
  const ProductPieChart({
    Key? key,
    required this.totalEgg,
    required this.totalMilk,
    required this.totalWool,
    required this.totalOther,
  }) : super(key: key);

  final String totalEgg;
  final String totalMilk;
  final String totalWool;
  final String totalOther;

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
        title: ChartTitle(text: 'Total Products'),
        legend: Legend(isVisible: true),
        series: <PieSeries<_PieData, String>>[
          PieSeries<_PieData, String>(
              explode: true,
              dataSource: <_PieData>[
                _PieData('Other', int.parse(totalOther)),
                _PieData('Chicken', int.parse(totalEgg)),
                _PieData('Cow', int.parse(totalMilk)),
                _PieData('Sheep', int.parse(totalWool)),
              ],
              xValueMapper: (_PieData data, _) => data.xData,
              yValueMapper: (_PieData data, _) => data.yData,
              dataLabelMapper: (_PieData data, _) => data.text,
              dataLabelSettings: const DataLabelSettings(isVisible: true)),
        ]);
  }
}

class _PieData {
  _PieData(this.xData, this.yData, [this.text]);
  final String xData;
  final num yData;
  final String? text;
}
