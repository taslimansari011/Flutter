import 'package:flutter/material.dart';
import 'package:exploring_widgets/model/note.dart';

class NoteDetailsAll extends StatefulWidget {
  Note note;

  NoteDetailsAll(this.note);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw NoteDetailsAllState(note);
  }
}

class NoteDetailsAllState extends State<NoteDetailsAll> {
  Note note;

  NoteDetailsAllState(this.note);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          // Title
          Text(
            note.title,
            style: textStyle,
          ),

          // Description
          Text(
            note.description,
            style: textStyle,
          )
        ],
      ),
    );
  }
}
