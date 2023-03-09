import 'dart:convert';

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
  String? _selectedPartOption = '';
  String? _textValue = '';
  String? _PartValue = '';
  void _updateSelectedOption(String option) {
    setState(() {
      _selectedOption = option;
    });
  }

  void _updateSelectedPartOption(String option) {
    setState(() {
      _selectedPartOption = option;
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
      _updateSelectedPartOption(selectedOption);
    }
  }

  Future<void> _sendFormToApi() async {
    // print("is it called????");
    // final url = 'https://automation.chbk.run/Purchase/form/api';
    // final response = await http.post(
    //   Uri.parse(url),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: {
    //     'PurchaseRequestAssetMakan': 1,
    //     'PurchaseRequestAsset': 1,
    //     'PurchaseRequestPartName': 1,
    //     'PurchaseRequestAssetQty': 100,
    //   },
    // );
    // print("here");
    // if (response.statusCode == 200) {
    //   print("response is ok");
    //   // Handle success
    // } else {
    //   print("error in response");
    //   // Handle error
    // }
    final String url =
        'https://automation.chbk.run/Purchase/form/api'; // Replace with your URL

    Map<String, String> headers = {
      'Content-Type': 'application/json'
    }; // Replace with your headers if necessary

    Map<String, dynamic> body = {
      // Replace with your form data
      'PurchaseRequestAssetMakan': 1,
      'PurchaseRequestAsset': 1,
      'PurchaseRequestPartName': 1,
      'PurchaseRequestAssetQty': 100,
    };

    final response = await http.post(Uri.parse(url),
        headers: headers, body: json.encode(body));

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
                  controller: TextEditingController(text: _selectedPartOption),
                  onSaved: (value) {
                    purchaseRequestPartName = int.tryParse(value!);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'تعداد',
                  ),
                  onSaved: (value) {
                    purchaseRequestAssetQty = double.tryParse(value!);
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    _sendFormToApi();
                    // import 'package:http/http.dart' as http;

                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      print("somthing");
                      // _sendFormToApi();
                      // TODO: Submit the form data to a backend server
                    } else {
                      print("error");
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
