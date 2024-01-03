import 'package:chat_ui_demo/values/string_constatnt.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/utils/typedefs.dart';
import 'package:flutter/material.dart';

class CountryPicker extends StatefulWidget {
  final double? titlePadding;
  final Color? searchCursorColor;
  final Decoration? searchInputDecoration;
  final Function(Country)? onValuePicked;
  final List<Country>? priorityList;
  final bool? isSearchable;
  final Text? text;
  final ItemBuilder? itemBuilder;
  const CountryPicker({
    Key? key,
    this.titlePadding,
    this.searchCursorColor,
    this.searchInputDecoration,
    this.onValuePicked,
    this.priorityList,
    this.isSearchable = true,
    this.text,
    this.itemBuilder,
  }) : super(key: key);

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  @override
  Widget build(BuildContext context) {
    return CountryPickerDialog(
      titlePadding: EdgeInsets.all(widget.titlePadding != null ? 0 : 8),
      searchCursorColor: widget.searchCursorColor != null
          ? Colors.lightBlueAccent
          : Colors.white,
      searchInputDecoration: widget.searchInputDecoration != null
          ? null
          : const InputDecoration(hintText: StringConstant.search),
      isSearchable: widget.isSearchable!,
      title: widget.text != null ? null : const Text(StringConstant.select),
      onValuePicked: widget.onValuePicked!,
      priorityList: widget.priorityList,
      itemBuilder: widget.itemBuilder != null ? null : _buildDialogItem,
    );
  }

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          const SizedBox(width: 8.0),
          Text("+${country.phoneCode}"),
          const SizedBox(width: 8.0),
          Flexible(child: Text(country.name))
        ],
      );
}
