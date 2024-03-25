import 'package:design/shared/constants.dart';
import 'package:design/shared/form_label.dart';
import 'package:flutter/material.dart';

class CustomFormInput extends StatefulWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String? hintText;
  final int? maxLength;
  final TextInputType? keyBoardType;
  final String? label;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final bool isReadOnly;
  final int maxLines;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final double padding;
  final double? width;

  const CustomFormInput(
      {super.key,
      this.controller,
      this.initialValue,
      this.prefixIcon,
      this.onSaved,
      this.hintText,
      this.isReadOnly = false,
      this.maxLines = 1,
      this.maxLength,
      this.validator,
      this.keyBoardType = TextInputType.text,
      this.onChanged,
      this.onTap,
      this.suffix,
      this.padding = 22,
      this.width,
      this.suffixIcon,
      this.label});

  @override
  State<CustomFormInput> createState() => _CustomFormInputState();
}

class _CustomFormInputState extends State<CustomFormInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        padding: EdgeInsets.only(bottom: widget.padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (widget.label != null) FormLabel(text: widget.label!),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: const TextStyle(
                color: Color(0xff1C2035),
              ),
              maxLines: widget.maxLines,
              onTap: widget.onTap,
              validator: widget.validator,
              controller: widget.controller,
              keyboardType: widget.keyBoardType,
              onSaved: widget.onSaved,
              initialValue: widget.initialValue,
              maxLength: widget.maxLength,
              onChanged: widget.onChanged,
              readOnly: widget.isReadOnly,
              decoration: InputDecoration(
                suffixIcon: widget.suffixIcon,
                suffix: widget.suffix,
                fillColor: ThemeColors.inputColor,
                filled: true,
                hintText: widget.hintText,
                prefixIcon: widget.prefixIcon,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2,
                    color: Color.fromARGB(59, 158, 158, 158),
                  ),
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2,
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2,
                    color: Color.fromARGB(59, 158, 158, 158),
                  ),
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
