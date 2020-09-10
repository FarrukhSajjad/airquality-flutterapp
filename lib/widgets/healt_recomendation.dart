import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HealthRecomedation extends StatelessWidget {
  final String healthrec;
  final String howto;
  final String image;

  const HealthRecomedation({Key key, this.healthrec, this.howto, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
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
              Text(
                '$healthrec',
                style: GoogleFonts.aladin(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '$howto',
                style: GoogleFonts.abel(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
