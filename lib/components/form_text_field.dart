import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormTextField extends StatefulWidget {
  final String labelText;
  final bool isSecret;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;

  const FormTextField({
    super.key,
    this.isSecret = false,
    this.validator,
    required this.labelText,
    this.controller,
    this.inputFormatters,
    this.textInputType
  });

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  bool hidePassword = false;

  @override
  void initState() {
    super.initState();
    hidePassword = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        keyboardType: widget.textInputType,
        inputFormatters: widget.inputFormatters,
        controller: widget.controller,
        validator: widget.validator,
        obscureText: hidePassword,
        decoration: InputDecoration(
            suffixIcon: widget.isSecret ? IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
              icon: Icon(hidePassword ? Icons.visibility : Icons.visibility_off),
            ) : null,
            fillColor: const Color(0xffEDEEF2),
            filled: true,
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            labelText: widget.labelText.toString(),
            labelStyle: const TextStyle(
              color: Color(0xAA363B53),
            )
        ),
      ),
    );
  }
}
