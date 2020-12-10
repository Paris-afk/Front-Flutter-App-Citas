import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RootMatches extends StatefulWidget {
  const RootMatches({Key key}) : super(key: key);
  @override
  _RootMatches createState() => _RootMatches();
}

class _RootMatches extends State<RootMatches>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Match'),
    Tab(text: 'Likes'),
  ];

  TabController _tabController;

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
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
            controller: _tabController,
            children: myTabs.map((Tab tab) {
              final String label = tab.text.toLowerCase();
              return Center(
                child: Text(
                  'This is the $label tab',
                  style: const TextStyle(fontSize: 36),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
