import 'package:flutter/material.dart';
import 'dart:convert';
import '../utilis/routes.dart';
import 'package:http/http.dart' as http;

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController code = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  String? _selectedCountryCode = 'IN'; // Default to India

  late List<Map<String, String>> _countryData = [];
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    // Load country data from the local file
    _loadCountryData();
  }


  Future<void> _loadCountryData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://gist.githubusercontent.com/devhammed/78cfbee0c36dfdaa4fce7e79c0d39208/raw/07df5ed443941c504c65e81c83e6313473409d4c/countries.json'));
      if (response.statusCode == 200) {
        // Decode the JSON data
        List<dynamic> jsonData = json.decode(response.body);

        print(jsonData.toString());
        // Convert dynamic map values to string map values
        List<Map<String, String>> countryData = jsonData.map((map) {
          return Map<String, String>.from(map);
        }).toList();

        // Set the country data
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

  String name = '';
  bool changebutton = false;
  final _formkey = GlobalKey<FormState>();

  // Function to navigate to home page
  movetohome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      {
        setState(() {
          changebutton = true;
        });
        await Future.delayed(Duration(seconds: 1));
        await Navigator.pushNamed(context, MyRoutes.homeroute);
        setState(() {
          changebutton = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://img.freepik.com/premium-vector/jeweler-concept-goldsmith-examining-faceting-diamond-with-craft-tools-precious-stones-jewelry-designer-idea-creative-people-professionvector-illustration_613284-2119.jpg",
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Text(
                      "We are So Glad To See You Again. Thank You ",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Text(
                      "for choosing us for our services.",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.blueGrey,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: code,
                      decoration: InputDecoration(
                        hintText: "Code",
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
                    SizedBox(height: 10),
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
                    TextFormField(
                      controller: password,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            print('Forgot Password pressed');
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        movetohome(context); // Navigate to home page
                      },
                      child: Text('Login'),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Navigate to register page
                            Navigator.pushNamed(context, MyRoutes.Registerroute);
                          },
                          child: Center(
                            child: Text.rich(
                              TextSpan(
                                text: 'Dont Have an Account? ',
                                style: TextStyle(
                                  color: Colors.grey, // Set the color for the text before "Register"
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Register',
                                    style: TextStyle(
                                      color: Colors.amber, // Set the color for "Register"
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
