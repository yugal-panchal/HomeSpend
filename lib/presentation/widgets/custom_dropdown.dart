import 'package:flutter/material.dart';
import 'package:home_spend/utils/dimensions.dart';
import 'package:home_spend/utils/styles.dart';

class CustomDropdown extends StatelessWidget {
  final String title;
  final List<String> options;
  final ValueChanged<String?>? onSelect;
  final String? selectedValue;
  const CustomDropdown({
    required this.title,
    required this.onSelect,
    required this.options,
    required this.selectedValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: mediumStyle),
        SizedBox(height: Dimensions.paddingSizeSmall),
        DropdownMenu(
          dropdownMenuEntries: options
              .map((option) => DropdownMenuEntry(value: option, label: option))
              .toList(),
          hintText: "Please select $title",
          onSelected: onSelect,
          initialSelection: selectedValue,
        ),
      ],
    );
  }
}
