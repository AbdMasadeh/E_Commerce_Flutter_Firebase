import 'package:final_project/widgets/text_field.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  SearchField({Key? key}) : super(key: key);

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      icon: const Icon(Icons.search_outlined),
      hint: "Search for any Product...",
      hideText: false,
      action: TextInputAction.done,
      valid: () {},
      sufIcon: IconButton(
        onPressed: () {},
        icon: const Icon(null),
      ),
      controller: searchController,
    );
  }
}
