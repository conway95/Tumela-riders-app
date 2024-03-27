import 'package:firebase_auth/firebase_auth.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

Position? position;
List<Placemark>? placeMark;
String fullAddress = "";
SharedPreferences? sharedPreferences;
FirebaseAuth firebaseAuth = FirebaseAuth.instance;

String perParcelDeliveryAmount="";
String previousEarnings = ""; //it is seller old total earnings
String previousRiderEarnings = ""; //it is rider old total earnings

List<Placemark>? placeMarks;
String completeAddress = "";