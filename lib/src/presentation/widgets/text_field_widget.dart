import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/assets/assets.gen.dart';
import '../../core/config/constant.dart';
import '../../core/config/theme_colors.dart';

class FormTextLabel extends StatelessWidget {
  const FormTextLabel({
    Key? key,
    required this.label,
    this.labelColor,
    this.mandatory = false,
  }) : super(key: key);

  final String label;
  final Color? labelColor;
  final bool mandatory;

  @override
  Widget build(BuildContext context) {
    if (mandatory) {
      return Text.rich(
        TextSpan(
          text: label,
          children: const [
            TextSpan(text: '*', style: TextStyle(color: Colors.red)),
          ],
        ),
        style: TextStyle(
          fontSize: 12,
          color: labelColor ?? Theme.of(context).primaryColor,
        ),
      );
    }

    return Text(
      label,
      style: TextStyle(
        fontSize: 12,
        color: labelColor ?? Theme.of(context).primaryColor,
      ),
    );
  }
}

class FormzTextField extends StatelessWidget {
  const FormzTextField({
    Key? key,
    this.hintText,
    this.leading,
    this.leadingText,
    this.trailing,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.autofocus = false,
    this.textEditingController,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.errorText,
    this.style,
    this.maxLines = 1,
    this.minLines,
    this.inputFormatters,
    this.maxLength,
    this.errorMaxLines,
    this.textAlign = TextAlign.start,
    this.contentPadding,
  }) : super(key: key);

  final String? hintText;
  final String? errorText;
  final Widget? leading;
  final String? leadingText;
  final Widget? trailing;
  final bool obscureText;
  final bool readOnly;
  final bool enabled;
  final bool autofocus;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final TextStyle? style;
  final int? maxLines;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? errorMaxLines;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      obscureText: obscureText,
      readOnly: readOnly,
      enabled: enabled,
      autofocus: autofocus,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        // ignore: prefer_const_constructors
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: const BorderSide(color: Colors.black12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: const BorderSide(color: themeFontDefault),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Theme.of(context).errorColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: ThemeColors.neutral5),
        ),
        // constraints: const BoxConstraints(maxHeight: 48),
        contentPadding:
            contentPadding ?? const EdgeInsets.fromLTRB(12, 8, 12, 8),
        fillColor: !enabled ? ThemeColors.neutral2 : Colors.white,
        filled: true,
        prefixIcon: leading,
        prefixText: leadingText,
        suffixIcon: trailing,
        hintText: hintText,

        hintStyle: const TextStyle(
            color: ThemeColors.greyCaption, fontStyle: FontStyle.italic),
        errorText: errorText,
        errorMaxLines: errorMaxLines,
        errorStyle: errorText != null && errorText!.isEmpty
            ? const TextStyle(fontSize: 0, height: 0)
            : null,
      ),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onTap: onTap,
      style: style ?? const TextStyle(fontSize: 12),
      maxLines: maxLines,
      minLines: minLines,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      buildCounter: maxLength == null
          ? null
          : (
              BuildContext context, {
              required int currentLength,
              required bool isFocused,
              int? maxLength,
            }) =>
              const SizedBox.shrink(),
      textAlign: textAlign,
    );
  }
}

class FormzDropDownField extends StatelessWidget {
  const FormzDropDownField({
    Key? key,
    this.hintText,
    this.leading,
    this.leadingText,
    this.trailing,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.autofocus = false,
    this.textEditingController,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.errorText,
    this.style,
    this.maxLines = 1,
    this.minLines,
    this.inputFormatters,
    this.maxLength,
    this.errorMaxLines,
    this.textAlign = TextAlign.start,
    this.contentPadding,
    this.inputItems,
    this.onSelectedValue,
    required this.daftarString,
    this.currentSelectedValue,
    this.blocCallback,
    required this.typeDropdown,
  }) : super(key: key);

  final String? hintText;
  final String? errorText;
  final Widget? leading;
  final String? leadingText;
  final Widget? trailing;
  final bool obscureText;
  final bool readOnly;
  final bool enabled;
  final bool autofocus;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final TextStyle? style;
  final int? maxLines;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;
  final List<DropdownMenuItem>? inputItems;
  final Function(dynamic)? onSelectedValue;
  final int? maxLength;
  final int? errorMaxLines;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final List<String> daftarString;
  final String? currentSelectedValue;
  final VoidCallback? blocCallback;
  final String typeDropdown;

  @override
  Widget build(BuildContext context) {
    String? selValue = currentSelectedValue;

    final ValueNotifier<List<String>> _listNotifier =
        ValueNotifier<List<String>>(daftarString);

    return ValueListenableBuilder(
      valueListenable: _listNotifier,
      builder: (context, value, child) {
        return Container(
          child: FormField(
            builder: (field) {
              return InputDecorator(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    // ignore: prefer_const_constructors
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: const BorderSide(color: themeFontDefault),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(color: Theme.of(context).errorColor),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColorDark),
                    ),
                    // constraints: const BoxConstraints(maxHeight: 48),
                    contentPadding: contentPadding ??
                        const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      hint: Text(
                        hintText!,
                        style: TextStyle(
                            fontSize: 12, fontStyle: FontStyle.italic),
                      ),
                      value: selValue,
                      icon: ImageIcon(
                        AssetImage(Assets.icons.arrowDownCircle.path),
                        color: ThemeColors.navy6,
                      ),
                      isDense: true,
                      onChanged: (value) {
                        print("CHANGED : $value");
                        switch (typeDropdown) {
                          default:
                        }
                      },
                      items: value.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ));
            },
          ),
        );
      },
    );
  }
}

