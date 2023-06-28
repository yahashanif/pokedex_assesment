import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokedex_assessment/about/about_detail.dart';
import 'package:pokedex_assessment/bottom_nav.dart';
import 'package:pokedex_assessment/favorite_screen.dart';
import 'package:pokedex_assessment/generation.dart/generation_1.dart';
import 'package:pokedex_assessment/homes_screen.dart';

class Splashscreen extends StatefulWidget {
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigation()),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
              'assets/img/pokemon-party.png',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/img/poke-pict.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/img/poke-text.png',
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 16),
                Text(
                  'Flutter ESB Technical Test',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 24),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
