import 'package:flutter/material.dart';
import './CompleteData2.dart';

class CompleteData1 extends StatefulWidget {
  @override
  _CompleteData1State createState() => _CompleteData1State();
}

class _CompleteData1State extends State<CompleteData1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFA500),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              padding: EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome To DoCa',
                    style: TextStyle(fontSize: 37, fontWeight: FontWeight.bold, color: Color(0xFF41484D)),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Complete your pet Profile',
                    style: TextStyle(fontSize: 27, color: Color(0xFF41484D)),
                  ),
                ],
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              padding: EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
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
                  Container(
                    width: 270,
                    height: 270,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: ElevatedButton(
                          onPressed: () {
                            // Aksi saat tombol galeri ditekan
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/iconFile.png',
                                width: 24,
                                height: 24,
                              ),
                              SizedBox(width: 8), // Jarak antara ikon dan teks
                              Text('Galeri'),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: ElevatedButton(
                          onPressed: () {

                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/iconCamera.png',
                                width: 24,
                                height: 24,
                              ),
                              SizedBox(width: 8),
                              Text('Galeri'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CompleteData2()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Next'),
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
}
