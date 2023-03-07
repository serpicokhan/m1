import 'package:flutter/material.dart';
import 'package:m1/details.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:m1/model/purchase.dart';
import 'package:m1/pages/detailed.dart';
import 'package:m1/pages/reqForm.dart';

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    EmailListScreen(),
    Screen2(),
    Screen3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        actions: [
          // Add the PopupMenuButton widget to the app bar
          PopupMenuButton<String>(
            onSelected: (value) {
              // TODO: Handle menu item selection
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'item1',
                  child: Text('Menu Item 1'),
                ),
                PopupMenuItem<String>(
                  value: 'item2',
                  child: Text('Menu Item 2'),
                ),
                PopupMenuItem<String>(
                  value: 'item3',
                  child: Text('Menu Item 3'),
                ),
              ];
            },
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Screen 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Screen 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Screen 3',
          ),
        ],
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen 1'),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen 2'),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen 3'),
    );
  }
}

Future<List<Purchase>> fetchPosts() async {
  final response =
      await http.get(Uri.parse('https://automation.chbk.run/Purchase/api/'));
  if (response.statusCode == 200) {
    final List<dynamic> data =
        json.decode(Utf8Decoder().convert(response.bodyBytes));

    return data.map((post) => Purchase.fromJson(post)).toList();
  } else {
    throw Exception('Failed to fetch posts');
  }
}

class CategoryChip extends StatefulWidget {
  final List<String> categories;
  final Function(String) onCategorySelected;

  CategoryChip({required this.categories, required this.onCategorySelected});

  @override
  _CategoryChipState createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    // return Wrap(
    //   spacing: 8.0,
    //   children: widget.categories
    //       .map(
    //         (category) => ChoiceChip(
    //           label: Text(category),
    //           selected: _selectedCategory == category,
    //           onSelected: (selected) {
    //             setState(() {
    //               _selectedCategory = selected ? category : null;
    //             });
    //             widget.onCategorySelected(category);
    //           },
    //         ),
    //       )
    //       .toList(),
    // );
    return Container(
      height: 50.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: widget.categories.map((String chip) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Chip(
              label: Text(chip),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class EmailListScreen extends StatefulWidget {
  @override
  _EmailListScreenState createState() => _EmailListScreenState();
}

class _EmailListScreenState extends State<EmailListScreen> {
  late Future<List<Purchase>> _posts;
  @override
  void initState() {
    super.initState();
    _posts = fetchPosts();
  }

  // List<Email> emails = [
  //   Email(
  //       sender: 'John Doe',
  //       subject: 'Meeting Request',
  //       timestamp: '10:30 AM',
  //       body: 'Hi, I would like to schedule a meeting with you.'),
  //   Email(
  //       sender: 'Jane Smith',
  //       subject: 'Vacation Plans',
  //       timestamp: '9:00 AM',
  //       body: 'Hey, do you want to join me on a trip to Hawaii?'),
  //   Email(
  //       sender: 'Mark Johnson',
  //       subject: 'Project Update',
  //       timestamp: '8:30 AM',
  //       body: 'Here is the latest progress report for the project.'),
  //   Email(
  //       sender: 'Sarah Lee',
  //       subject: 'Product Launch',
  //       timestamp: 'Yesterday',
  //       body: 'We are excited to announce the launch of our new product.'),
  // ];
  String _selectedCategory = 'All'; // Default value

  List<String> _data = [
    'Item 1 - Purchased',
    'Item 2 - On Hold',
    'Item 3 - Canceled',
    'Item 4 - In Progress',
    'Item 5 - Purchased',
    'Item 6 - On Hold',
    'Item 7 - Canceled',
    'Item 8 - In Progress',
    'Item 9 - Purchased',
    'Item 10 - On Hold',
    'Item 11 - Canceled',
    'Item 12 - In Progress',
  ];

  List<String> _filteredData() {
    if (_selectedCategory == 'All') {
      return _data;
    } else {
      return _data.where((item) => item.contains(_selectedCategory)).toList();
    }
  }

  // DateTime _startDate = DateTime.now().subtract(Duration(days: 30));
  // DateTime _endDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(
      //  title: Text('Inbox'),
      //actions: [
      //  IconButton(
      //    icon: Icon(Icons.search),
      //    onPressed: () {},
      //  ),
      //  IconButton(
      //    icon: Icon(Icons.more_vert),
      //    onPressed: () {},
      //  ),
      //],
      //),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CategoryChip(
              categories: [
                'All',
                'Purchased',
                'On Hold',
                'Canceled',
                'In Progress'
              ],
              onCategorySelected: (category) {
                setState(() {
                  _selectedCategory = category;
                });
              },
            ),
          ),
          Expanded(
            // child: ListView.builder(
            //   itemCount: emails.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     final email = emails[index];
            //     return Dismissible(
            //       key: Key(email.timestamp),
            //       onDismissed: (direction) {
            //         setState(() {
            //           emails.removeAt(index);
            //         });
            //       },
            //       background: Container(
            //         color: Colors.red,
            //         alignment: Alignment.centerRight,
            //         padding: EdgeInsets.only(right: 16),
            //         child: Icon(
            //           Icons.delete,
            //           color: Colors.white,
            //         ),
            //       ),
            //       child: EmailListItem(
            //         sender: email.sender,
            //         subject: email.subject,
            //         timestamp: email.timestamp,
            //       ),
            //     );
            //   },
            // ),
            child: FutureBuilder<List<Purchase>>(
              future: _posts,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      // return ListTile(
                      //   title: Text(snapshot
                      //       .data![index].purchaseRequestRequestedUser
                      //       .toString()),
                      //   subtitle: Text(snapshot.data![index].id.toString()),
                      // );
                      final email = snapshot.data![index];
                      return Dismissible(
                        key: Key(email.id.toString()),
                        onDismissed: (direction) {
                          setState(() {
                            snapshot.data!.removeAt(index);
                          });
                        },
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 16),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        child: EmailListItem(
                          sender: email.purchaseRequestedUser.toString(),
                          subject: email.id.toString(),
                          timestamp: email.purchaseDateTo.toString(),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyTabPage2()),
          );
        },
      ),
    );
  }
}

class Email {
  final String sender;
  final String subject;
  final String timestamp;
  final String body;

  Email(
      {required this.sender,
      required this.subject,
      required this.timestamp,
      required this.body});
}

class EmailListItem extends StatelessWidget {
  final String sender;
  final String subject;
  final String timestamp;

  EmailListItem(
      {required this.sender, required this.subject, required this.timestamp});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyTabPage2()),
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          child: Text(sender[0]),
        ),
        title: Text(sender),
        subtitle: Text(subject),
        trailing: Text(timestamp),
      ),
    );
  }
}
