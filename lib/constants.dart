import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled2/view/screens/add_video.dart';
import 'package:untitled2/view/screens/display_screen.dart';
import 'package:untitled2/view/screens/profile_screen.dart';
import 'package:untitled2/view/screens/search_screen.dart';


// getRandomColor() => Colors.primaries[Random().nextInt(Colors.primaries.length)];

getRandomColor() => [
  Colors.purpleAccent,
  Colors.purple,
  Colors.deepPurpleAccent,
][Random().nextInt(3)];

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.purple[400];
const borderColor = Colors.grey;

var pageindex = [
  DisplayVideo_Screen(),
  SearchScreen(),
  addVideoScreen(),
  Text('Coming Soon In New Updates!'),
  ProfileScreen(uid: FirebaseAuth.instance.currentUser!.uid,),
];
