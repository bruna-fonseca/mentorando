import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
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
