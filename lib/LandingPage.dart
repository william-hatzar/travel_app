import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/HomeScreen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 110),
              const Text(
                "Discover",
                style: TextStyle(fontFamily: "Poppins", fontSize: 25, fontWeight: FontWeight.w600),
              ),
              const Text(
                "your next holiday",
                style: TextStyle(fontFamily: "Poppins", fontSize: 25, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(right: 88.0),
                child: Text("Unlock Unforgettable Getaways and connect with different cultures",
                    style: TextStyle(fontFamily: "Poppins", color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w200)),
              ),
              const SizedBox(height: 40),
              Stack(
                children: [
                  Image.asset("images/TravelPicture@1x.png"
                  ),
                  GestureDetector(
                    onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color(0xff63D1D9),
                          borderRadius: BorderRadius.circular(40)
                      ),
                      height: 60,
                      width: 160,
                      child: const Text(
                        "Try now",
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
