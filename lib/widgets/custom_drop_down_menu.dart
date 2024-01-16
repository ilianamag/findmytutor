import 'package:flutter/material.dart';
//import 'package:login/widgets/custom_text_form_field.dart';
import 'package:login/core/app_export.dart';

ValueNotifier<bool> suffixPressedNotifier = ValueNotifier<bool>(false);

class CustomDropDownList extends StatefulWidget {
  const CustomDropDownList({
    Key? key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = false,
    this.itemList,
  }) : super(key: key);

  final Alignment? alignment;

  final double? width;

  final TextEditingController? scrollPadding;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final List<String>? itemList;

  @override
  State<CustomDropDownList> createState() => _CustomDropDownListState();
}

class _CustomDropDownListState extends State<CustomDropDownList> {
  String? selectedValue;
  late TextEditingController _textFieldController;
  

  @override
  void initState() {
    super.initState();
    _textFieldController = widget.controller ?? TextEditingController();
  }

  Future<void> _showDropDownMenu(BuildContext context) async {
    if (widget.itemList == null || widget.itemList!.isEmpty) {
      return;
    }

    final RenderBox textFieldRenderBox =
        context.findRenderObject() as RenderBox;

    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        textFieldRenderBox.localToGlobal(Offset.zero).dx,
        textFieldRenderBox.localToGlobal(Offset.zero).dy +
            textFieldRenderBox.size.height,
        textFieldRenderBox.localToGlobal(Offset.zero).dx +
            textFieldRenderBox.size.width,
        textFieldRenderBox.localToGlobal(Offset.zero).dy +
            textFieldRenderBox.size.height * 2,
      ),
      items: widget.itemList?.map((item) {
        return PopupMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList() ??
          [],
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedValue = value as String?;
          _textFieldController.text = value as String? ?? '';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.alignment != null
        ? Align(
            alignment: widget.alignment ?? Alignment.center,
            child: customDropDownWidget(context),
          )
        : customDropDownWidget(context);
  }

   Widget customDropDownWidget(BuildContext context) => CustomTextField(
      width: widget.width,
      hintText: widget.hintText,
      prefix: widget.prefix,
      suffix: widget.suffix,
      controller: widget.controller,
      onTapSuffix: () {
        // Set suffixPressed to true when the suffix icon is pressed
        suffixPressedNotifier.value = true;
        _showDropDownMenu(context);
      },
    );
}

class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = false,
    this.validator,
    this.onTapSuffix
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? width;

  final TextEditingController? scrollPadding;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  final VoidCallback? onTapSuffix;

  @override
  State<CustomTextField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return widget.alignment != null
        ? Align(
            alignment: widget.alignment ?? Alignment.center,
            child: textFormFieldWidget(context),
          )
        : textFormFieldWidget(context);
  }

  Widget textFormFieldWidget(BuildContext context) => SizedBox(
        width: widget.width ?? double.maxFinite,
        child: TextField(
          readOnly: true,
          scrollPadding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          controller: widget.controller,
          focusNode: widget.focusNode ?? FocusNode(),
          autofocus: widget.autofocus!,
          style: widget.textStyle,
          obscureText: widget.obscureText!,
          textInputAction: widget.textInputAction,
          keyboardType: widget.textInputType,
          maxLines: widget.maxLines ?? 1,
          decoration: decoration,
        ),
      );

  InputDecoration get decoration => InputDecoration(
        hintText: widget.hintText ?? "",
        hintStyle: widget.hintStyle,
        prefixIcon: widget.prefix,
        prefixIconConstraints: widget.prefixConstraints,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              if (widget.onTapSuffix != null) {
                widget.onTapSuffix!();
              }
            });
            print('pressed');
          },
          child: widget.suffix,
        ),
        suffixIconConstraints: widget.suffixConstraints,
        isDense: true,
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 18.v,
            ),
        fillColor: widget.fillColor,
        filled: widget.filled,
        border: widget.borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.h),
              borderSide: BorderSide(
                color: appTheme.gray900,
                width: 1,
              ),
            ),
        enabledBorder: widget.borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.h),
              borderSide: BorderSide(
                color: appTheme.gray900,
                width: 1,
              ),
            ),
        focusedBorder: widget.borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.h),
              borderSide: BorderSide(
                color: appTheme.black900,
                width: 1,
              ),
            ),
      );
}
