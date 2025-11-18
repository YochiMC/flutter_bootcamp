import 'package:flutter/material.dart';
import '../../assets/theme.dart';

class InsectCard extends StatelessWidget {
  final String imageUrl;
  final String spiderName;
  final String spiderDescription;

  const InsectCard({
    super.key,
    required this.imageUrl,
    required this.spiderName,
    required this.spiderDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: alternativeColorOther,
        border: Border.all(color: firstDarkColorUser),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.network(imageUrl, width: 100, height: 100),
          SizedBox(height: 10,),
          Text(spiderName),
          SizedBox(height: 10,),
          Text(spiderDescription, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
