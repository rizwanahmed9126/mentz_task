import 'package:flutter/material.dart';
import 'package:mentz_task/view/screens/search_screen.dart';



const searchScreenRoute = '/Welcome-screen';


Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {

    case searchScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => const SearchScreen());




    default:
      return MaterialPageRoute(
          builder: (BuildContext context) => const SearchScreen());
  }
}
