import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String apiKey = "60a67f790ae70df281b69c9c15bbc896";

class WeatherModel {
  static dynamic getCityData(String cityName) async {
    final Uri cityUrl = Uri(
      scheme: "https",
      host: "api.openweathermap.org",
      path: "data/2.5/weather",
      queryParameters: {
        "q": cityName,
        "appid": apiKey,
        "units": "metric",
      },
    );

    print(cityUrl);

    NetworkHelper networkHelper = NetworkHelper(cityUrl);
    dynamic weatherData = await networkHelper.getData();
    return weatherData;
  }

  static dynamic getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    var latitude = location.latitude;
    var longitude = location.longitude;

    final Uri locationUrl = Uri(
      scheme: "https",
      host: "api.openweathermap.org",
      path: "data/2.5/weather",
      queryParameters: {
        "lat": latitude.toString(),
        "lon": longitude.toString(),
        "appid": apiKey,
        "units": "metric",
      },
    );

    NetworkHelper networkHelper = NetworkHelper(locationUrl);
    dynamic weatherData = await networkHelper.getData();
    return weatherData;
  }

  static String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  static String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
