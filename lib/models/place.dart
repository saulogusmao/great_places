import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address; // para remover o 'required', adicionar '?' após String

  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
  });
  LatLng toLatLng() {
    return LatLng(latitude, longitude);
  }
}

class Place {
  final String id;
  final String title;
  final PlaceLocation? location;
  final File image; // IO, e nao html

  Place({
    required this.id,
    required this.title,
    required this.location,
    required this.image,
  });
}
