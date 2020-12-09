import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RootMatches extends StatefulWidget {
  @override
  _RootMatches createState() => _RootMatches();
}

class _RootMatches extends State<RootMatches> {
  final List<Tab> tabs = <Tab>[
    Tab(text: 'Match'),
    Tab(text: 'Likes'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        return Column(
          children: [
            SizedBox(
              height: 24,
            ),
            TabBar(
              tabs: tabs,
              labelColor: Colors.redAccent,
            ),
          ],
        );
      }),
    );
  }
}
