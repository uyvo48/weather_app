import 'package:weather_app/home/component/setting.dart';
import 'package:weather_app/util/images.dart';

import '../model/home_model.dart';

class HomeController {
  List<HomeModel> listWeatherForCast = [
    HomeModel(0xffFF8B5, iconUv, 'index'),
    HomeModel(0xffD5EAFF, iconHumidityMini, 'Humidity'),
    HomeModel(0xffF9D5D3, iconAirQuality, 'Air\nQuality'),
    HomeModel(0xffE9E3FA, iconWeatherForecast, 'Weather\n Forecast'),
    HomeModel(0xffC8F0DA, iconVisibility, 'Visibility'),
    HomeModel(0xffFAE3E3, iconWind, 'Wind'),
    HomeModel(0xffE7E8EC, iconSnowFall, 'Snow\nFal '),
    HomeModel(0xffF9F0E3, iconCompass, 'Compass'),
    HomeModel(0xffD3F9F9, iconPrecipitation, 'Precipitation'),
    HomeModel(0xffFAD4F8, iconSunTime, 'Sun\nTime'),
    HomeModel(0xffD4DAFA, iconPollen, 'Pollen'),
    HomeModel(0xffF9FFD8, iconWave, 'Wave'),
  ];

  List<Setting> listSetting = [
    Setting(icon: iconThermometerSetting, text: 'Thermometers'),
    Setting(icon: iconTemperature, text: 'Temperature'),
    Setting(icon: iconThemes, text: 'Themes'),
    Setting(icon: iconLanguage, text: 'Language'),
    Setting(icon: iconContent, text: 'Modify my consent'),
    Setting(icon: iconConditonSetting, text: 'Term of condition'),
    Setting(icon: iconPrivacy, text: 'Privacy'),
    Setting(icon: iconContact, text: 'Contact us'),
    Setting(icon: iconShare, text: 'Share app'),
    Setting(icon: iconThermometerSetting, text: 'Thermometers'),
    Setting(icon: iconTemperature, text: 'Temperature'),
    Setting(icon: iconThemes, text: 'Themes'),
    Setting(icon: iconLanguage, text: 'Language'),
    Setting(icon: iconContent, text: 'Modify my consent'),
    Setting(icon: iconConditonSetting, text: 'Term of condition'),
    Setting(icon: iconPrivacy, text: 'Privacy'),
    Setting(icon: iconContact, text: 'Contact us'),
    Setting(icon: iconShare, text: 'Share app'),
  ];
}
