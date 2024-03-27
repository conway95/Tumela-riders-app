import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../authScreens/auth_screen.dart';
import '../mainScreens/homeScreen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen>
{
  iniTimer()
  {
    Timer(const Duration(seconds: 3), () async
    {
    if(FirebaseAuth.instance.currentUser == null)
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> const AuthScreen()));
      }
    else
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> const HomeScreen()));
      }
    
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    iniTimer();

  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                  "images/splash.png"
              ),
            ),
            const Text("Riders App",
            textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: 3,
              fontSize: 30,
              color: Colors.pink,
              fontWeight: FontWeight.bold
            ),
            )
          ],
        ),
      ),
    );
  }
}
