import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mentorando/provider/sprint_tasks_provider.dart';

class CustomCheckListTile extends ConsumerStatefulWidget  {
  final String taskLabel;

  const CustomCheckListTile({
    super.key,
    required this.taskLabel
  });

  @override
  _CustomCheckListTileState createState() => _CustomCheckListTileState();
}

class _CustomCheckListTileState extends ConsumerState<CustomCheckListTile> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(twoIntsProvider.notifier).incrementInt1());
  }

  void toggle() {
    setState(() {
      _isChecked = !_isChecked;

      if (_isChecked) {
        ref.read(twoIntsProvider.notifier).incrementInt2();
      } else {
        ref.read(twoIntsProvider.notifier).decrementInt2();
      }
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
