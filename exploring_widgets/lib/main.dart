import 'package:exploring_widgets/app_screens/favourite_city.dart';
import 'package:exploring_widgets/app_screens/home.dart';
import 'package:exploring_widgets/app_screens/interest_calculator.dart';
import 'package:exploring_widgets/app_screens/note_details.dart';
import 'package:exploring_widgets/app_screens/note_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      // primaryColor: Colors.indigo,
      // accentColor: Colors.indigoAccent,
      primarySwatch: Colors.deepPurple,
      fontFamily: 'Raleway',
      // brightness: Brightness.dark
    ),
    title: 'Notes', home: NoteList(),
    // home: Scaffold(
    //   appBar: AppBar(
    //     title: Text(
    //       'Flights',
    //       style: TextStyle(color: Colors.amber),
    //     ),
    //   ),
    //   body: Scaffold(
    //     // body: getList(),
    //     body: getLongList(),
    //     floatingActionButton: FloatingActionButton(
    //       child: Icon(Icons.add),
    //       tooltip: 'Add one more item',
    //       onPressed: () {
    //         debugPrint('FAB clicked');
    //       },
    //     ),
    //   ),
    // ),
  ));
}

// SnackBar
void showSnackBar(BuildContext context, String item) {
  var snackBar = SnackBar(
    content: Text('You have tapped item $item'),
    action: SnackBarAction(
        label: 'UNDO',
        onPressed: () {
          debugPrint('Performing Dummy UNDO operation');
        }),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}

// Long ListView
List<String> getListData() {
  return List<String>.generate(1000, (index) => "Item $index");
}

Widget getLongList() {
  var listItems = getListData();
  return ListView.builder(itemBuilder: (context, index) {
    print("loading Item $index");
    return ListTile(
      leading: Icon(Icons.arrow_right),
      title: Text(listItems[index]),
      onTap: () {
        // print("${listItems[index]} is tapped");
        showSnackBar(context, listItems[index]);
      },
    );
  });
}

// Basic ListView
Widget getList() {
  return ListView(
    children: [
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text('Landscape'),
        subtitle: Text('Beautfiful scenary'),
        trailing: Icon(Icons.wb_sunny),
      ),
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text('Landscape'),
        subtitle: Text('Beautfiful scenary'),
        trailing: Icon(Icons.wb_sunny),
      ),
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text('Landscape'),
        subtitle: Text('Beautfiful scenary'),
        trailing: Icon(Icons.wb_sunny),
      ),
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text('Landscape'),
        subtitle: Text('Beautfiful scenary'),
        trailing: Icon(Icons.wb_sunny),
      ),
      Text(
        'Random text',
      ),
      Container(
        color: Colors.amber,
      ),
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text('Landscape'),
        subtitle: Text('Beautfiful scenary'),
        trailing: Icon(Icons.wb_sunny),
      ),
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text('Landscape'),
        subtitle: Text('Beautfiful scenary'),
        trailing: Icon(Icons.wb_sunny),
      ),
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text('Landscape'),
        subtitle: Text('Beautfiful scenary'),
        trailing: Icon(Icons.wb_sunny),
      ),
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text('Landscape'),
        subtitle: Text('Beautfiful scenary'),
        trailing: Icon(Icons.wb_sunny),
      ),
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text('Landscape'),
        subtitle: Text('Beautfiful scenary'),
        trailing: Icon(Icons.wb_sunny),
      ),
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text('Landscape'),
        subtitle: Text('Beautfiful scenary'),
        trailing: Icon(Icons.wb_sunny),
      ),
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text('Landscape'),
        subtitle: Text('Beautfiful scenary'),
        trailing: Icon(Icons.wb_sunny),
      ),
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text('Landscape'),
        subtitle: Text('Beautfiful scenary'),
        trailing: Icon(Icons.wb_sunny),
      ),
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text('Landscape'),
        subtitle: Text('Beautfiful scenary'),
        trailing: Icon(Icons.wb_sunny),
      ),
    ],
  );
}
