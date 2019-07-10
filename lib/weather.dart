import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WeatherModel {
  Icon getWeatherIcon(int condition) {
    if (condition < 300) {
      return Icon(MdiIcons.weatherLightningRainy, size: 50);
    } else if (condition < 400) {
      return Icon(MdiIcons.weatherPouring, size: 50);
      ;
    } else if (condition < 600) {
      return Icon(MdiIcons.weatherRainy, size: 50);
      ;
    } else if (condition < 700) {
      return Icon(MdiIcons.weatherSnowy, size: 50);
      ;
    } else if (condition < 800) {
      return Icon(MdiIcons.weatherWindy, size: 50);
      ;
    } else if (condition == 800) {
      return Icon(MdiIcons.weatherSunny, size: 50);
      ;
    } else if (condition <= 804) {
      return Icon(MdiIcons.weatherCloudy, size: 50);
    } else {
      return Icon(MdiIcons.weatherPartlycloudy, size: 50);
    }
  }

  String getQuote(int condition) {
    if (condition < 300) {
      return "Be grateful for luck. Pay the thunder no mind - listen to the birds. And don't hate nobody.";
    } else if (condition < 400) {
      return "I never played inside as a kid - even in the rain I'd go out.";
    } else if (condition < 600) {
      return "I've always found the rain very calming.";
    } else if (condition < 700) {
      return "It's getting cold";
    } else if (condition < 800) {
      return "True courage is like a kite; a contrary wind raises it higher.";
    } else if (condition == 800) {
      return "Turn your face to the sun and the shadows fall behind you.";
    } else if (condition <= 804) {
      return "I'd advise people to never step out without wearing an SPF, not even on a cloudy day.";
    } else {
      return "Momo listened to everyone and everything - even to the rain and the wind and the pine trees - and all of them spoke to her after their own fashion.";
    }
  }
}
