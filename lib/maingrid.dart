import 'package:flutter/material.dart';

import 'myscreen.dart';

class TwoColumnCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Two Column Card Screen'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyScreen()),
              );
            },
            child: Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('part purchase'),
                subtitle: Text('johndoe@example.com'),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Jane Doe'),
                subtitle: Text('janedoe@example.com'),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Bob Smith'),
                subtitle: Text('bobsmith@example.com'),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Alice Johnson'),
                subtitle: Text('alicejohnson@example.com'),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Joe Bloggs'),
                subtitle: Text('joebloggs@example.com'),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Jane Smith'),
                subtitle: Text('janesmith@example.com'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
