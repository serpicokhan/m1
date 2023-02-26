import 'package:flutter/material.dart';

class MyTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Tab Page'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // content of the first tab
            Container(
              child: Center(
                child: Text('Tab 1 content'),
              ),
            ),

            // content of the second tab
            Container(
              child: Center(
                child: Text('Tab 2 content'),
              ),
            ),

            // content of the third tab
            Container(
              child: Center(
                child: Text('Tab 3 content'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
