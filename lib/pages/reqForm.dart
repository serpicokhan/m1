import 'package:flutter/material.dart';
import 'package:m1/pages/partdialog.dart';
import 'package:http/http.dart' as http;

import 'dialog.dart';

class PurchaseRequestForm extends StatefulWidget {
  const PurchaseRequestForm({Key? key}) : super(key: key);

  @override
  _PurchaseRequestFormState createState() => _PurchaseRequestFormState();
}

class _PurchaseRequestFormState extends State<PurchaseRequestForm> {
  final _formKey = GlobalKey<FormState>();
  int? id;
  String? purchaseRequestRequestedUser;
  int? purchaseRequestStatus;
  DateTime? purchaseRequestCompletionDate;
  String? purchaseRequestMoreInfo;
  bool? purchaseRequestAssetNotInInventory;
  double? purchaseRequestAssetQty;
  int? purchaseRequestAssetQtyNot;
  bool? purchaseRequestAssetNot;
  bool? purchaseRequestNotInList;
  String? purchaseRequestDateTo;
  String? settingTimestamp;
  String? purchaseRequestTayeedUser;
  int? purchaseRequestPartName;
  int? purchaseRequestAsset;
  int? purchaseRequestAssetMakan;
  String? purchaseRequestAuthUser;
  String? purchaseRequestPurchase;

  String? _selectedOption = '';
  String? _textValue = '';
  String? _PartValue = '';
  void _updateSelectedOption(String option) {
    setState(() {
      _selectedOption = option;
    });
  }

  void _updatePartSelectedOption(String option) {
    setState(() {
      _PartValue = option;
    });
  }

  void _updateTextValue(String value) {
    setState(() {
      _textValue = value;
    });
  }

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

  Future<void> _showPartDialog() async {
    // Show dialog and get selected option
    final selectedOption = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return MyPartDialog();
      },
    );

    // Update selected option in form
    if (selectedOption != null) {
      _updatePartSelectedOption(selectedOption);
    }
  }

  Future<void> _sendFormToApi() async {
    final url = 'https://automation.chbk.run/Purchase/api/form';
    final response = await http.post(
      Uri.parse(url),
      body: {
        'purchaseRequestAssetMakan': purchaseRequestAssetMakan,
        'purchaseRequestAsset': purchaseRequestAsset,
        'purchaseRequestPartName': purchaseRequestPartName,
        'purchaseRequestAssetQty': purchaseRequestAssetQty,
      },
    );
    if (response.statusCode == 200) {
      // Handle success
    } else {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase Request Form'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Asset Makan',
                  ),
                  onSaved: (value) {
                    purchaseRequestAssetMakan = int.tryParse(value!);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Asset',
                  ),
                  onTap: _showDialog,
                  readOnly: true,
                  controller: TextEditingController(text: _selectedOption),
                  onSaved: (value) {
                    purchaseRequestAsset = int.tryParse(value!);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Part Name',
                  ),
                  onTap: _showPartDialog,
                  readOnly: true,
                  controller: TextEditingController(text: _selectedOption),
                  onSaved: (value) {
                    purchaseRequestPartName = int.tryParse(value!);
                  },
                ),
                //    onTap: _showDialog,
                // readOnly: true,
                // controller: TextEditingController(text: _selectedOption),

                // TextFormField(
                //   decoration: InputDecoration(
                //     labelText: 'ID',
                //   ),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter an ID';
                //     }
                //     return null;
                //   },
                //   onSaved: (value) {
                //     id = int.tryParse(value!);
                //   },
                // ),
                // TextFormField(
                //   decoration: InputDecoration(
                //     labelText: 'Requested User',
                //   ),
                //   onSaved: (value) {
                //     purchaseRequestRequestedUser = value;
                //   },
                // ),
                // TextFormField(
                //   decoration: InputDecoration(
                //     labelText: 'Status',
                //   ),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter a status';
                //     }
                //     return null;
                //   },
                //   onSaved: (value) {
                //     purchaseRequestStatus = int.tryParse(value!);
                //   },
                // ),
                // TextFormField(
                //   decoration: InputDecoration(
                //     labelText: 'Completion Date',
                //   ),
                //   onTap: () async {
                //     final date = await showDatePicker(
                //       context: context,
                //       initialDate: DateTime.now(),
                //       firstDate: DateTime.now(),
                //       lastDate: DateTime(2100),
                //     );
                //     setState(() {
                //       purchaseRequestCompletionDate = date;
                //     });
                //   },
                //   readOnly: true,
                //   controller: TextEditingController(
                //     text: purchaseRequestCompletionDate != null
                //         ? purchaseRequestCompletionDate.toString()
                //         : '',
                //   ),
                // ),
                // TextFormField(
                //   decoration: InputDecoration(
                //     labelText: 'More Info',
                //   ),
                //   onSaved: (value) {
                //     purchaseRequestMoreInfo = value;
                //   },
                // ),
                // SwitchListTile(
                //   title: Text('Asset Not in Inventory'),
                //   value: purchaseRequestAssetNotInInventory ?? false,
                //   onChanged: (value) {
                //     setState(() {
                //       purchaseRequestAssetNotInInventory = value;
                //     });
                //   },
                // ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'تعداد',
                  ),
                  onSaved: (value) {
                    purchaseRequestAssetQty = double.tryParse(value!);
                  },
                ),
                // TextFormField(
                //   decoration: InputDecoration(
                //     labelText: 'Asset Quantity Not',
                //   ),
                //   onSaved: (value) {
                //     purchaseRequestAssetQtyNot = int.tryParse(value!);
                //   },
                // ),
                // SwitchListTile(
                //   title: Text('Asset Not'),
                //   value: purchaseRequestAssetNot ?? false,
                //   onChanged: (value) {
                //     setState(() {
                //       purchaseRequestAssetNot = value;
                //     });
                //   },
                // ),
                // SwitchListTile(
                //   title: Text('Not in List'),
                //   value: purchaseRequestNotInList ?? false,
                //   onChanged: (value) {
                //     setState(() {
                //       purchaseRequestNotInList = value;
                //     });
                //   },
                // ),
                // TextFormField(
                //   decoration: InputDecoration(
                //     labelText: 'Date To',
                //   ),
                //   onSaved: (value) {
                //     purchaseRequestDateTo = value;
                //   },
                // ),
                // TextFormField(
                //   decoration: InputDecoration(
                //     labelText: 'Timestamp',
                //   ),
                //   onSaved: (value) {
                //     settingTimestamp = value;
                //   },
                // ),
                // TextFormField(
                //   decoration: InputDecoration(
                //     labelText: 'Tayeed User',
                //   ),
                //   onSaved: (value) {
                //     purchaseRequestTayeedUser = value;
                //   },
                // ),

                // TextFormField(
                //   decoration: InputDecoration(
                //     labelText: 'Auth User',
                //   ),
                //   onSaved: (value) {
                //     purchaseRequestAuthUser = value;
                //   },
                // ),
                // TextFormField(
                //   decoration: InputDecoration(
                //     labelText: 'Purchase',
                //   ),
                //   onSaved: (value) {
                //     purchaseRequestPurchase = value;
                //   },
                // ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // TODO: Submit the form data to a backend server
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
