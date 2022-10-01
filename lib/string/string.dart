import 'package:flutter/cupertino.dart';

import '../model/articles.dart';
import '../myScreens/businessScreen.dart';
import '../myScreens/scienceScreeen.dart';
import '../myScreens/sportsScreeen.dart';

final SearchTextController = TextEditingController();
late List<Articles> SearchedforArticles;
late List<Articles> articles = [];
List<Widget> widgetpages = [
  BusinessScreen(),
  SpostsScreen(),
  ScienceScreen(),
];
List<String> title = [
  "BusinssScreen",
  "SpostsScreen",
  "ScienceScreen",
];
