import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentorando/config/mentor_data.dart' as mentor_data;

class SearchButton extends StatefulWidget {
  final selectStack;
  const SearchButton({
    super.key,
    required this.selectStack,
  });

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  int _selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showCupertinoModalPopup(
          context: context,
          builder: (_) => SizedBox(
            width: double.infinity,
            height: 250,
            child: CupertinoPicker(
              useMagnifier: true,
              magnification: 1.22,
              backgroundColor: Colors.white,
              itemExtent: 30,
              scrollController: FixedExtentScrollController(
                initialItem: _selectedValue,
              ),
              children:  List<Widget>.generate(mentor_data.stacks.length, (int index) {
                return Center(child: Text(mentor_data.stacks[index]));
              }),
              onSelectedItemChanged: (int value) {
                  setState(() {
                    _selectedValue = value;
                    widget.selectStack(value, mentor_data.stacks);
                  });
              },
            ),
          ),
      ),
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          fixedSize: const Size(70, 70),
          backgroundColor: const Color(0xffEDEEF2),
          side: const BorderSide(style: BorderStyle.none)
      ),
      child: const Icon(
          Icons.filter_list,
          size: 32,
          color: Color(0xff363B53)
      ),
    );
  }
}
