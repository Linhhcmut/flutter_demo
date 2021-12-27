import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_application/src/view/widget/ride_picker.dart';

import 'widget/home_menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    _mapController.complete(controller);
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId("id-1"),
          position: LatLng(10.826390, 106.800271),
          infoWindow: InfoWindow(
            title: "Công ty TNHH MTV Công nghệ cao Điện Quang",
            snippet: "Mr. Linh Nguyen",
          )));
    });
  }

  Completer<GoogleMapController> _mapController = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(10.826390, 106.800271),
    zoom: 12,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          GoogleMap(
            markers: _markers,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: _onMapCreated,          
          ),
          Column(
            children: <Widget>[
              AppBar(
                leading: GestureDetector(
                  onTap: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
                  child: Icon(
                    Icons.menu,
                    color: Colors.black54,
                  ),
                ),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.notifications_none_outlined,
                        color: Colors.black54,
                      ),
                    ),
                  )
                ],
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Text(
                  "Taxi App",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120, left: 20, right: 20),
            child: RidePicker(),
          ),
        ],
      ),
      drawer: Drawer(
        child: HomeMenu(),
      ),
    );
  }
}
