import 'package:flutter/material.dart';

class NoteFormWidget extends StatelessWidget {
  final String? title;
  final String? text;
  final bool? isImportant;
  final DateTime? date;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedText;
  final ValueChanged<bool> onChangedImportant;
  final ValueChanged<DateTime> onChangedDate;

  const NoteFormWidget({
    Key? key,
    this.title = '',
    this.text = '',
    this.isImportant = false,
    required this.date,
    required this.onChangedTitle,
    required this.onChangedText,
    required this.onChangedImportant,
    required this.onChangedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTitle(context),
          const Divider(),
          buildText(context),
          const SizedBox(height: 16),
        ],
      ),
    ),
  );

  Widget buildTitle(BuildContext context) => TextFormField(
    keyboardType: TextInputType.multiline,
    maxLines: null,
    initialValue: title,
    style: Theme.of(context).textTheme.headline4,
    decoration: const InputDecoration(
      border: InputBorder.none,
      hintText: 'Title',
    ),
    validator: (title) =>
    title != null && title.isEmpty ? 'The title cannot be empty' : null,
    onChanged: onChangedTitle,
  );

  Widget buildText(BuildContext context) => TextFormField(
    keyboardType: TextInputType.multiline,
    maxLines: null,
    initialValue: text,
    style: Theme.of(context).textTheme.bodyText1,
    decoration: const InputDecoration(
      border: InputBorder.none,
      hintText: 'Type something...',
    ),
    validator: (title) => title != null && title.isEmpty
        ? 'The description cannot be empty'
        : null,
    onChanged: onChangedText,
  );
}