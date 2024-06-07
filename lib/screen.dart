import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class screenpage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final _urlController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _upiController = TextEditingController();
  String _liveStatus = "Yes";
  String _monthlySalesVolume = '0-5 lacs';
  final Map<String, String> _monthlySalesMap = {
    '0-5 lacs': '1',
    '5-10 lacs': '2',
    '10-2.5 cr': '3',
    '>2.5 cr': '4'
  };
  String _businessType = 'Private Limited';
  Future<void> _submitForm() async {
    if (_formkey.currentState?.validate() ?? false) {
      final apiUrl = Uri.parse(
        'https://www.sendinr.com/registertest/api/WINZ/register?app_website_url=https://www.sendinr.com&app_web_status=yes&firstname=Rajesh&lastname=R&emailid=rajesh.r@zantida.com&mobileno=919711111111&upiid=upiid@okaxis&month_sale_staus=1&business_type=Private Limited',
      );

      final response = await http.get(apiUrl);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(_formkey.currentContext!).showSnackBar(
          SnackBar(content: Text('Form submitted successfully')),
        );
      } else {
        ScaffoldMessenger.of(_formkey.currentContext!).showSnackBar(
          SnackBar(content: Text('Failed to submit form')),
        );
      }
    }
  }

  //const screenpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Business Registration Form"),
      ),
      backgroundColor: Colors.purple.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                "Accept Payments Directly to your bank account",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.purple.shade400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Register your business with UPI2INDIA",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter the app/website URL of your business',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextFormField(
                    controller: _urlController,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Type your Url here!!";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Is your App/Website is live?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    value: _liveStatus,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(),
                    ),
                    items: <String>['Yes', 'Will be live soon']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        _liveStatus = newValue;
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select an option';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  Text(
                    ' Name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name field is required!";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  Text(
                    ' Email',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required!!";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  Text(
                    ' Phone',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required!!";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState?.validate() ?? false) {
                        // Process data
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Verifying')),
                        );
                      }
                    },
                    child: Text('Send OTP'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    ' Enter your UPI id',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextFormField(
                    controller: _upiController,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter upi id";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState?.validate() ?? false) {
                        // Process UPI verification
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Verifying UPI ID')),
                        );
                      }
                    },
                    child: Text('Verify'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Monthly Sales Volume of your business:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: _monthlySalesVolume,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    items: _monthlySalesMap.keys
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        _monthlySalesVolume = newValue;
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select an option';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Business Type:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: _businessType,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    items: <String>[
                      'Private Limited',
                      'Public Limited',
                      'Proprietorship',
                      'Partnership/LLP',
                      'Trust/Society',
                      'HUF',
                      'Unregistered'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        _businessType = newValue;
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select an option';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
