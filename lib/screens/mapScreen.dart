import 'package:e_constat/constant/constant.dart';
import 'package:e_constat/providers/locationProvider.dart';
import 'package:flutter/material.dart';
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
    setState(() {
      var alertStyle = AlertStyle(
        overlayColor: Color.fromARGB(33, 57, 42, 59),
        animationType: AnimationType.grow,
        isCloseButton: false,
        isOverlayTapDismiss: false,
        descStyle: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        animationDuration: Duration(milliseconds: 400),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: BorderSide(
            color: Colors.blue,
          ),
        ),
        titleStyle: GoogleFonts.montserrat(color: Colors.red
            // Color.fromARGB(255, 228, 94, 16),
            ),
      );

      Alert(
        // image:
        //     Image.asset("assets/images/location.jpg"),
        context: context,
        style: alertStyle,
        type: AlertType.none,
        title: "mizel ma9bleksh",
        desc: "ki ye9blek iwali andek autorisation besh tehki maah",
        buttons: [
          DialogButton(
            child: Text(
              "OK !",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.of(context, rootNavigator: true).pop()
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) =>
            //             chatScreenHome())),
            ,
            color: Colors.amber,
            // Color.fromARGB(255, 187, 137, 196),
            radius: BorderRadius.circular(10.0),
          ),
        ],
      ).show();
    });

    void onCreated(GoogleMapController controller) {
      setState(() {
        _mapController = controller;
      });
    }

    return Scaffold(
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
      ]),
    );
  }
}
