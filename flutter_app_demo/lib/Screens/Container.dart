import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Screens/MyPopUp.dart';

class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        alignment: Alignment.center,
        color: Colors.brown,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Image(
                        image: NetworkImage(
                            'https://st2.depositphotos.com/3347209/6125/i/600/depositphotos_61250691-stock-photo-crows-in-the-forest.jpg')))
              ],
            ),
            Row(children: <Widget>[
              Expanded(
                child: Text(
                  'Taslim Ansari',
                  textDirection: TextDirection.ltr,
                  textScaleFactor: 1.5,
                  style: TextStyle(
                      fontFamily: 'YuseiMagic',
                      color: Colors.amber,
                      fontSize: 15),
                ),
              ),
              Expanded(
                child: Text(
                  'Works at Finoit',
                  textDirection: TextDirection.ltr,
                  textScaleFactor: 1.5,
                  style: TextStyle(
                      fontFamily: 'YuseiMagic',
                      color: Colors.amber,
                      fontSize: 25),
                ),
              ),
            ]),
            Row(children: <Widget>[
              Expanded(
                child: Text(
                  'Taslim Ansari',
                  textDirection: TextDirection.ltr,
                  textScaleFactor: 1.5,
                  style: TextStyle(
                      fontFamily: 'YuseiMagic',
                      color: Colors.amber,
                      fontSize: 15),
                ),
              ),
              Expanded(
                child: Text(
                  'Works at Finoit',
                  textDirection: TextDirection.ltr,
                  textScaleFactor: 1.5,
                  style: TextStyle(
                      fontFamily: 'YuseiMagic',
                      color: Colors.amber,
                      fontSize: 15),
                ),
              ),
            ]),
            Row(
              children: [Button()],
            )
          ],
        ),
        // margin: EdgeInsets.all(20),
        // margin: EdgeInsets.only(
        //     left: 50,
        //     right: 50,
        //     bottom: 20), // Used to provide padding to this container.
        padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20), // Used for placing content of this container.
        // width: 200, height: 200,
      ),
    );
  }
}

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // alignment: Alignment.center,
      margin: EdgeInsets.only(top: 20),
      color: Colors.blue,
      child: RaisedButton(
          child: Text('Press me'),
          onPressed: () {
            showPopup(context);
          }),
      width: 300,
      height: 45,
    );
  }

  void buttonPressed(BuildContext context) {
    print('Button Pressed');
    showPopup(context);
  }
}
