import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'searchScreen.dart';
import 'package:productivity_app/weather.dart';
import 'constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WeatherPage extends StatefulWidget {
  WeatherPage({@required this.weatherFromLoad, this.searchedCity});
  final weatherFromLoad;
  final searchedCity;

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherModel weather = WeatherModel();

  int temperature;
  Icon weatherIcon;
  String weatherQuote;
  String description;
  String formatted;

  var city = 'singapore';

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherFromLoad);
  }

//  void pullUpdate() async {
//    var weatherData = await netWorking().getData(city);
//    updateUI(weatherData);
//  }

  void updateUI(dynamic weatherData) {
    //whats dynamic?
    setState(() {
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      description = weatherData['weather'][0]['main'];
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherQuote = weather.getQuote(condition);
      var now = DateTime.now();
      var formatter = DateFormat('yyyy-MM-dd');
      formatted = formatter.format(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: kBackgroundImage,
      padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 15.0),
      constraints: BoxConstraints.expand(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 5.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        '${widget.searchedCity ?? city.toUpperCase()}',
                        style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'OpenSans'), //can import text style
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        //city = await
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SearchScreen();
                            },
                          ),
                        );
//                        if (city != null) {
//                          var weatherData = netWorking().getData(city);
//                          updateUI(weatherData);
//                        }
                      },
                      child: Container(
                        child: Icon(Icons.search, size: 50),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Text(
                    '___________________',
                    //can import text style
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    '$formatted',
                    style: TextStyle(fontSize: 20, fontFamily: 'OpenSans'),
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              '$temperature °',
                              style: TextStyle(
                                  fontSize: 110, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                child: weatherIcon,
                              ),
                              SizedBox(width: 10),
                              Container(
                                child: Text(
                                  '$description',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      width: 2,
                      color: Colors.white,
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Humidity',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          child: Text(
                            '79%',
                            style: TextStyle(fontSize: 35),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Text(
                            'Wind',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          child: Text(
                            '30%',
                            style: TextStyle(fontSize: 35),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 150,
                ),
                Container(
                    child: Row(
                  children: <Widget>[
                    Individualforecast(
                        day: 'MON',
                        icon: MdiIcons.weatherLightningRainy,
                        temperature: '29 °'),
                    Individualforecast(
                        day: 'TUES',
                        icon: MdiIcons.weatherSunny,
                        temperature: '31 °'),
                    Individualforecast(
                        day: 'WED',
                        icon: MdiIcons.weatherRainy,
                        temperature: '29 °'),
                    Individualforecast(
                        day: 'THURS',
                        icon: MdiIcons.weatherCloudy,
                        temperature: '30 °'),
                    Individualforecast(
                        day: 'FRI',
                        icon: MdiIcons.weatherCloudy,
                        temperature: '29 °'),
                    Individualforecast(
                        day: 'SAT',
                        icon: MdiIcons.weatherLightningRainy,
                        temperature: '27 °'),
                    Individualforecast(
                        day: 'SUN',
                        icon: MdiIcons.weatherRainy,
                        temperature: '27 °')
                  ],
                )),
//                SizedBox(
//                  height: 100,
//                ),
//                Container(
//                    color: Colors.white.withOpacity(0.2),
//                    height: 200,
//                    child: ListView(
//                      scrollDirection: Axis.horizontal,
//                      children: <Widget>[
//                        horizontalBox(),
//                        horizontalBox(),
//                        horizontalBox(),
//                        horizontalBox(),
//                      ],
//                    )),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class Individualforecast extends StatelessWidget {
  Individualforecast({this.day, this.icon, this.temperature});

  final day;
  final icon;
  final temperature;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.0),
      child: Column(
        children: <Widget>[
          Container(
            child: Text('$day', style: TextStyle(fontSize: 15)),
          ),
          Container(child: Icon(icon, size: 45)),
          Container(child: Text('$temperature'))
        ],
      ),
    );
  }
}

//class horizontalBox extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: EdgeInsets.all(6.0),
//      child: Container(
//        width: 140.0,
//        decoration: BoxDecoration(
//            color: Colors.white,
//            borderRadius: BorderRadius.all(Radius.circular(18.0))),
//      ),
//    );
//  }
//}

//                  child: Padding(
//                    padding: const EdgeInsets.only(left: 23.0, right: 23.0),
//                    child: Text(
//                      "$weatherQuote",
//                      style: TextStyle(
//                        fontSize: 20,
//                        fontFamily: 'OpenSans',
//                      ),
//                    ),
//                  ),
//                ),
