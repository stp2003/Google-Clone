import 'package:flutter/material.dart';

import 'button_search.dart';

class SearchButtons extends StatelessWidget {
  const SearchButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            SearchButton(title: 'Google Search'),
            SizedBox(width: 10.0),
            SearchButton(title: "I'm Feeling Ucey"),
          ],
        ),
      ],
    );
  }
}
