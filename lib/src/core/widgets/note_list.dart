import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:renode/src/core/models/note_model.dart';

import 'note_card_widget.dart';

class NoteList extends StatelessWidget {
  const NoteList({Key? key, required this.notes, required this.onTab }) : super(key: key);

  final List<Note> notes;
  final Function(Note) onTab;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      padding: const EdgeInsets.all(8),
      itemCount: notes.length,
      staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        final note = notes[index];

        return NoteCardWidget(
          note: note,
          index: index,
          onTap: () { onTab(note);},
        );
      },
    );
  }
}