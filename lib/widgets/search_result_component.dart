import 'package:flutter/material.dart';
import 'package:google_clone/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchResultComponent extends StatefulWidget {
  final String link;
  final String linkToGO;
  final String text;
  final String desc;

  const SearchResultComponent({
    Key? key,
    required this.link,
    required this.text,
    required this.linkToGO,
    required this.desc,
  }) : super(key: key);

  @override
  State<SearchResultComponent> createState() => _SearchResultComponentState();
}

class _SearchResultComponentState extends State<SearchResultComponent> {
  //** for showing hover ->
  bool _showUnderLine = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //** showing the link at the top first ->
        Text(
          widget.link,
        ),

        //** showing the text to display as header with link ->
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,

            //?? for launching the url ->
            onTap: () async {
              if (await canLaunch(widget.linkToGO)) {
                await launch(widget.linkToGO);
              }
            },

            //?? for hovering effect ->
            onHover: (hovering) {
              setState(() {
                _showUnderLine = hovering;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.link,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Color(
                      0xFF202124,
                    ),
                  ),
                ),
                Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: blueColor,
                    decoration: _showUnderLine
                        ? TextDecoration.underline
                        : TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(
          widget.desc,
          maxLines: 4,
          style: const TextStyle(
            fontSize: 14.0,
            overflow: TextOverflow.ellipsis,
            color: primaryColor,
          ),
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }
}
