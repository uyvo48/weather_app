import 'package:weather_app/intro/model/introModel.dart';

import '../../util/images.dart';

class IntroController {
  List<IntroModel> listIntro = [
    IntroModel(
      imageIntro1,
      iconIntro1,
      'Indoor/Outdoor Temperature',
      'Check temperature by smart thermometer',
    ),
    IntroModel(
      imageIntro2,
      iconIntro2,
      'All In One',
      'Weather forecast, Air quality, UV index, Compass, Humidity',
    ),
  ];
}
