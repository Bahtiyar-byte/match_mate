import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:match_mate/screens/screen_manager.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash_screen_final.png"), // Replace with your image asset
            fit: BoxFit.cover, // This will fill the background with the image
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(height: 70),

                    SizedBox(height: 280),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget> [
                        Text(
                          'Connect, Share, Enjoy',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.philosopher(
                            textStyle: TextStyle(
                                color: Color(0xFFF6AF56), //theme.textTheme.bodyMedium?.color,
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ),
                      ]
                    ),

                    SizedBox(height: 30),
                    Text(
                        '– Find your hobby mates nearby!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.philosopher(
                          textStyle: TextStyle(
                              color: Color(0xFFF6AF56), //theme.textTheme.bodyMedium?.color,
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                          ),
                        )
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  ScreenManager.openLoginScreen(context);
                },
                style: ElevatedButton.styleFrom(
                  disabledForegroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  textStyle: TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text('Get Started',textAlign: TextAlign.center,
                    style: GoogleFonts.philosopher(
                      textStyle: TextStyle(
                          color: Color(0xFFF6AF56), //theme.textTheme.bodyMedium?.color,
                          fontSize: 22,
                          fontWeight: FontWeight.w800
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'package:match_mate/screens/auth.dart';
import 'package:match_mate/screens/login_screen.dart';
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/hobby.png',
                    width: 300,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Find Your Perfect Match',
                    style: TextStyle(
                      // color: theme.textTheme.bodyMedium?.color,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Discover potential partners with similar interests',
                    style: TextStyle(
                      color: theme.textTheme.bodyMedium?.color,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).hintColor, //  цвет кнопки
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                textStyle: TextStyle(fontSize: 20),
                shape: RoundedRectangleBorder( // Закругленные края
                  borderRadius: BorderRadius.circular(30), // Радиус 30 пикселей
                ),
              ),
              child: Text('Get Started'),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Don't have an account? Sign up now",
                style: TextStyle(
                  color: theme.textTheme.bodyMedium?.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/