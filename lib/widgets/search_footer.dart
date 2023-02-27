import 'package:flutter/material.dart';
import 'package:google_clone/constants/colors.dart';

class SearchFooter extends StatelessWidget {
  const SearchFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          color: footerColor,
          padding: EdgeInsets.symmetric(
            horizontal: size.width <= 767 ? 10.0 : 150.0,
            vertical: 15.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'India',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15.0,
                ),
              ),
              const SizedBox(width: 10.0),
              Container(
                height: 20.0,
                width: 0.5,
                color: Colors.grey,
              ),
              const SizedBox(width: 10.0),
              const Icon(
                Icons.circle,
                color: Color(0xFF70757A),
                size: 12.0,
              ),
              const SizedBox(width: 10.0),
              const Text(
                "221011, Varanasi, Uttar Pradesh",
                style: TextStyle(
                  fontSize: 14.0,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 0.0,
          height: 0.0,
          color: Colors.black26,
        ),

        //** showing the help options ->
        Container(
          color: footerColor,
          padding:
              EdgeInsets.symmetric(horizontal: size.width <= 767 ? 20.0 : 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Help',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15.0,
                ),
              ),
              const SizedBox(width: 20.0),
              Text(
                'Send feedback',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15.0,
                ),
              ),
              const SizedBox(width: 20.0),
              Text(
                'Privacy',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15.0,
                ),
              ),
              const SizedBox(width: 20.0),
              Text(
                'Terms',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
