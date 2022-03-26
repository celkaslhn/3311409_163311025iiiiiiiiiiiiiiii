import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class NumberOfAnimalsPieChart extends StatelessWidget {
  const NumberOfAnimalsPieChart({
    Key? key,
    required this.countChicken,
    required this.countCow,
    required this.countSheep,
    required this.countOther,
  }) : super(key: key);

  final int countChicken;
  final int countCow;
  final int countSheep;
  final int countOther;

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
        title: ChartTitle(text: 'Number of animals'),
        legend: Legend(isVisible: true),
        series: <PieSeries<_PieData, String>>[
          PieSeries<_PieData, String>(
              explode: true,
              explodeIndex: 0,
              dataSource: <_PieData>[
                _PieData('Chicken', countChicken),
                _PieData('Cow', countCow),
                _PieData('Sheep', countSheep),
                _PieData('Other', countOther)
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
