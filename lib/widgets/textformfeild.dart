import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String? errorText;
  final String? labelText;
  final String? validator;
  final TextEditingController? controller;
  final bool? editable;
  final int? maxLines;
  final int? maxLenght;
  final void Function(String)? onChange;
  final Icon? icon;
  final TextInputType? keyboardType;
  final bool obscureText;

  const CustomTextFormField({
    Key? key,
    required this.maxLines,
    this.maxLenght,
    this.errorText,
    this.labelText,
    this.controller,
    this.editable,
    this.onChange,
    this.icon,
    this.keyboardType,
    required this.obscureText,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return widget.validator;
          }
          return null;
        },
        obscureText: widget.obscureText,
        maxLength: widget.maxLenght,
        maxLines: widget.maxLines,
        enabled: widget.editable,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          labelText: widget.labelText,
          prefixIcon: widget.icon,
          counterStyle: const TextStyle(
            height: double.minPositive,
          ),
          counterText: "",
          fillColor: Colors.white,
          filled: true,
          errorText: widget.errorText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              5.0,
            ),
          ),
        ),
        controller: widget.controller,
        onChanged: widget.onChange,
      ),
    );
  }
}
