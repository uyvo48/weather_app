import '../../../util/images.dart';
import '../model/introModel.dart';

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
