import 'package:flutter/material.dart';

class CustomCheckListTile extends StatefulWidget {
  final String taskLabel;

  const CustomCheckListTile({
    super.key,
    required this.taskLabel
  });

  @override
  State<CustomCheckListTile> createState() => _CustomCheckListTileState();
}

class _CustomCheckListTileState extends State<CustomCheckListTile> {
  bool _isChecked = false;

  void toggle() {
    setState(() {
      _isChecked = !_isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.taskLabel),
      controlAffinity: ListTileControlAffinity.leading,
      value: _isChecked,
      onChanged: (bool? value) {
        toggle();
      },
    );
  }
}
