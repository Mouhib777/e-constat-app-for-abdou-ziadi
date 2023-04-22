import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_constat/constant/constant.dart';
import 'package:e_constat/providers/locationProvider.dart';
import 'package:e_constat/screens/option.dart';
import 'package:e_constat/screens/paint.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class mapScreen extends StatefulWidget {
  const mapScreen({super.key});

  @override
  State<mapScreen> createState() => _mapScreenState();
}

class _mapScreenState extends State<mapScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  late LatLng currentLocation;

  late GoogleMapController _mapController;
  late String AdressLine;
  bool _locating = false;
  bool _loggedIn = false;

  @override
  Widget build(BuildContext context) {
    final locationData = Provider.of<LocationProvider>(context);

    setState(() {
      currentLocation = LatLng(locationData.latitude, locationData.longitude);
    });

    void onCreated(GoogleMapController controller) {
      setState(() {
        _mapController = controller;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Localiser l'accident",
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600, fontSize: 18, letterSpacing: 4),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: currentLocation,
            zoom: 14.4746,
          ),
          zoomControlsEnabled: false,
          compassEnabled: true,
          minMaxZoomPreference: MinMaxZoomPreference(1.5, 20.8),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          mapType: MapType.normal,
          mapToolbarEnabled: true,
          onCameraMove: (CameraPosition position) {
            setState(() {
              _locating = true;
            });
            locationData.onCameraMove(position);
          },
          onMapCreated: onCreated,
          onCameraIdle: () {
            setState(() {
              _locating = false;
            });
            locationData.getMoveCamera();
          },
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 29,
              ),
              Container(
                height: 50,
                margin: EdgeInsets.only(bottom: 30),
                child: Icon(
                  Icons.gps_fixed,
                  size: 40,
                  color: secondaryColor,
                ),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 5.0,
            right: 5,
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.98,
                child: Container(
                    decoration: BoxDecoration(
                      color: thirdColor,
                      border: Border.all(
                        color: secondaryColor,
                        // color: Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(21),
                    ),
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    //color: Colors.white,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 20),
                                child: TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.gps_fixed),
                                  label: Text(
                                    _locating
                                        ? 'Locating...'
                                        : locationData
                                            .selectedAddress.featureName,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: primaryColor),
                                  ),
                                ),
                              ),
                              Text(
                                _locating
                                    ? ""
                                    : locationData.selectedAddress.addressLine,
                                style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                child: Text(
                                  "Envoyer mon e-constat",
                                  style: GoogleFonts.raleway(),
                                ),
                                onPressed: () async {
                                  EasyLoading.showToast("Loading");
                                  await FirebaseFirestore.instance
                                      .collection("utilisateur")
                                      .doc(user!.uid)
                                      .collection("les accidents")
                                      .doc(user!.uid)
                                      .update({
                                    "latitude": locationData.latitude,
                                    "longitude": locationData.longitude,
                                    "addresse de l'accident":
                                        locationData.selectedAddress.addressLine
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => paintScreen(),
                                      ));
                                  EasyLoading.showSuccess(
                                      "Les données ont été envoyés avec succées");
                                },
                              )
                            ])))))
      ]),
    );
  }
}
