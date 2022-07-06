import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ValidationType {
  none,
  pulse,
  bloodPressureUpper,
  bloodPressureBottom,
  bodyTemperature,
  spo2,
  respiratory,
}

class InputField extends StatelessWidget {
  final String labelText;
  final TextEditingController editingController;
  final TextInputType inputType;
  final TextCapitalization capitalization;
  final TextInputAction inputAction;
  final Function(String) onChange;
  final bool isEnable;
  final bool isFocus;
  final double borderRadius;
  final bool isObscure;
  final bool isRequired;
  final ValidationType validationType;

  const InputField({
    Key? key,
    required this.labelText,
    required this.editingController,
    required this.onChange,
    this.inputType = TextInputType.text,
    this.capitalization = TextCapitalization.none,
    this.inputAction = TextInputAction.next,
    this.isEnable = true,
    this.isFocus = false,
    this.isObscure = false,
    this.borderRadius = 16.0,
    this.isRequired = true,
    this.validationType = ValidationType.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: editingController,
      keyboardType: inputType,
      cursorColor: Get.theme.primaryColor,
      style: Theme.of(context).textTheme.bodyText2,
      textInputAction: inputAction,
      onChanged: onChange,
      enabled: isEnable,
      maxLines: 1,
      obscureText: isObscure,
      autofocus: isFocus,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: labelText,
        labelStyle: GoogleFonts.roboto(
          fontSize: 14.0.sp,
          color: Colors.black45,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: Get.theme.primaryColor),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        return null;
      },
    );
  }
}
