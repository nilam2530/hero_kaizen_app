import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String label;
  String? hintText;
  final T? value;
  final List<T> items;
  final ValueChanged<T?> onChanged;

  CustomDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        [null,""].contains(label)?Container():Row(
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 15),
            ),
            const Text(
              '*',
              style: TextStyle(fontSize: 15, color: Colors.red),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButton<T>(
            isExpanded: true,
            value: value,
            hint: Text(hintText??'Select an option',maxLines: 1,),
            items: items.map((T item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Text(item.toString()),
              );
            }).toList(),
            onChanged: onChanged,
            underline: const SizedBox(),
          ),
        ),
      ],
    );
  }
}
