import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'package:dream_dose/palette.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        const BackgroundImage1(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: _responsiveTopPadding(screenWidth), left: 10),
                    child: Align(
                      alignment: const Alignment(-0.7, 0.25),
                      child: Text(
                        'Sleep Tracking for\ncomfortable Sleep',
                        style: kHeading.copyWith(height: 1.2),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 15, left: 10),
                    child: const Align(
                      alignment: Alignment(-0.5, 1),
                      child: Text(
                        "Our app provide a sleep tracking\nfunctionality to wake you up\nwhen your body's ready.",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  double _responsiveTopPadding(double screenWidth, {double offset = 0}) {
    if (screenWidth > 392) {
      return 395.0; // Use your original value for larger screens
    } else {
      return screenWidth * 0.94 -
          offset; // Adjust calculation for smaller screens (consider aspect ratio)
    }
  }
}
