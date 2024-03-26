import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:dream_dose/Screens/screens.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Flexible(
            child: PageView(
              controller: _controller,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: const [Page1(), Page2()],
            ),
          ),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 50),
                child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPage < 1) {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: const Color(0xFF6EBF5D),
                        minimumSize: const Size(250, 50)),
                    child: Text(
                      _currentPage < 1 ? 'Next' : "Let's Get Started",
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 2,
              effect: const JumpingDotEffect(
                activeDotColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
