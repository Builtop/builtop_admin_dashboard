import 'package:builtop_admin_dashboard/services/app_config_service.dart';
import 'package:flutter/material.dart';

class CustomValidateWidget extends StatefulWidget {
  final validationField;
  final String validationMessage;
  final Widget body;
  final double? rightLeftPad;
  final double? validateFontSize;

  const CustomValidateWidget(
      {required this.validationField,
      required this.body,
      required this.validationMessage,
      this.rightLeftPad = 20,
      this.validateFontSize = 14,
      Key? key})
      : super(key: key);

  @override
  State<CustomValidateWidget> createState() => _CustomValidateWidgetState();
}

class _CustomValidateWidgetState extends State<CustomValidateWidget> {
  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      autovalidateMode: widget.validationField == null
          ? AutovalidateMode.disabled
          : AutovalidateMode.always,
      builder: (state) {
        return Column(
          children: <Widget>[
            widget.body,
            // validation Message Container
            state.errorText == null
                ? Container()
                : Container(
                    alignment: (AppConfigService.isArabic)
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: widget.rightLeftPad!,
                          top: 10,
                          left: widget.rightLeftPad!),
                      child: Text(
                        state.errorText ?? '',
                        style: TextStyle(
                          color: Theme.of(context).errorColor,
                          fontSize: widget.validateFontSize,
                        ),
                      ),
                    ),
                  )
          ],
        );
      },
      validator: (value) {
        var value = widget.validationField == null ? false : true;
        if (value) {
          return null;
        } else {
          return widget.validationMessage;
        }
      },
    );
  }
}
