import 'dart:ffi';

import 'package:exploring_widgets/app_screens/favourite_city.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SimpleInterestCalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SimpleInterestCalculatorState();
  }
}

class _SimpleInterestCalculatorState extends State {
  String appBarTitle = 'Simple Interest Calculator';
  var currencies = ['Rupee', 'Dollar', 'Yuan', 'Dinar', 'others'];
  var _formKey = GlobalKey<FormState>();
  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();
  String selectedCurrency = '';
  String result = '';

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context).textTheme.title;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Form(
        // color: Colors.blueGrey,
        // padding: EdgeInsets.all(20),
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Image(
                  image: AssetImage('images/taxation.png'),
                  alignment: Alignment.center,
                  width: 200,
                  height: 150,
                ),
              ),
              TextFormField(
                // keyboardType: TextInputType.number,
                style: style,
                controller: principalController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some amount';
                  } else if (!double.parse(value).isFinite) {
                    return 'Please enter a valid amount';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Principal',
                    hintText: 'Enter amount eg 12000',
                    errorStyle:
                        TextStyle(color: Colors.deepOrange, fontSize: 13),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextFormField(
                  style: style,
                  // keyboardType: TextInputType.number,
                  controller: roiController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter rate of interest';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Rate of Interest',
                      hintText: 'Enter amount eg 12000',
                      errorStyle:
                          TextStyle(color: Colors.deepOrange, fontSize: 13),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    style: style,
                    // keyboardType: TextInputType.number,
                    controller: termController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter term';
                      }
                    },
                    decoration: InputDecoration(
                        errorStyle:
                            TextStyle(color: Colors.deepOrange, fontSize: 13),
                        labelText: 'Term',
                        hintText: '',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  )),
                  Expanded(child: FavouriteCity())
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                      child: Text(
                        'Calculate',
                        style: style,
                      ),
                      onPressed: () {
                        setState(() {
                          if (_formKey.currentState.validate()) {
                            var si = calculateSI();
                            result = '$si';
                          }
                        });
                      },
                      color: Theme.of(context).accentColor,
                      textColor: Theme.of(context).primaryColorDark,
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      child: Text(
                        'Reset',
                        style: TextStyle(fontSize: 15),
                      ),
                      onPressed: () {
                        setState(() {
                          principalController.text = '';
                          roiController.text = '';
                          termController.text = '';
                        });
                      },
                      color: Colors.black54,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  '$result',
                  style: TextStyle(color: Colors.green, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  double calculateSI() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);
    return principal + principal * roi * term / 100;
  }
}
