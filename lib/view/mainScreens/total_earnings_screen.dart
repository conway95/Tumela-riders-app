import 'package:flutter/material.dart';
import '../../global/global_var.dart';
import '../splashScreen/splash_screen.dart';


class TotalEarningsScreen extends StatefulWidget
{
  const TotalEarningsScreen({Key? key}) : super(key: key);

  @override
  _TotalEarningsScreenState createState() => _TotalEarningsScreenState();
}

class _TotalEarningsScreenState extends State<TotalEarningsScreen>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                "R" + previousRiderEarnings,
                style: const TextStyle(
                    fontSize: 80,
                    color: Colors.white,
                    fontFamily: "Signatra"
                ),
              ),

              const Text(
                "Total Earnings",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  color: Colors.white,
                  thickness: 1.5,
                ),
              ),

              const SizedBox(height: 40.0,),

              GestureDetector(
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (c)=> const MySplashScreen()));
                },
                child: const Card(
                  color: Colors.pink,
                  margin: EdgeInsets.symmetric(vertical: 40, horizontal: 140),
                  child: ListTile(
                    leading: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Back",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
