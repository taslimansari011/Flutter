import 'package:exploring_widgets/app_screens/note_details.dart';
import 'package:exploring_widgets/app_screens/note_details_all.dart';
import 'package:exploring_widgets/model/note.dart';
import 'package:exploring_widgets/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  // Variables
  DataBaseHelper dbHelper = DataBaseHelper();
  List<Note> noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (noteList == null) {
      noteList = [];
      updateListView();
    }
    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      body: getListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          navigateToDetails(Note('', '', 2), 'Add Note');
        },
      ),
    );
  }

  // Helper methods
  ListView getListView() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
              color: Colors.white,
              elevation: 1,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                      getPriorityColor(noteList[position].priority),
                  child: getPriorityIcon(noteList[position].priority),
                ),
                title: Text(noteList[position].title),
                subtitle: Text(noteList[position].date),
                onTap: () {
                  navigateToDetails(noteList[position], 'Edit Note');
                },
                trailing: GestureDetector(
                  child: Icon(Icons.delete),
                  onTap: () {
                    delete(context, noteList[position]);
                  },
                ),
              ));
        });
  }

  void navigateToDetails(Note note, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetails(note, title);
    }));

    if (result == true) {
      updateListView();
    }
  }

  // Get priority color
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.yellow;
        break;

      default:
        return Colors.yellow;
    }
  }

  // Get icon
  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.play_arrow);
        break;
      case 2:
        return Icon(Icons.keyboard_arrow_right);
        break;

      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }

  delete(BuildContext context, Note note) async {
    await dbHelper.deleteNote(note.id);
    _showSnackBar(context);
    updateListView();
  }

  _showSnackBar(BuildContext context) {
    final snackbar = SnackBar(content: Text('Note is deleted successfully'));
    Scaffold.of(context).showSnackBar(snackbar);
  }

  updateListView() {
    debugPrint('Update list view');
    final Future<Database> futureDB = dbHelper.initializeDb();
    futureDB.then((database) {
      var noteListFuture = dbHelper.noteList();
      noteListFuture.then((noteList) {
        setState(() {
          debugPrint('Updating list $noteList');
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
}
