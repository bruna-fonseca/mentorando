import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mentorando/pages_routes/app_pages.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          'mentorando.',
          style: TextStyle(color: Color(0xff363B53)),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Spacer(),
          Center(
            child: SvgPicture.asset(
              "assets/others/onboarding.svg",
              width: 300,
              height: 400,
            ),
          ),
          const Spacer(), //
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: OutlinedButton(
              onPressed: () {
                Get.offAndToNamed(Paths.initial);
              },
              style: OutlinedButton.styleFrom(
                  fixedSize: const Size(250, 60),
                  side: const BorderSide(width: 2, color: Color(0xff363B53))
              ),
              child: const Text(
                "ir para o inicio",
                style: TextStyle(
                  color: Color(0xff363B53),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