class SearchFieldBar extends StatelessWidget {
  const SearchFieldBar({
    Key? key,
    required this.hintText,
    this.autoFocus = false,
    this.readOnly = false,
    this.controller,
    this.onSubmitted,
    this.onChanged,
    this.onTap,
    this.trailing,
    this.fillColor = Colors.white,
  }) : super(key: key);

  final String hintText;
  final bool autoFocus;
  final bool readOnly;
  final Color fillColor;
  final TextEditingController? controller;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ThemeColors.grey5.withOpacity(0.75),
            blurRadius: 6,
            offset: Offset.zero,
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: TextField(
        controller: controller,
        autofocus: autoFocus,
        readOnly: readOnly,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide.none,
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 48),
          hintText: hintText,
          hintStyle: const TextStyle(height: 1.5, color: ThemeColors.grey4),
          suffixIcon: trailing ??
              Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: const Icon(
                  Icons.search,
                  size: 18,
                  color: Colors.white,
                ),
              ),
          suffixIconConstraints:
              const BoxConstraints(minWidth: 40, minHeight: 40),
          filled: true,
          fillColor: fillColor,
          isCollapsed: true,
          contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        ),
        textInputAction: TextInputAction.search,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        onTap: onTap,
      ),
    );
  }
}

class SearchFieldGrayBar extends StatelessWidget {
  const SearchFieldGrayBar({
    Key? key,
    required this.hintText,
    this.autoFocus = false,
    this.readOnly = false,
    this.controller,
    this.onSubmitted,
    this.onChanged,
    this.onTap,
    this.trailing,
    this.fillColor = Colors.white,
  }) : super(key: key);

  final String hintText;
  final bool autoFocus;
  final bool readOnly;
  final Color fillColor;
  final TextEditingController? controller;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        autofocus: autoFocus,
        readOnly: readOnly,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none,
          ),
          prefixIconConstraints:
              const BoxConstraints(minWidth: 40, minHeight: 40),
          hintText: hintText,
          hintStyle: const TextStyle(
              fontSize: 12,
              color: ThemeColors.greyCaption,
              fontStyle: FontStyle.italic),
          prefixIcon: trailing ??
              Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: const Icon(
                  Icons.search,
                  size: 14,
                  color: ThemeColors.greyCaption,
                ),
              ),
          filled: true,
          fillColor: fillColor,
          isCollapsed: true,
          contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        ),
        textInputAction: TextInputAction.search,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        onTap: onTap,
      ),
    );
  }
}

class FormzUnderlineTextField extends StatelessWidget {
  const FormzUnderlineTextField({
    Key? key,
    this.hintText,
    this.leading,
    this.leadingText,
    this.trailing,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.autofocus = false,
    this.textEditingController,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.errorText,
    this.style,
    this.maxLines = 1,
    this.minLines,
    this.inputFormatters,
    this.maxLength,
    this.errorMaxLines,
    this.textAlign = TextAlign.start,
    this.contentPadding,
  }) : super(key: key);

  final String? hintText;
  final String? errorText;
  final Widget? leading;
  final String? leadingText;
  final Widget? trailing;
  final bool obscureText;
  final bool readOnly;
  final bool enabled;
  final bool autofocus;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final TextStyle? style;
  final int? maxLines;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? errorMaxLines;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      controller: textEditingController,
      obscureText: obscureText,
      readOnly: readOnly,
      enabled: enabled,
      autofocus: autofocus,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        // ignore: prefer_const_constructors
        enabledBorder: UnderlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: const BorderSide(color: Colors.black12),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: const BorderSide(color: themeFontDefault),
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Theme.of(context).errorColor),
        ),
        disabledBorder: UnderlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: ThemeColors.neutral5),
        ),
        // constraints: const BoxConstraints(maxHeight: 48),
        contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(0, 0, 0, 0),
        fillColor: !enabled ? ThemeColors.neutral2 : Colors.white,
        filled: true,
        prefixIcon: leading,
        prefixText: leadingText,
        suffixIcon: trailing,
        hintText: hintText,
        hintStyle: const TextStyle(
            color: ThemeColors.greyCaption, fontStyle: FontStyle.italic, fontWeight: FontWeight.w300),
        errorText: errorText,
        errorMaxLines: errorMaxLines,
        errorStyle: errorText != null && errorText!.isEmpty
            ? const TextStyle(fontSize: 0, height: 0)
            : null,
      ),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onTap: onTap,
      style: style ?? const TextStyle(fontSize: 14),
      maxLines: maxLines,
      minLines: minLines,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      buildCounter: maxLength == null
          ? null
          : (
              BuildContext context, {
              required int currentLength,
              required bool isFocused,
              int? maxLength,
            }) =>
              const SizedBox.shrink(),
      textAlign: textAlign,
    );
  }
}
