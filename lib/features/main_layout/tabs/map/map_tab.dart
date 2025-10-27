import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTab extends StatefulWidget {
  const MapTab({super.key});

  @override
  State<MapTab> createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadMapStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.darkBlue,
      body: Stack(
        children: [
          GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(30.037645676083454, 31.312194358750943),
            zoom: 10,
          ),
          style: _style,
          polylines: {
            Polyline(
              polylineId: const PolylineId('cairo-alex'),
              color: Colors.blue,
              width: 1,
              points: const [
                LatLng(30.0444, 31.2357), // Cairo
                LatLng(30.1833, 30.35),
                LatLng(30.6, 29.8),
                LatLng(31.0, 29.9),
                LatLng(31.2001, 29.9187), // Alexandria
              ],
            ),
          },
          markers: {
            Marker(
              markerId: MarkerId("1"),
              position: LatLng(30.037645676083454, 31.312194358750943),
            ),
          },
        ),]
      ),
    );
  }

  String? _style;

  Future<void> _loadMapStyle() async {
    final String style = await rootBundle.loadString(
      'assets/map_style/map_style.json',
    );
    setState(() {
      _style = style;
    });
  }
}
