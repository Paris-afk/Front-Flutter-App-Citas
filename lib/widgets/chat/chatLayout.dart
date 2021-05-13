import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './chatProfile.dart';
import './chatMessages.dart';

class Chat extends StatefulWidget {
  final String userId, userName;
  const Chat({
    Key key,
    this.userId,
    this.userName,
    }) : super(key: key);
  @override
  _Chat createState() => _Chat();
}

class _Chat extends State<Chat> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  String _message = '';
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Chat'),
    Tab(text: 'Profile'),
  ];

  List<Widget> views = <Widget>[];

  TabController _tabController;

  @override
  void initState() {
    print('GOT CHAT: ' + widget.userId);
    views = [
      ChatMessages(userId: widget.userId),
      ChatProfile(userId: widget.userId),
    ];
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userName),
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: views,
      ),
    );
  }
}
