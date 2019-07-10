import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'getData.dart';
import 'weatherPage.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: loadingScreen(),
    );
  }
}

class loadingScreen extends StatefulWidget {
  loadingScreen({this.searchedCity});
  final searchedCity;

  @override
  _loadingScreenState createState() => _loadingScreenState();
}

class _loadingScreenState extends State<loadingScreen> {
  @override
  void initState() {
    super.initState();
    getInitialData();
  }

  void getInitialData() async {
    var weatherData = await netWorking().getData(widget.searchedCity ??
        'singapore'); //if searchedCity is null, we will use the default singapore
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherPage(
        weatherFromLoad: weatherData,
        searchedCity: widget.searchedCity,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: kBackgroundImage,
            child: Center(
                child: SpinKitChasingDots(color: Colors.white, size: 100.0))));
  }
}
