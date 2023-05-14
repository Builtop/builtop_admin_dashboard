import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppTextTrans extends StatefulWidget {
  final Map<String, String> data;
  final void Function(Map<String, String>) onChangedEx;
  final List<TextInputFormatter>? formatters;
  final AutovalidateMode? autovalidateMode;

  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final String? regExp;
  final String? validateMessage;
  final double? labelSize;

  final TextInputType? keyboardType;
  final String? labelText;
  final String? description;
  final bool isRequired;
  final bool labelInHeader;
  final bool obscureText;
  final bool autoFocus;
  final int? maxLines;
  final int? minLines;
  final FocusNode? focusNode;
  final TextDirection? textDirection;
  final TextStyle? textStyle;
  final bool? enabled;
  final InputDecoration? decoration;

  const AppTextTrans(
      {required this.data,
      required this.onChangedEx,
      this.formatters,
      this.autovalidateMode,
      this.textDirection,
      this.obscureText = false,
      this.textInputAction,
      this.keyboardType,
      this.focusNode,
      this.validator,
      this.isRequired = false,
      this.validateMessage,
      this.regExp,
      this.maxLines,
      this.minLines,
      this.autoFocus = false,
      this.labelInHeader = false,
      this.enabled,
      this.textStyle,
      this.labelSize,
      this.decoration,
      this.description,
      this.labelText,
      super.key});

  @override
  State<AppTextTrans> createState() => _AppTextTransState();
}

class _AppTextTransState extends State<AppTextTrans> {
  List<Map<String, dynamic>> myOptions = [
    {"label": 'en', 'isSelected': true},
    {"label": 'ar', 'isSelected': false},
  ];

  String? _selectedLang;

  Map<String, String>? _controllerData;

  var textEdittingController = TextEditingController();

  @override
  void initState() {
    for (var option in myOptions) {
      _controllerData ??= {};
      _controllerData?[option['label'] ?? ''] = '';
    }
    _selectedLang = myOptions.first['label'];

    if (widget.data.isNotEmpty) {
      _controllerData = widget.data;
      textEdittingController.text = _controllerData?[_selectedLang] ?? '';
      textEdittingController.selection = TextSelection.fromPosition(
          TextPosition(offset: textEdittingController.text.length));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        !widget.labelInHeader
            ? const SizedBox()
            : Row(
                children: [
                  Text('${widget.labelText} ${widget.isRequired ? '*' : ''}',
                      style: TextStyle(fontSize: widget.labelSize)),
                  const SizedBox(
                    width: 10,
                  ),
                  toggleBtnsWidget()
                ],
              ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextFormField(
                inputFormatters: widget.formatters,
                autovalidateMode: widget.autovalidateMode,
                textDirection: widget.textDirection,
                enableInteractiveSelection: !widget.obscureText,
                textInputAction: widget.textInputAction,
                keyboardType: widget.keyboardType,
                controller: textEdittingController,
                onChanged: (v) {
                  _controllerData?[_selectedLang ?? ''] =
                      textEdittingController.text;
                  widget.onChangedEx(_controllerData ?? {});
                },
                focusNode: widget.focusNode,
                validator: widget.validator ??
                    (val) {
                      if (val == null || val.isEmpty)
                        return widget.isRequired
                            ? widget.validateMessage ?? 'Required'
                            : null;
                      if (widget.regExp == null) return null;
                      if (!RegExp(widget.regExp!).hasMatch(val)) {
                        return widget.validateMessage ?? 'Error';
                      }
                    },
                maxLines: widget.maxLines,
                minLines: widget.minLines,
                autofocus: widget.autoFocus,
                enabled: widget.enabled,
                style: widget.textStyle,
                enableSuggestions: true,
                decoration: widget.decoration?.copyWith(
                      labelText: widget.labelInHeader
                          ? null
                          : widget.isRequired
                              ? '${widget.labelText}*'
                              : widget.labelText,
                      helperText: widget.description,
                      labelStyle: TextStyle(fontSize: widget.labelSize),
                    ) ??
                    InputDecoration(
                      helperText: widget.description,
                      labelText: widget.labelInHeader
                          ? null
                          : widget.isRequired
                              ? '${widget.labelText}*'
                              : widget.labelText,
                      labelStyle: TextStyle(fontSize: widget.labelSize),
                    ),
              ),
            ),
            !widget.labelInHeader
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: toggleBtnsWidget(),
                  )
                : const SizedBox()
          ],
        ),
      ],
    );
  }

  Widget toggleBtnsWidget() {
    return ToggleButtons(
      constraints: BoxConstraints(
        minHeight: 30,
        minWidth: 30,
      ),
      direction: (((widget.maxLines ?? 0) > 1) && (!widget.labelInHeader))
          ? Axis.vertical
          : Axis.horizontal,
      // color: Colors.white,
      selectedColor: Colors.white,
      fillColor: Colors.green,
      children: myOptions
          .map((e) => Text(
                e['label'].toString(),
              ))
          .toList(),
      isSelected: myOptions.map((e) => (e['isSelected']) as bool).toList(),
      onPressed: (int index) {
        setState(() {
          if (myOptions[index]['isSelected'] == true) return;

          for (var option in myOptions) {
            option['isSelected'] = false;
          }

          myOptions[index]['isSelected'] =
              !(myOptions[index]['isSelected'] as bool);
          _selectedLang = (myOptions[index]['label'] as String);

          textEdittingController.text =
              _controllerData?[_selectedLang] ?? 'No Data';
          textEdittingController.selection = TextSelection.fromPosition(
              TextPosition(offset: textEdittingController.text.length));
        });
      },
    );
  }
}
