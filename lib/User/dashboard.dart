import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parking_location/User/parking_details.dart';
import 'package:parking_location/theme/common.dart';
import '../navigationdrawer.dart';
import 'package:lottie/lottie.dart' as lottie;

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  List<dynamic> places = [
    {
      "name": "The Trafford Centre",
      "address" : "Staffordshire"
    },
    {
      "name": "Newcastle Mall",
      "address" : "Shropshire"
    },
    {
      "name": "Westfield London",
      "address" : "Bradmore"
    },
    {
      "name": "Liverpool ONE",
      "address" : "Compton"
    },
    {
      "name": "The Trafford Centre",
      "address" : "Bushburry"
    },
    {
      "name": "The Trafford Centre",
      "address" : "Blakenhall"
    },
    {
      "name": "The Trafford Centre",
      "address" : "Ashmore Park"
    },
  ];

  bool gettingLocation = false;
  bool isGettingData = false;
  late Position _currentPosition;
  late LatLng latlong;
  late CameraPosition _cameraPosition;

  @override
  void initState() {
// TODO: implement initState
    setState(() {
      gettingLocation = true;
    });
    getCurrentPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screen_width = MediaQuery.of(context).size.width;
    TextEditingController locationController = TextEditingController();
    
    return Scaffold(
      //key: NavigationData().dashboardScaffoldKey,
      drawer: NavDrawer(),
      backgroundColor: Color(0xFFf5f5f5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          title: Text("Parking Location"),
          backgroundColor: Colors.blue[600],
          elevation: 0,
        ),
      ),
      body: gettingLocation ? lottie.Lottie.asset(
        'assets/location-pin.json',
      ) : ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            height: 50,
            margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1.0, 1.0),
                    blurRadius: 2,
                    spreadRadius: 1)
              ],
            ),
            child: TextField(
              style: TextStyle(fontSize: 13, color: Colors.grey),
              cursorColor: Colors.black,
              controller: locationController,
              decoration: InputDecoration(
                icon: Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 18,
                  height: 18,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.green,
                  ),
                ),
                hintText: "pick up",
                border: InputBorder.none,
                contentPadding:
                EdgeInsets.only(left: 0.0, top: 6.0, right: 30),
              ),
            ),
          ),
          Column(
            children: List.generate(places.length, (index) {
              return GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 20,
                    height: 150,
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        const BoxShadow(
                            color: Colors.black,
                            spreadRadius: -2.0,
                            blurRadius: 12.0),
                      ],
                      color: Colors.white,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.grey.shade300,
                            Color(0xFFf5f5f5),
                            Colors.white
                          ]),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.local_parking,
                          size: 35,
                          color: Colors.red[900],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          child: Text(
                            places[index]['name'],
                            style: TextStyle(height: 1.35, letterSpacing: 0.3,fontSize: 20),
                          ),
                        ),
                        Container(
                          child: Text(
                            places[index]['address'],
                            style: TextStyle(height: 1.35, letterSpacing: 0.3,fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder:
                        (context) => new ParkingDetails()));
                  }
              );
            }),
          ),
          SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }

  Future getCurrentPosition() async {
    setState(() {
      isGettingData = true;
    });
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      await Geolocator.openLocationSettings();
    }
    // normalProgress("Fetching location...");
    Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        print(_currentPosition);
        latlong = LatLng(_currentPosition.latitude, _currentPosition.longitude);
        _cameraPosition = CameraPosition(
            target:
            LatLng(_currentPosition.latitude, _currentPosition.longitude),
            zoom: 20.0);
        //_getGeolocationAddress(_currentPosition);
        //NavigationData.Instance().hide_progress_dialog();
      });
    }).catchError((e) {
      print(e);
    });
    setState(() {
      gettingLocation = false;
    });
  }
}
