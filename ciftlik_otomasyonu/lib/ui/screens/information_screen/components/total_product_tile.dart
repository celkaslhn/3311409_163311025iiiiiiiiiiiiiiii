import 'package:ciftlik_otomasyonu/core/constants/const_color.dart';
import "package:flutter/material.dart";

class TotalProductWidget extends StatelessWidget {
  const TotalProductWidget({
    Key? key,
    required this.totalProduct,
    required this.label,
  }) : super(key: key);

  final String totalProduct;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: seafoamGreen,
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          Text(
            label,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Text(
            totalProduct,
            style: const TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
