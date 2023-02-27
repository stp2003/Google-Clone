import 'package:flutter/material.dart';
import 'package:google_clone/constants/colors.dart';

class SearchTab extends StatelessWidget {
  final bool? isActive;
  final String text;
  final IconData icon;

  const SearchTab({
    Key? key,
    required this.text,
    required this.icon,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18.0,
              color: isActive! ? blueColor : Colors.grey,
            ),
            const SizedBox(width: 3.0),
            Text(
              text,
              style: TextStyle(
                fontSize: 15.0,
                color: isActive! ? blueColor : Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 7.0),
        isActive!
            ? Container(
                height: 3.0,
                width: 40.0,
                color: blueColor,
              )
            : Container(),
      ],
    );
  }
}
