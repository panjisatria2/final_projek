import 'package:final_project/navigation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black),
          Positioned(
              child: Container(
                  child: Image.asset('assets/splash/Image Onboarding.png'))),
          Positioned(
            top: 530,
            right: 0,
            left: 0,
            child: Stack(
              children: [
                Container(
                  child: Image.asset('assets/splash/Shadow Container.png'),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 24, top: 24, right: 24, bottom: 54),
                    child: Column(
                      children: [
                        Text(
                          "Empower Your \n Journey In IT With \n Plugins! ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sora(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Welcome to Plugin, your gateway to endless \n IT possibilities!",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sora(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        SizedBox(
                          height: 56,
                          width: 327,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16))),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                      (route) => false);
                            },
                            child: Text(
                              "Get Started",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.sora(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
