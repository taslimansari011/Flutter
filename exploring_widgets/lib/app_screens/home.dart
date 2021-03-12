import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
          alignment: Alignment.center,
          color: Colors.blueGrey,
          padding: EdgeInsets.all(20),
          // width: 200,
          // height: 100,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Text(
                    'Spicejet',
                    style: TextStyle(
                        fontSize: 40,
                        decoration: TextDecoration.none,
                        fontFamily: 'Raleway',
                        color: Colors.amber),
                  )),
                  Expanded(
                      child: Text(
                    'A flight from Delhi to Banglore via Mumbai',
                    style: TextStyle(
                        fontSize: 25,
                        decoration: TextDecoration.none,
                        fontFamily: 'Raleway',
                        color: Colors.amber),
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    'AirIndia',
                    style: TextStyle(
                        fontSize: 40,
                        decoration: TextDecoration.none,
                        fontFamily: 'Raleway',
                        color: Colors.amber),
                  )),
                  Expanded(
                      child: Text(
                    'A flight from Lucknow to Nagpur via Bhopal',
                    style: TextStyle(
                        fontSize: 25,
                        decoration: TextDecoration.none,
                        fontFamily: 'Raleway',
                        color: Colors.amber),
                  ))
                ],
              ),
              FlightImage(),
              BookFlightButton()
            ],
          )),
    );
  }
}

class FlightImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = new AssetImage('images/airplane.png');
    Image image = Image(image: assetImage, width: 200, height: 200);
    return image;
  }
}

class BookFlightButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 250,
      height: 45,
      child: RaisedButton(
          child: Text(
            'Book your flight',
            style: TextStyle(fontFamily: 'Raleway', fontSize: 20),
          ),
          color: Colors.deepOrange,
          elevation: 10,
          onPressed: () {
            bookFlight(context);
          }),
    );
  }

  void bookFlight(BuildContext context) {
    var alert = AlertDialog(
      title: Text('Flight'),
      content: Text('Your flight has been successfully booked'),
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
