import 'package:flutter/material.dart';
import 'package:google_clone/widgets/search_tab.dart';

class SearchTabs extends StatelessWidget {
  const SearchTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.0,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            SearchTab(
              isActive: true,
              text: 'All',
              icon: Icons.search,
            ),
            SizedBox(width: 20.0),
            SearchTab(
              text: 'Images',
              icon: Icons.image,
            ),
            SizedBox(width: 20.0),
            SearchTab(
              text: 'Maps',
              icon: Icons.map,
            ),
            SizedBox(width: 20.0),
            SearchTab(
              text: 'News',
              icon: Icons.article,
            ),
            SizedBox(width: 20.0),
            SearchTab(
              text: 'Videos',
              icon: Icons.video_library_sharp,
            ),
            SizedBox(width: 20.0),
            SearchTab(
              text: 'More',
              icon: Icons.more_vert,
            ),
          ],
        ),
      ),
    );
  }
}
