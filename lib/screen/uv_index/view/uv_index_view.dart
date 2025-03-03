import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/component/circle_page.dart';

import '../../../component/app_bar_setting_item.dart';

class UvIndexView extends StatefulWidget {
  const UvIndexView({super.key});

  @override
  State<UvIndexView> createState() => _UvIndexViewState();
}

Color goodColor1 = Color(0xff038603);
Color goodColor2 = Color(0xff0EE400);
Color moderateColor1 = Color(0xffB18B01);
Color moderateColor2 = Color(0xffFFFF00);
Color unhealthyForSensitiveColor1 = Color(0xffB53600);
Color unhealthyForSensitiveColor2 = Color(0xffFF7E00);
Color unHealthyColor1 = Color(0xffA00000);
Color unHealthyColor2 = Color(0xffD94F4F);
Color veryUnHealthyColor1 = Color(0xff6B0076);
Color veryUnHealthyColor2 = Color(0xffAE55B7);
Color maroonColor1 = Color(0xff7B0E2C);
Color maroonColor2 = Color(0xffC92251);

class _UvIndexViewState extends State<UvIndexView> {
  double textParameter = 0;
  bool isLoading = true;
  double? latitude; // Tọa độ từ thiết bị
  double? longitude;
  String locationName = ''; // Hiển thị tọa độ từ API

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Location permissions are denied.')),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Location permissions are permanently denied.')),
      );
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
    });

    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    try {
      final uvUrl = Uri.parse(
        'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&daily=uv_index_max',
      );

      final uvResponse = await http.get(uvUrl);
      if (uvResponse.statusCode == 200) {
        final uvData = json.decode(uvResponse.body);
        final uvIndex = uvData['daily']['uv_index_max'][0];
        final apiLatitude = double.parse(
          uvData['latitude'].toString(),
        ).toStringAsFixed(2); // Làm tròn 2 chữ số
        final apiLongitude = double.parse(
          uvData['longitude'].toString(),
        ).toStringAsFixed(2);

        setState(() {
          textParameter = uvIndex.toDouble();
          locationName = 'Lat: $apiLatitude, Lon: $apiLongitude';
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load UV Index');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        locationName = 'Unknown Location';
      });
      print('Error fetching data: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to load data')));
    }
  }

  @override
  Widget build(BuildContext context) {
    Color color1;
    Color color2;
    String textAirQuality;
    String textState;

    if (textParameter >= 0 && textParameter <= 2) {
      color1 = goodColor1;
      color2 = goodColor2;
      textAirQuality = 'Low';
      textState = 'Good';
    } else if (textParameter > 2 && textParameter <= 5) {
      color1 = moderateColor1;
      color2 = moderateColor2;
      textAirQuality = 'Moderate';
      textState = 'Moderate';
    } else if (textParameter > 5 && textParameter <= 7) {
      color1 = unhealthyForSensitiveColor1;
      color2 = unhealthyForSensitiveColor2;
      textAirQuality = 'High';
      textState = 'Unhealthy for Sensitive Groups';
    } else if (textParameter > 7 && textParameter <= 10) {
      color1 = unHealthyColor1;
      color2 = unHealthyColor2;
      textAirQuality = 'Very High';
      textState = 'Unhealthy';
    } else if (textParameter > 10) {
      color1 = veryUnHealthyColor1;
      color2 = veryUnHealthyColor2;
      textAirQuality = 'Extreme';
      textState = 'Very Unhealthy';
    } else {
      color1 = maroonColor1;
      color2 = maroonColor2;
      textAirQuality = 'Unknown';
      textState = 'N/A';
    }

    return Scaffold(
      appBar: AppBarSettingItem(textSettingItem: 'UV Index'),
      body: Center(
        child:
            isLoading
                ? CircularProgressIndicator()
                : CirclePage(
                  unit: "",
                  textParameter: textParameter,
                  color1: color1,
                  color2: color2,
                  located: locationName, // Tọa độ từ API
                  textAirQuality: textAirQuality,
                  textState: textState,
                  checkUnit: false,
                ),
      ),
    );
  }
}
