import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/provider/great_places.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:great_places/widgets/image_input.dart';
import 'package:provider/provider.dart';

import '../widgets/location_input.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({super.key});

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;
  LatLng? _pickedPosition;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _selectPosition(LatLng position) {
    _pickedPosition = position;
  }

  bool _isValidForm() {
    return _titleController.text.isNotEmpty &&
        _pickedImage != null &&
        _pickedPosition != null;
  }

  void _submitForm() {
    if (!_isValidForm()) return;
    Provider.of<GreatPlaces>(context, listen: false).addPlace(
      _titleController.text,
      _pickedImage!,
      _pickedPosition!,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo lugar'),
      ),
      body: Column(
        //metodo 1 para fixar o botão em baixo:
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            //metodo 2 para fixar o botao em baixo
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  //formulário
                  children: <Widget>[
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Título',
                      ),
                    ),
                    SizedBox(height: 10),
                    ImageInput(_selectImage),
                    LocationInput(this._selectPosition),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            icon: Icon(Icons.add),
            label: Text('Adicionar'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black87,
              backgroundColor: Colors.amber,
              elevation: 0,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: ContinuousRectangleBorder(),
            ),
            onPressed: _submitForm,
          ),
        ],
      ),
    );
  }
}
