import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController code = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController companyCode = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController address = TextEditingController();
  String? _selectedCountryCode;
  late List<Map<String, String>> _countryData = [];

  List<dynamic> _countries = [];
  dynamic _selectedCountry;
  List<dynamic> _states = [];
  dynamic _selectedState;
  List<dynamic> _cities = [];
  dynamic _selectedCity;

  @override
  void initState() {
    super.initState();
    _loadCountryData();
    _loadCountries();
  }

  Future<void> _loadCountries() async {
    try {
      String data = await rootBundle.loadString('assets/countries+states+cities.json');
      Map<String, dynamic> jsonData = json.decode(data);
      List<dynamic> countries = jsonData['countries'];

      setState(() {
        _countries = countries;
      });
    } catch (e) {
      print("Error loading countries data: $e");
    }
  }

  Future<void> _loadCountryData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://gist.githubusercontent.com/devhammed/78cfbee0c36dfdaa4fce7e79c0d39208/raw/07df5ed443941c504c65e81c83e6313473409d4c/countries.json'));
      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        List<Map<String, String>> countryData = jsonData.map((map) {
          return Map<String, String>.from(map);
        }).toList();
        setState(() {
          _countryData = countryData;
        });
      } else {
        print('Failed to load country data: ${response.statusCode}');
      }
    } catch (e) {
      print("Error loading country data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle continue with Google
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Background color of the button
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icon/google.png', // Path to your Google logo asset
                          height: 24, // Adjust the size as needed
                          width: 24,
                        ),
                        SizedBox(width: 8), // Add some space between the icon and text
                        Text(
                          ' Continue with Google',
                          style: TextStyle(
                            color: Colors.black, // Text color
                            fontWeight: FontWeight.bold, // Bold font weight
                            fontSize: 16, // Font size
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle continue with Apple
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Background color of the button
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icon/apple-logo.png', // Path to your Apple logo asset
                          height: 24, // Adjust the size as needed
                          width: 24,
                        ),
                        SizedBox(width: 8), // Add some space between the icon and text
                        Text(
                          ' Continue with Apple',
                          style: TextStyle(
                            color: Colors.black, // Text color
                            fontWeight: FontWeight.bold, // Bold font weight
                            fontSize: 16, // Font size
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [Colors.pinkAccent.withOpacity(0), Colors.pinkAccent.withOpacity(1)],
                            stops: [0, 1],
                          ).createShader(bounds);
                        },
                        child: Divider(
                          thickness: 2,
                          color: Colors.pinkAccent.withOpacity(1),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'OR Continue with',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [Colors.pinkAccent.withOpacity(1), Colors.pinkAccent.withOpacity(0)],
                            stops: [0, 1],
                          ).createShader(bounds);
                        },
                        child: Divider(
                          thickness: 2,
                          color: Colors.pinkAccent.withOpacity(1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),
              CustomTextField(
                controller: code,
                hintText: "Enter Code",
              ),
              Row(
                children: [
                  // SizedBox(width: 10),
                  Expanded(
                    child: DropdownButton<String>(
                      value: _selectedCountryCode,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCountryCode = newValue;
                        });
                      },
                      items: _countryData.map<DropdownMenuItem<String>>(
                            (Map<String, String> country) {
                          return DropdownMenuItem<String>(
                            value: country['code'],
                            child: Row(
                              children: [
                                Text(country['flag']!),
                                SizedBox(width: 5),
                                Text(country['dial_code']!),
                              ],
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: phone,
                      decoration: InputDecoration(
                        hintText: "Phone",
                        hintStyle: TextStyle(color: Colors.grey),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  // SizedBox(width: 10),
                ],
              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: email,
                hintText: "Enter Email",
              ),
              CustomTextField(
                controller: companyCode,
                hintText: "Company Name",
              ),
              SizedBox(height: 10),
              PasswordField(
                controller: password,
                labelText: 'Password',
              ),

              SizedBox(height: 10),
              PasswordField(
                controller: confirmPassword,
                labelText: 'Confirm Password',
              ),
              SizedBox(height: 10),
              DropdownButton<dynamic>(
                hint: Text('Select Country'),
                value: _selectedCountry,
                items: _countries.map((country) {
                  return DropdownMenuItem<dynamic>(
                    value: country,
                    child: Text(country['name']),
                  );
                }).toList(),

                onChanged: (dynamic countryData) {
                  if (countryData != null) {
                    String countryName = countryData['name'];
                    String countryCode = countryData['id'];
                    setState(() {
                      _selectedCountry = {'id': countryCode, 'name': countryName}; // Store the country data as a map
                      _states = _selectedCountry['states'] ?? []; // Populate states list
                      _selectedState = null; // Reset selected state
                      _cities = []; // Reset cities list
                    });
                    print(_selectedCountry);
                    // Handle country selection
                  }
                },
              ),
              CustomDropdown(
                hintText: 'Select State',
                url: _selectedCountry != null && _selectedCountry is Map
                    ? 'https://gist.githubusercontent.com/devhammed/78cfbee0c36dfdaa4fce7e79c0d39208/raw/07df5ed443941c504c65e81c83e6313473409d4c/countries.json/states?country=${(_selectedCountry as Map)['id']}'
                    : '',
                onChanged: (String? stateName, String stateId) {
                  // Handle state selection
                  setState(() {
                    _selectedState = {'id': stateId, 'name': stateName}; // Store the state data as a map
                    _cities = []; // Reset cities list
                  });
                  print('Selected State: $stateName, ID: $stateId');
                },
              ),
              SizedBox(height: 10),
              CustomDropdown(
                hintText: 'Select City',
                url: _selectedState != null && _selectedState is Map
                    ? 'https://gist.githubusercontent.com/devhammed/78cfbee0c36dfdaa4fce7e79c0d39208/raw/07df5ed443941c504c65e81c83e6313473409d4c/countries.json/cities?state=${(_selectedState as Map)['id']}'
                    : '',
                onChanged: (String? cityName, String cityId) {
                  // Handle city selection
                  setState(() {
                    _selectedCity = {'id': cityId, 'name': cityName}; // Store the city data as a map
                  });
                  print('Selected City: $cityName, ID: $cityId');
                },
              ),
              SizedBox(height: 10),
              CustomDropdown(
                hintText: 'Select State',
                url: _selectedCountry != null && _selectedCountry is Map
                    ? 'https://gist.githubusercontent.com/devhammed/78cfbee0c36dfdaa4fce7e79c0d39208/raw/07df5ed443941c504c65e81c83e6313473409d4c/countries.json/states?country=${(_selectedCountry as Map)['id']}'
                    : '',
                onChanged: (String? stateName, String stateId) {
                  // Handle state selection
                },
              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: address,
                hintText: "Address",
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    print('Submit');
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      style: TextStyle(color: Colors.black),
    );
  }
}

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;

  const PasswordField({
    Key? key,
    required this.controller,
    required this.labelText,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
    labelText: widget.labelText,
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
      ),
    );
  }
}

class CustomDropdown extends StatefulWidget {
  final String hintText;
  final String url;
  final void Function(String?, String)? onChanged;

  const CustomDropdown({
    Key? key,
    required this.hintText,
    required this.url,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late List<Map<String, dynamic>> _items = [];
  Map<String, dynamic>? _selectedItem;

  @override
  void initState() {
    super.initState();
    _fetchDropdownValues();
  }

  Future<void> _fetchDropdownValues() async {
    try {
      final response = await http.get(Uri.parse(widget.url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _items = List<Map<String, dynamic>>.from(data);
        });
      } else {
        throw Exception('Failed to load dropdown values');
      }
    } catch (e) {
      print('Error fetching dropdown values: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40.0),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Map<String, dynamic>>(
          value: _selectedItem,
          onChanged: widget.onChanged != null
              ? (Map<String, dynamic>? newValue) {
            setState(() {
              _selectedItem = newValue;
            });
            widget.onChanged!(
              newValue?['name'] as String?,
              newValue!['id'].toString(),
            );
          }
              : null,
          items: _items.map<DropdownMenuItem<Map<String, dynamic>>>(
                (item) {
              return DropdownMenuItem<Map<String, dynamic>>(
                value: item,
                child: Text(item['name'] as String),
              );
            },
          ).toList(),
          hint: Text(
            widget.hintText,
            style: TextStyle(color: Colors.grey),
          ),
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 36.0,
          isExpanded: true,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}