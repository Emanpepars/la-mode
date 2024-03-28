import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:la_mode/core/utils/app_components.dart';
import 'package:location/location.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../auth/register/presentation/widgets/cu_text_form_field.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    streamSubscription?.cancel();
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  Set<Marker> marker = {};

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.hybrid,
      markers: marker,
      onTap: (argument) {
        marker.add(
            Marker(markerId: const MarkerId("newMarker"), position: argument));
        setState(() {});
      },
      initialCameraPosition: currentLocation,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }

  Future<void> updateMyLocation() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            zoom: 18,
            target:
                LatLng(locationData!.latitude!, locationData!.longitude!))));
  }

  Location location = Location();

  PermissionStatus? permissionStatus;
  bool isServiceEnable = false;
  StreamSubscription<LocationData>? streamSubscription;
  LocationData? locationData;

  CameraPosition currentLocation = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  void getCurrentLocation() async {
    bool isPermission = await isPermissionGranted();
    if (!isPermission) return;
    bool isService = await isServiceEnabled();
    if (!isService) return;

    locationData = await location.getLocation();
    marker.add(Marker(
        markerId: const MarkerId("myLocation"),
        position: LatLng(locationData!.latitude!, locationData!.longitude!)));
    currentLocation = CameraPosition(
      target: LatLng(locationData!.latitude!, locationData!.longitude!),
      zoom: 19.4746,
    );

    streamSubscription = location.onLocationChanged.listen((event) {
      locationData = event;
      marker.add(Marker(
          markerId: const MarkerId("myLocation"),
          position: LatLng(event.latitude!, event.longitude!)));
      updateMyLocation();
      setState(() {});
    });
    location.changeSettings(accuracy: LocationAccuracy.high);

    setState(() {});
  }

  Future<bool> isServiceEnabled() async {
    isServiceEnable = await location.serviceEnabled();
    if (!isServiceEnable) {
      isServiceEnable = await location.requestService();
      return isServiceEnable;
    }
    return isServiceEnable;
  }

  Future<bool> isPermissionGranted() async {
    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      return permissionStatus == PermissionStatus.granted;
    }
    return permissionStatus == PermissionStatus.granted;
  }
}

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBag(
        appBarTitle: 'Add New Address',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity.w,
                height: 300.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.sp),
                  ),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.sp),
                    ),
                    child: const MapSample()),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Title',
                style: robotoTitleField(),
              ),
              SizedBox(
                height: 2.h,
              ),
              const CuTextFormField(
                hintText: 'Enter your title',
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Department',
                style: robotoTitleField(),
              ),
              SizedBox(
                height: 2.h,
              ),
              const CuTextFormField(
                hintText: 'Enter your Department',
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Street',
                style: robotoTitleField(),
              ),
              SizedBox(
                height: 2.h,
              ),
              const CuTextFormField(
                hintText: 'Enter your Street',
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'City',
                style: robotoTitleField(),
              ),
              SizedBox(
                height: 2.h,
              ),
              const CuTextFormField(
                hintText: 'Enter your City',
              ),
              SizedBox(
                height: 15.h,
              ),
              MyButton(
                text: 'Save Address',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
