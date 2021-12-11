import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_doctor/core/helper/extensions.dart';
import 'package:hospital_doctor/core/helper/images.dart';
import 'package:hospital_doctor/core/helper/widget_ext.dart';
import 'package:hospital_doctor/core/style/border_radiuses.dart';
import 'package:hospital_doctor/core/style/colors.dart';
import 'package:hospital_doctor/core/style/paddings.dart';
import 'package:hospital_doctor/core/style/text_styles.dart';

class BasicOutlinedTextfield extends StatefulWidget {
  const BasicOutlinedTextfield({
    required this.controller,
    required this.hint,
    this.label,
    this.inputFormatters,
    this.keyboardType,
    this.prefix,
    this.textInputAction,
    this.autofillHints,
    this.validator,
    this.onChanged,
    this.autocorrect = false,
    this.obscure = false,
    this.showObscureSwitch = false,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final String? label;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final bool autocorrect;
  final bool obscure;
  final bool showObscureSwitch;

  @override
  State<StatefulWidget> createState() => _BasicOutlinedTextfieldState();
}

class _BasicOutlinedTextfieldState extends State<BasicOutlinedTextfield> {
  late bool _obscure;

  @override
  void initState() {
    _obscure = widget.obscure;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          controller: widget.controller,
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          autofillHints: widget.autofillHints,
          validator: widget.validator,
          onChanged: widget.onChanged,
          autocorrect: widget.autocorrect,
          obscureText: _obscure,
          style: roboto.s16.blackColor,
          decoration: InputDecoration(
            hintText: widget.hint,
            labelText: widget.label,
            border: const OutlineInputBorder(
              borderRadius: BorderRadiuses.all12,
              borderSide: BorderSide(color: CustomColors.blue, width: 2.0),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadiuses.all12,
              borderSide: BorderSide(color: CustomColors.blue, width: 2.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadiuses.all12,
              borderSide: BorderSide(color: CustomColors.grey, width: 2.0),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: widget.prefix,
            suffix: widget.showObscureSwitch ? const SizedBox(width: 40.0) : null,
          ),
        ),
        if (widget.showObscureSwitch)
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: Paddings.horizontal20.overrideZeros(const EdgeInsets.only(top: 20.0)),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _obscure = !_obscure;
                  });
                },
                child: SvgPicture.asset(
                  SvgIcons.eye,
                  color: CustomColors.black,
                  height: 18.0,
                ),
              ).noSplash(),
            ),
          ),
      ],
    );
  }
}
