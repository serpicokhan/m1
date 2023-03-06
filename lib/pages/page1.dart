import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  String _selectedOption = '';
  String _textValue = '';

  // Define functions to update the values when they change
  void _updateSelectedOption(String option) {
    setState(() {
      _selectedOption = option;
    });
  }

  void _updateTextValue(String value) {
    setState(() {
      _textValue = value;
    });
  }

  // Define a function to show the dialog and get the selected option
  Future<void> _showDialog() async {
    // Show dialog and get selected option
    final selectedOption = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return MyDialog();
      },
    );

    // Update selected option in form
    if (selectedOption != null) {
      _updateSelectedOption(selectedOption);
    }
  }

  String? _selectedItem;

  final List<String> _items = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Form')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Text input field
            TextFormField(
              decoration: InputDecoration(labelText: 'Text Field'),
              onChanged: _updateTextValue,
            ),

            // Searchable field
            TextFormField(
              decoration: InputDecoration(labelText: 'Searchable Field'),
              onTap: _showDialog,
              readOnly: true,
              controller: TextEditingController(text: _selectedOption),
            ),
          ],
        ),
      ),
    );
  }
}

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _options = [
    'خط 1',
    'خط 2',
    'رنگرزی',
    'بافندگی',
    'خط 4',
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
