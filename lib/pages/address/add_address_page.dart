import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/controllers/auth_controller.dart';
import 'package:food_delivery/data/controllers/location_controller.dart';
import 'package:food_delivery/data/controllers/user_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<StatefulWidget> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactPersonName = TextEditingController();
  final TextEditingController _contactPersonNumber = TextEditingController();
  late bool _isLogged;
  CameraPosition _cameraPosition =
      const CameraPosition(target: LatLng(45.51563, -122.677433), zoom: 17);

  late LatLng _initialPosition = LatLng(45.51563, -122.677433);
  @override
  void initState() {
    super.initState();
    _isLogged = Get.find<AuthController>().userLoggedIn();
    if (_isLogged && Get.find<UserController>().userMode == null) {
      Get.find<UserController>().getUserInfo();
    }
    if (Get.find<LocationController>().addressList.isNotEmpty) {
      _cameraPosition = CameraPosition(
        target: LatLng(
          double.parse(Get.find<LocationController>().getAddress["latitude"]),
          double.parse(Get.find<LocationController>().getAddress["longitude"]),
        ),
      );
      _initialPosition = LatLng(
        double.parse(Get.find<LocationController>().getAddress["latitude"]),
        double.parse(Get.find<LocationController>().getAddress["longitude"]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address page"),
        backgroundColor: AppColors.mainColor,
      ),
      body: GetBuilder<LocationController>(
        builder: (locationController) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  child: GoogleMap(
                    initialCameraPosition:
                        CameraPosition(target: _initialPosition, zoom: 17),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
