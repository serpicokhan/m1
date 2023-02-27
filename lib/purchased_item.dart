import 'package:flutter/material.dart';

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

class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  List<Email> emails = [
    Email(
        sender: 'John Doe',
        subject: 'Meeting Request',
        timestamp: '10:30 AM',
        body: 'Hi, I would like to schedule a meeting with you.'),
    Email(
        sender: 'Jane Smith',
        subject: 'Vacation Plans',
        timestamp: '9:00 AM',
        body: 'Hey, do you want to join me on a trip to Hawaii?'),
    Email(
        sender: 'Mark Johnson',
        subject: 'Project Update',
        timestamp: '8:30 AM',
        body: 'Here is the latest progress report for the project.'),
    Email(
        sender: 'Sarah Lee',
        subject: 'Product Launch',
        timestamp: 'Yesterday',
        body: 'We are excited to announce the launch of our new product.'),
  ];
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
            child: ListView.builder(
              itemCount: emails.length,
              itemBuilder: (BuildContext context, int index) {
                final email = emails[index];
                // return Dismissible(
                //   key: Key(email.timestamp),
                //   onDismissed: (direction) {
                //     setState(() {
                //       emails.removeAt(index);
                //     });
                //   },
                //   background: Container(
                //     color: Colors.red,
                //     alignment: Alignment.centerRight,
                //     padding: EdgeInsets.only(right: 16),
                //     child: Icon(
                //       Icons.delete,
                //       color: Colors.white,
                //     ),
                //   ),
                //   child: EmailListItem(
                //     sender: email.sender,
                //     subject: email.subject,
                //     timestamp: email.timestamp,
                //   ),
                // );
                return Dismissible(
                  key: Key(email.timestamp),
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction) {
                    setState(() {
                      emails.removeAt(index);
                    });

                    if (direction == DismissDirection.startToEnd) {
                      // Execute code for swipe left
                      print('Swiped Left');
                    } else if (direction == DismissDirection.endToStart) {
                      // Execute code for swipe right
                      print('Swiped Right');
                    }
                  },
                  background: Container(
                    color: Colors.red,
                    child: Icon(Icons.delete, color: Colors.white),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20),
                  ),
                  secondaryBackground: Container(
                    color: Colors.green,
                    child: Icon(Icons.edit, color: Colors.white),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),
                  ),
                  child: EmailListItem(
                    sender: email.sender,
                    subject: email.subject,
                    timestamp: email.timestamp,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
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
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => ()),
        // );
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
