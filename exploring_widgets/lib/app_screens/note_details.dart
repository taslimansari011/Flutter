import 'package:exploring_widgets/model/note.dart';
import 'package:exploring_widgets/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteDetails extends StatefulWidget {
  final Note note;
  final String appBarTitle;

  NoteDetails(this.note, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteDetailsState(note, appBarTitle);
  }
}

class NoteDetailsState extends State<NoteDetails> {
  var priorities = ['High', 'Low'];
  var selectedPriority = 'Low';
  var titleController = TextEditingController();
  var detailsController = TextEditingController();
  String appBarTitle;
  Note note;
  DataBaseHelper dbHelper = DataBaseHelper();

  NoteDetailsState(this.note, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    titleController.text = note.title;
    detailsController.text = note.description;

    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text(appBarTitle),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                moveToLastScreen();
              },
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(17),
            child: ListView(
              children: [
                // Item 1
                ListTile(
                  title: DropdownButton(
                    items: priorities.map((priority) {
                      return DropdownMenuItem(
                          value: priority, child: Text(priority));
                    }).toList(),
                    value: getPriorityString(note.priority),
                    style: textStyle,
                    onChanged: (value) {
                      setState(() {
                        selectedPriority = value;
                        updatePriority(value);
                      });
                    },
                  ),
                ),

                // Title TextField
                Padding(
                  padding: EdgeInsets.all(17),
                  child: TextField(
                    controller: titleController,
                    style: textStyle,
                    onChanged: (text) {
                      updateTitle();
                    },
                    decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),

                // Description TextField
                Padding(
                  padding: EdgeInsets.all(17),
                  child: TextField(
                    controller: detailsController,
                    style: textStyle,
                    onChanged: (text) {
                      updateDesc();
                    },
                    decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),

                // Buttons
                Padding(
                  padding: EdgeInsets.all(17),
                  child: Row(
                    children: [
                      Expanded(
                          child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.2,
                        ),
                        onPressed: () {
                          _save();
                        },
                      )),
                      Container(
                        width: 5,
                      ),
                      Expanded(
                          child: RaisedButton(
                        child: Text(
                          'Delete',
                          textScaleFactor: 1.2,
                        ),
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        onPressed: () {
                          _delete();
                        },
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        onWillPop: () {
          moveToLastScreen();
        });
  }

  // Custom action on back button pressed
  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  // Get icon
  String getPriorityString(int value) {
    String priority;
    switch (value) {
      case 1:
        priority = priorities[0]; // 'High'
        break;
      case 2:
        priority = priorities[1]; // 'Low'
        break;
    }
    return priority;
  }

  updatePriority(String priority) {
    switch (priority) {
      case 'High':
        note.priority = 1;
        break;

      case 'Low':
        note.priority = 2;
        break;
    }
  }

  updateTitle() {
    note.title = titleController.text;
  }

  updateDesc() {
    note.desc = detailsController.text;
  }

  _save() async {
    int result;
    note.title = titleController.text;
    note.desc = detailsController.text;
    note.date = DateFormat.yMMMd().format(DateTime.now());
    if (note.id == null) {
      // Create
      debugPrint('Creating note');
      result = await dbHelper.insertNote(note);
    } else {
      // Update
      debugPrint('Creating note');
      result = await dbHelper.updateNote(note);
    }

    moveToLastScreen();

    if (result == 0) {
      showAlert('Status', 'Note not saved successfully');
    } else {
      showAlert('Status', 'Note saved successfully');
    }
  }

  showAlert(String title, String message) {
    AlertDialog alert = AlertDialog(title: Text(title), content: Text(message));
    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }

  _delete() async {
    moveToLastScreen();
    if (note.id == null) {
      showAlert('Alert', 'This note is not saved yet');
    } else {
      int result = await dbHelper.deleteNote(note.id);
      if (result == 0) {
        showAlert('Status', 'Note not deleted.');
      } else {
        showAlert('Status', 'Note deleted.');
      }
    }
  }
}
