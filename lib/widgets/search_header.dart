import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_clone/constants/colors.dart';
import 'package:google_clone/screens/search_screen.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //** media query ->
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 28.0, right: 15.0, top: 5.0),
            child: Image.asset(
              'assets/images/google_logo.png',
              height: 30.0,
              width: 92.0,
            ),
          ),
          const SizedBox(width: 27.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            width: size.width * 0.45,
            decoration: BoxDecoration(
              color: searchColor,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: searchColor,
              ),
            ),
            child: TextFormField(
              onFieldSubmitted: (query) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(
                      searchQuery: query,
                      start: '0',
                    ),
                  ),
                );
              },
              style: const TextStyle(
                fontSize: 20.0,
              ),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    constraints: const BoxConstraints(minWidth: 150.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/images/mic_icon.svg',
                          height: 20.0,
                          width: 20.0,
                        ),
                        const SizedBox(width: 20.0),
                        const Icon(
                          Icons.search_sharp,
                          color: blueColor,
                        ),
                      ],
                    ),
                  ),
                ),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
