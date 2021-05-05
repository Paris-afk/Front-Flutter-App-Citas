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
      /*bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Search for people',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.redAccent;
                        return Colors
                            .yellowAccent; // Use the component's default.
                      },
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate() && _message != '') {
                      //Process data
                      print('Message sent');
                    }
                  },
                  child: Icon(
                    Icons.send,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),*/
    );
  }
}
