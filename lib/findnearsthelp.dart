import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Place {
  final String name;
  final double latitude;
  final double longitude;

  Place({required this.name, required this.latitude, required this.longitude});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color.fromARGB(255, 80, 165, 94),
        ),
      ),
      home: MapPage(),
    );
  }
}

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Position? _currentPosition;
  List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation().then((_) {
      searchNearbyPlaces("mental institution").then((places) {
        _onSearchComplete(places);
      });
    });
  }

  Future<void> _getCurrentLocation() async {
    _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<List<Place>> searchNearbyPlaces(String keyword) async {
    final String url =
        "https://overpass-api.de/api/interpreter?data=[out:json];node[amenity=clinic][healthcare=social_facility][speciality=psychiatry](around:5000,${_currentPosition!.latitude},${_currentPosition!.longitude});out;";

    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);

    List<Place> places = [];
    if (data['elements'] != null) {
      data['elements'].forEach((element) {
        places.add(Place(
          name: element['tags']['name'] ?? "Mental Institution",
          latitude: element['lat'],
          longitude: element['lon'],
        ));
      });
    }

    return places;
  }

  void _addMarkers(List<Place> places) {
    places.forEach((place) {
      _markers.add(Marker(
        point: LatLng(place.latitude, place.longitude),
        builder: (ctx) => Container(
          child: Icon(Icons.location_pin),
        ),
      ));
    });
  }

  void _onSearchComplete(List<Place> places) {
    setState(() {
      _addMarkers(places);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Page'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(-1.883330, 30.151250),
          zoom: 13.0,
          // zoom: 14.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
            tileProvider: CachedNetworkTileProvider(),
          ),
          MarkerLayerOptions(markers: _markers),
        ],
      ),
    );
  }
}

class CachedNetworkTileProvider extends TileProvider {
  const CachedNetworkTileProvider();

  @override
  ImageProvider getImage(Coords<num> coords, TileLayerOptions options) {
    return CachedNetworkImageProvider(getTileUrl(coords, options));
  }
}
