import 'package:flutter/material.dart';
import './LoginPage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _username = '';
  String _email = '';
  String _password = '';
  bool _usernameError = false;
  bool _emailError = false;
  bool _passwordError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFA500),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(40.0),
              child: Image.asset(
                'assets/images/OnBoardingIMG.png',
                width: 170,
                height: 170,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.70,
              padding: EdgeInsets.only(top: 25.0, right: 15.0, left: 15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Create An Account',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Username*',
                      labelStyle: TextStyle(
                        fontSize: 14,
                        color: _emailError ? Colors.red : Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                      hintText: 'Username',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _usernameError ? Colors.red : Colors.black,
                          width: _usernameError ? 2.0 : 1.0,
                        ),
                      ),
                      errorText: _usernameError ? 'Username tidak valid' : null,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _username = value;
                        _usernameError = !_isValidUsername(value);
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email*',
                      labelStyle: TextStyle(
                        fontSize: 14,
                        color: _emailError ? Colors.red : Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _emailError ? Colors.red : Colors.black,
                          width: _emailError ? 2.0 : 1.0,
                        ),
                      ),
                      errorText: _emailError ? 'Email tidak valid' : null,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _email = value;
                        _emailError = !_isValidEmail(value);
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Password*',
                      labelStyle: TextStyle(
                        fontSize: 14,
                        color: _passwordError ? Colors.red : Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _passwordError ? Colors.red : Colors.black,
                          width: _passwordError ? 2.0 : 1.0,
                        ),
                      ),
                      errorText: _passwordError ? 'Password minimal 8 karakter' : null,
                    ),
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                        _passwordError = value.length < 8;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Aksi saat tombol login ditekan
                      print('Tombol login ditekan');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Sign Up'),
                  ),
                  SizedBox(height: 20),

                  Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        // Tindakan saat teks "Sign In" ditekan
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sudah punya akun? ',
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              'Sign In',
                              style: TextStyle(fontSize: 13, color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isValidEmail(String email) {
    return email.contains('@');
  }

  bool _isValidUsername(String username) {
    final RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9]).{8,}$');
    return regex.hasMatch(username);
  }
}
