import 'package:flutter/material.dart';
import 'package:match_mate/screens/persons/find_persons_mates_screen.dart';
import 'package:map_launcher/map_launcher.dart';
//import 'package:geolocator/geolocator.dart'; geolocator: ^10.1.0

class DistanceSelectorScreen extends StatefulWidget {
  @override
  _DistanceSelectorScreenState createState() => _DistanceSelectorScreenState();
}

class _DistanceSelectorScreenState extends State<DistanceSelectorScreen> {
  double _currentDistance = 0;

  void _openMap() async {
    bool? isMapAvailable = await MapLauncher.isMapAvailable(MapType.apple);

    if (isMapAvailable == true) {
      await MapLauncher.showMarker(
        mapType: MapType.apple,
        coords: Coords(40.3632, -80.0679), // Replace with user's geolocation
        title: "Current Location",
        description: "Your current location",
      );
    } else {
      // Handle the case when Apple Maps is not available
      print("Apple Maps is not available");
    }
  }

  void _findMatch() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text("Finding your match..."),
              ],
            ),
          ),
        );
      },
    );

    // Simulate a network request or processing delay
    await Future.delayed(Duration(seconds: 2));
    Navigator.pop(context); // Close the dialog
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PersonsScreen()), // Navigate to PersonTipsScreen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Distance'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "We will show you the people with matching interests in the radius that you'll choose.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              '${_currentDistance.round()} miles',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _currentDistance,
              min: 0,
              max: 50,
              divisions: 50,
              label: _currentDistance.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentDistance = value;
                });
              },
              activeColor: Colors.blue,
              inactiveColor: Colors.blue.withOpacity(0.3),
              thumbColor: Colors.blueAccent,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _openMap,
                child: Text('Open Map'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _findMatch,
                child: Text('Find a Match'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/**
 * class _DistanceSelectorScreenState extends State<DistanceSelectorScreen> {
    double _currentDistance = 0;
    late Position _currentPosition;

    @override
    void initState() {
    super.initState();
    _determinePosition();
    }

    void _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
    // Permissions are denied, next time you could try
    // requesting permissions again (this is also where
    // Android's shouldShowRequestPermissionRationale
    // returned true. According to Android guidelines
    // your App should show an explanatory UI now.
    return Future.error('Location permissions are denied');
    }
    }

    if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
    'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    _currentPosition = await Geolocator.getCurrentPosition();
    }

    void _openMap() async {
    // ... existing _openMap logic
    if (await MapLauncher.isMapAvailable(MapType.apple)) {
    await MapLauncher.showMarker(
    mapType: MapType.apple,
    coords: Coords(_currentPosition.latitude, _currentPosition.longitude),
    title: "Current Location",
    description: "Your current location",
    );
    }
    }

    @override
    Widget build(BuildContext context) {
    // ... existing build method
    }
    }

 */