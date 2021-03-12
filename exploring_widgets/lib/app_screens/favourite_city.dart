import 'package:flutter/material.dart';

class FavouriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FavouriteCityState();
  }
}

class _FavouriteCityState extends State<FavouriteCity> {
  String cityName = '';
  var _currencies = ['Rupee', 'Dollar', 'Yuan', 'Dinar', 'others'];
  var selectedCurrency = 'Rupee';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
        // Scaffold(
        // appBar: AppBar(
        // title: Text('Stateful Widget Example'),
        // ),
        // body:
        Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          // TextField(
          //   // Is called when any key is pressed
          //   onChanged: (text) {
          //     setState(() {
          //       cityName = text;
          //     });
          //   },
          //   // Is called when done button is tapped
          //   onSubmitted: (inputText) {
          //     setState(() {
          //       cityName = inputText;
          //     });
          //   },
          // ),
          DropdownButton<String>(
            items: _currencies.map((text) {
              return DropdownMenuItem<String>(value: text, child: Text(text));
            }).toList(),
            onChanged: (newText) {
              setState(() {
                selectedCurrency = newText;
              });
            },
            value: selectedCurrency,
          ),
          // Padding(
          //   padding: EdgeInsets.all(20),
          //   child: Text('Your best city is $cityName'),
          // ),
        ],
      ),
    );
    // );
  }
}
