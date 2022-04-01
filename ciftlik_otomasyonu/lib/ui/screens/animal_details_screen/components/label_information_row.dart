import "package:flutter/material.dart";

//ıcerısınde oldukları wıdgetlerı tutuyorlaara.
//labelınformatıon bir veriyi gostermek ıcın bır wıdgettır.
//kurucu parametre olarak bır label(etiket) ve informatıon(bilgi) verisi alır
//iki veride String tipindedir.
//ardından aldığı ıkı verıyı Row wıdgetı ıle arayuze yansıtır.
                

class LabelInformationRow extends StatelessWidget {
  const LabelInformationRow({
    Key? key,
    required this.label,
    required this.information,
  }) : super(key: key);

  final String label;
  final String information;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Text(label,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const Spacer(),
          Text(information,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
        ],
      ),
    );
  }
}
