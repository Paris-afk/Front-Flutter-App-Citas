import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './matches.dart';
import './likes.dart';

class RootMatches extends StatefulWidget {
  const RootMatches({required Key key}) : super(key: key);
  @override
  _RootMatches createState() => _RootMatches();
}

class _RootMatches extends State<RootMatches>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Match'),
    Tab(text: 'Likes'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: TabBar(
            controller: _tabController,
            tabs: myTabs,
            labelColor: Colors.redAccent,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height - 180,
          child: TabBarView(
            controller: _tabController,
            children: [
              Matches(key: UniqueKey()),
              Likes(key: UniqueKey()),
            ],
          ),
        ),
      ],
    );
  }
}
