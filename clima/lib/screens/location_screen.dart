import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({required this.locationWeather});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel _model = WeatherModel();
  late double temperature;
  late int condition;
  late String cityName;
  late int inCelsius;
  late String icon;
  late String desc;
  @override
  void initState() {
    super.initState();
    updateUi(widget.locationWeather);
  }

  void fetchLocationData() async {
    var locationWeather = await WeatherModel().getLocationWeather();
    updateUi(locationWeather);
  }

  void openCityScreen() async {
    var typedCityName =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CityScreen();
    }));
    if (typedCityName != null) {
      print("typedCityName:${typedCityName.toString().trim()}");
      var cityWeather = await WeatherModel().getCityWeather(typedCityName);
      updateUi(cityWeather);
    }
  }

  void updateUi(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        icon = "Error";
        desc = "Unable to fetch weather data";
        cityName = "";
        return;
      }
      temperature = weatherData['main']['temp'];
      condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      inCelsius = (temperature - 273.15).toInt();
      icon = _model.getWeatherIcon(condition);
      desc = _model.getMessage(inCelsius);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpeg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      fetchLocationData();
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      openCityScreen();
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$inCelsius°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$icon️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$desc in $cityName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
