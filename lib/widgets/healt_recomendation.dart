import 'package:flutter/material.dart';

class HealthRecomedation extends StatelessWidget {
  final String healthrec;
  final String howto;
  final String image;

  const HealthRecomedation({Key key, this.healthrec, this.howto, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: Axis.vertical,
          children: [
            Image.asset(
              '$image',
              scale: 1.5,
            ),
            SizedBox(
              height: 15,
            ),
            Text('$healthrec'),
            SizedBox(
              height: 5,
            ),
            Text('$howto'),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
