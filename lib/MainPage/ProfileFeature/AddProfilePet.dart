import 'package:doca_project/component/ColorGlobal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doca_project/component/routeGlobal.dart';
import 'package:doca_project/component/PartComponent/header.dart';
import 'package:doca_project/component/PartComponent/navbar.dart';

class editPetProfile extends StatefulWidget {
  @override
  _editPetProfileState createState() => _editPetProfileState();
}

class _editPetProfileState extends State<editPetProfile> {
  String? selectedGender;
  String? selectedPetType;
  String? selectedBreed;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: Header(title: 'Edit Pet Profile'),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: MediaQuery.of(context).size.height / 7,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage('assets/images/pet_avatar.png'),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(20.0),
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Name of pet*',
                          hintText: 'Name of pet',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Type of pet*',
                          border: OutlineInputBorder(),
                        ),
                        value: selectedPetType,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedPetType = newValue;
                          });
                        },
                        items: <String>[
                          'Dog',
                          'Cat',
                          'Bird',
                          'Other'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Breed of pet*',
                          border: OutlineInputBorder(),
                        ),
                        value: selectedBreed,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedBreed = newValue;
                          });
                        },
                        items: <String>[
                          'Golden Retriever',
                          'German Shepherd',
                          'Labrador Retriever',
                          'Bulldog',
                          'Beagle',
                          'Poodle',
                          'Boxer',
                          'Siberian Husky',
                          'Dachshund',
                          'Chihuahua'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gender*',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Radio<String>(
                                value: 'Male',
                                groupValue: selectedGender,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedGender = value;
                                  });
                                },
                              ),
                              Text('Male'),
                              Radio<String>(
                                value: 'Female',
                                groupValue: selectedGender,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedGender = value;
                                  });
                                },
                              ),
                              Text('Female'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: InputDecorator(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: selectedDate != null
                                ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                                : 'Select Date',
                          ),
                          child: Text(''),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter pet Weight*',
                          hintText: 'Enter pet Weight',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter Pet Color*',
                          hintText: 'Enter Pet Color',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed(RouteName.home);
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
        ],
      ),
      bottomNavigationBar: Navbar(),
    );
  }

  // Fungsi untuk memilih tanggal
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
