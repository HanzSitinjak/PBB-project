import 'package:doca_project/component/PartComponent/header.dart';
import 'package:doca_project/component/PartComponent/navbar.dart';
import 'package:flutter/material.dart';
import 'package:doca_project/component/ColorGlobal.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isPetListVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                child: Image.asset(
                  'assets/images/Logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                  topRight: Radius.circular(18.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Aksi ketika kontainer pertama ditekan
                    },
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/images/Logo.png'),
                            radius: 30.0,
                          ),
                          SizedBox(width: 16.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nama Pengguna',
                                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                              ),
                              Text('user@example.com'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isPetListVisible = !_isPetListVisible;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Daftar Peliharaan',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            _isPetListVisible ? Icons.expand_less : Icons.expand_more,
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (_isPetListVisible)
                    Expanded(
                      child: SizedBox(
                        height: 300.0, // Mengatur tinggi Expanded menjadi 300.0
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _buildPetProfile(
                                context,
                                'assets/images/Logo.png',
                                'Max',
                                'Dog',
                              ),
                              _buildPetProfile(
                                context,
                                'assets/images/Logo.png',
                                'Bella',
                                'Cat',
                              ),
                              _buildPetProfile(
                                context,
                                'assets/images/Logo.png',
                                'Charlie',
                                'Bird',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Aksi ketika tombol logout ditekan
                          },
                          child: Text('Logout', style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            minimumSize: Size(double.infinity, 48),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        GestureDetector(
                          onTap: () {
                            // Aksi ketika teks "contact us" ditekan
                          },
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Need help? ',
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '(contact us)',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Navbar(),
    );
  }

  Widget _buildPetProfile(BuildContext context, String imagePath, String petName, String petType) {
    return GestureDetector(
      onTap: () {
        // Aksi ketika kontainer hewan peliharaan ditekan
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 30.0,
        ),
        title: Text(
          petName,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(petType),
        trailing: PopupMenuButton<String>(
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'see_pet',
              child: Text('See Pet'),
            ),
            PopupMenuItem<String>(
              value: 'delete_pet',
              child: Text('Delete Pet'),
            ),
          ],
          onSelected: (String value) {
            // Aksi ketika opsi dipilih
            if (value == 'see_pet') {
              // Aksi ketika opsi "See Pet" dipilih
            } else if (value == 'delete_pet') {
              // Aksi ketika opsi "Delete Pet" dipilih
            }
          },
        ),
      ),
    );
  }
}