import 'package:flutter/material.dart';
import 'loadingScreen.dart';
import 'constants.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String CityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kBackgroundImage,
        padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 15.0),
        constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child:
                    Container(child: Icon(Icons.keyboard_backspace, size: 50))),
            SizedBox(height: 100),
            Flexible(
              child: TextField(
                onChanged: (text) {
                  CityName = text.toUpperCase();
                },
                autofocus: true,
                autocorrect: true,
                textAlign: TextAlign.center,
                style: kTextFieldTextStyle,
                decoration: kTextfieldInputDecoration,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: FlatButton(
                onPressed: () {
                  //Navigator.pop(context, CityName);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return loadingScreen(searchedCity: CityName);
                  }));
                },
                child: Container(
                  child: Icon(Icons.search, size: 50),
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 20.0),
                child: Text(
                  "They say Antartica was 40° today, check it out",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 220,
            ),
            Center(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    "Just Kidding...",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'SourceSans',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
