import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_pay/Theme/colors.dart';

class EntryField extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffix;
  final String? labelText;
  final String? initialValue;
  final String? formatter;
  final TextEditingController? controller;
  final TextInputType? inputType;

  EntryField(
    this.hintText,
    this.suffix, {
    this.prefixIcon,
    this.labelText,
    this.initialValue,
    this.controller,
    this.formatter,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(color: hintColor, fontSize: 18),
        suffixIcon: suffix,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: hintColor!),
        ),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[$formatter]')),
      ],
    );
  }
}
