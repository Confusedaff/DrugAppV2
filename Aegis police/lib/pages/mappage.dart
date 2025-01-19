import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Mappage extends StatefulWidget {
  const Mappage({super.key});

  @override
  State<Mappage> createState() => _MappageState();
}

class _MappageState extends State<Mappage> {
  final SupabaseClient supabaseClient = Supabase.instance.client;
  List<Marker> myMarkers = [];
  Location locationController = Location();
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  static const LatLng kothamangalam = LatLng(10.0603, 76.6352);
  LatLng? currentPosition;

  @override
  void initState() {
    super.initState();
    fetchMarkers(); // Load markers from Supabase
    startLocationUpdates(); // Start location updates
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPosition == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                if (!mapController.isCompleted) {
                  mapController.complete(controller);
                }
              },
              initialCameraPosition: CameraPosition(
                target: kothamangalam,
                zoom: 13,
              ),
              mapType: MapType.hybrid,
              markers: {
                ...Set.from(myMarkers),
                if (currentPosition != null)
                  Marker(
                    markerId: const MarkerId("currentPosition"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: currentPosition!,
                  ),
              },
              onTap: (LatLng tappedPoint) => addMarker(tappedPoint),
            ),
    );
  }

  /// Fetch markers from Supabase and add them to the map
  Future<void> fetchMarkers() async {
    try {
      final response = await supabaseClient.from('markers').select();

      setState(() {
        myMarkers = (response as List<dynamic>).map<Marker>((marker) {
          final LatLng position = LatLng(
            marker['latitude'] as double,
            marker['longitude'] as double,
          );

          return Marker(
            markerId: MarkerId(marker['id'].toString()),
            position: position,
            draggable: true,
            icon: BitmapDescriptor.defaultMarkerWithHue(
              marker['marker_icon'] == "blue"
                  ? BitmapDescriptor.hueBlue
                  : BitmapDescriptor.hueRed,
            ),
            onDragEnd: (endPosition) {
              print("Marker dragged to: $endPosition");
            },
          );
        }).toList();
      });
    } catch (e) {
      print("Error fetching markers: $e");
    }
  }

  /// Add a marker to the map and save it to Supabase
  Future<void> addMarker(LatLng tappedPoint) async {
    try {
      const markerIcon = "blue";

      // Save the marker to Supabase
      final response = await supabaseClient.from('markers').insert({
        'latitude': tappedPoint.latitude,
        'longitude': tappedPoint.longitude,
        'marker_icon': markerIcon,
      });

      if (response.error == null) {
        setState(() {
          if (myMarkers.length >= 3) {
            myMarkers.removeAt(0);
          }
          myMarkers.add(
            Marker(
              markerId: MarkerId(tappedPoint.toString()),
              position: tappedPoint,
              draggable: true,
              icon: BitmapDescriptor.defaultMarkerWithHue(
                markerIcon == "blue"
                    ? BitmapDescriptor.hueBlue
                    : BitmapDescriptor.hueRed,
              ),
              onDragEnd: (endPosition) {
                print("Marker dragged to: $endPosition");
              },
            ),
          );
        });
      } else {
        print("Error saving marker: ${response.error!.message}");
      }
    } catch (e) {
      print("Error adding marker: $e");
    }
  }

  /// Update the camera position
  Future<void> updateCameraPosition(LatLng pos) async {
    final GoogleMapController controller = await mapController.future;
    CameraPosition newCameraPosition = CameraPosition(target: pos, zoom: 13);

    await controller.animateCamera(
      CameraUpdate.newCameraPosition(newCameraPosition),
    );
  }

  /// Track user location and update the map
  Future<void> startLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await locationController.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await locationController.requestService();
      if (!serviceEnabled) return;
    }

    permissionGranted = await locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return;
    }

    locationController.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          currentPosition =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          updateCameraPosition(currentPosition!);
        });
      }
    });
  }
}
