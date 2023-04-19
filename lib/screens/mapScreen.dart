import 'package:e_constat/providers/locationProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class mapScreen extends StatefulWidget {
  const mapScreen({super.key});

  @override
  State<mapScreen> createState() => _mapScreenState();
}

class _mapScreenState extends State<mapScreen> {
  LatLng? currentLocation1;
  late GoogleMapController _mapController;
  late String AdressLine;
  bool _locating = false;
  bool _loggedIn = false;

  @override
  Widget build(BuildContext context) {
    final locationData = Provider.of<LocationProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: currentLocation1!,
              zoom: 14.4746,
            ),
          )
        ],
      ),
    );
  }
}
