import 'package:flutter/material.dart';

class MyPartDialog extends StatefulWidget {
  @override
  _MyPartDialogState createState() => _MyPartDialogState();
}

class _MyPartDialogState extends State<MyPartDialog> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _options = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
    'Option 5',
    'Option 6',
    'Option 7',
    'Option 8',
    'Option 9',
    'Option 10'
  ];

  List<String> _filteredOptions = [];

  @override
  void initState() {
    super.initState();
    _filteredOptions.addAll(_options);
  }

  void _filterOptions(String query) {
    List<String> filtered = [];
    filtered.addAll(_options);
    if (query.isNotEmpty) {
      filtered = filtered
          .where((option) => option.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    setState(() {
      _filteredOptions.clear();
      _filteredOptions.addAll(filtered);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select an option'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _searchController,
            onChanged: (value) {
              _filterOptions(value);
            },
            decoration: InputDecoration(
              hintText: 'Search...',
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _filteredOptions.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_filteredOptions[index]),
                  onTap: () {
                    Navigator.pop(context, _filteredOptions[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
