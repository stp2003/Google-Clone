import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_clone/constants/colors.dart';
import 'package:google_clone/screens/search_screen.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //** media query ->
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/images/google_logo.png',
            height: size.height * 0.12,
          ),
        ),
        const SizedBox(height: 20.0),

        //?? text form field ->
        SizedBox(
          width: size.width > 767 ? size.width * 0.4 : size.width * 0.9,
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
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: searchBorder,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    30.0,
                  ),
                ),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/images/search_icon.svg',
                  color: searchBorder,
                  width: 1,
                  height: 1,
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/images/mic_icon.svg',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
