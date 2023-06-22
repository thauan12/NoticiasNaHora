import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SedeLocalization extends StatefulWidget {
  const SedeLocalization({Key? key}) : super(key: key);

  @override
  State<SedeLocalization> createState() => _SedeLocalizationState();
}

class _SedeLocalizationState extends State<SedeLocalization> {
  GoogleMapController? _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Localização da Sede'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: GoogleMap(
                onMapCreated: (controller) {
                  _mapController = controller;
                },
                initialCameraPosition: const CameraPosition(
                  target: LatLng(-9.911158, -63.035218), // Defina as coordenadas da sede da empresa
                  zoom: 15,
                ),
                markers: <Marker>[
                  Marker(
                    markerId: MarkerId('Sede'),
                    position: LatLng(-9.911158, -63.035218), // Defina as coordenadas da sede da empresa
                    infoWindow: InfoWindow(
                      title: 'Sede da Empresa',
                      snippet: 'Localização da Sede',
                    ),
                  ),
                ].toSet(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
