import 'package:flutter/material.dart';
import 'package:google_clone/constants/colors.dart';
import 'package:google_clone/services/api_service.dart';
import 'package:google_clone/widgets/search_footer.dart';
import 'package:google_clone/widgets/search_header.dart';
import 'package:google_clone/widgets/search_result_component.dart';
import 'package:google_clone/widgets/search_tabs.dart';

class SearchScreen extends StatelessWidget {
  //** for previous and next ->
  final String searchQuery;
  final String start;

  const SearchScreen({
    Key? key,
    required this.searchQuery,
    required this.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //** media query ->
    final size = MediaQuery.of(context).size;

    return Title(
      color: Colors.blue,
      title: searchQuery,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //** web header ->
              const SearchHeader(),

              //** tabs for images, videos, etc ->
              Padding(
                padding: EdgeInsets.only(
                  left: size.width <= 767 ? 10 : 170.0,
                  top: 10.0,
                  bottom: 5.0,
                ),
                child: const SearchTabs(),
              ),

              const Divider(
                height: 0.0,
                thickness: 0.3,
              ),

              //** search results ->
              FutureBuilder(
                future: ApiService().fetchData(
                    context: context, queryTerm: searchQuery, start: start),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: size.width <= 767 ? 10 : 150.0,
                            top: 12.0,
                          ),
                          child: Text(
                            "About ${snapshot.data?['searchInformation']['formattedTotalResults']} results (${snapshot.data?['searchInformation']['formattedSearchTime']} seconds)",
                            style: const TextStyle(
                              fontSize: 15.0,
                              color: Color(0xFF70757a),
                            ),
                          ),
                        ),

                        //** list view builder for showing results ->
                        ListView.builder(
                          itemCount: snapshot.data?['items'].length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                left: size.width <= 767 ? 10 : 150.0,
                                top: 10.0,
                              ),
                              child: SearchResultComponent(
                                desc: snapshot.data?['items'][index]['snippet'],
                                link: snapshot.data?['items'][index]
                                    ['formattedUrl'],
                                linkToGO: snapshot.data?['items'][index]
                                    ['link'],
                                text: snapshot.data?['items'][index]['title'],
                              ),
                            );
                          },
                        ),

                        //** pagination buttons ->
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  if (start != '0') {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => SearchScreen(
                                          searchQuery: searchQuery,

                                          //** to allow only 10 results per page ->
                                          //** and make sure that 1st page perv button is not working ->
                                          start: (int.parse(start) - 10)
                                              .toString(),
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: const Text(
                                  '< Prev',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: blueColor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 30.0),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SearchScreen(
                                        searchQuery: searchQuery,

                                        //** to allow only 10 results per page(next) ->
                                        start:
                                            (int.parse(start) + 10).toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Next >',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: blueColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        const SearchFooter(),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
