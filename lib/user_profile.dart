import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfile createState() => _UserProfile();
}

class _UserProfile extends State<UserProfile> {
  final _profileImage = 'https://picsum.photos/500';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image(
                image: NetworkImage(_profileImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
        //Image asset an then the list of data of the user
      ),
    );
  }
}
