import 'package:flutter/material.dart';
import 'package:great_places/screens/place_form_sreen.dart';
import 'package:great_places/screens/places_list_screen.dart';

import 'utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.indigo,
          secondary: Colors.amber,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PlacesListScreen(),
      routes: {
        AppRoutes.PLACE_FORM: (context) => PlaceFormScreen(),
      },
    );
  }
}
