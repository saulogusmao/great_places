import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:great_places/provider/grate_places.dart';
import 'package:provider/provider.dart';

import '../utils/app_routes.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus lugares'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
            },
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: Center(
          child: Text('Nenhum local cadastrado'),
        ),
        builder: (context, greatPlaces, child) => greatPlaces.itemsCount == 0
            ? child!
            : ListView.builder(
                itemCount: greatPlaces.itemsCount,
                itemBuilder: (context, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(
                      greatPlaces.itemByIndex(i).image,
                    ),
                  ),
                  title: Text(greatPlaces.itemByIndex(i).title),
                  onTap: () {},
                ),
              ),
      ),
    );
  }
}
