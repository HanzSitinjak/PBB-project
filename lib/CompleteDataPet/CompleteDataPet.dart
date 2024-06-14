import 'package:doca_project/MainPage/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CompleteData2(),
  ));
}

class CompleteData2 extends StatefulWidget {
  @override
  _CompleteData2State createState() => _CompleteData2State();
}

class _CompleteData2State extends State<CompleteData2> {
  String? selectedPetType;
  String? selectedGender;
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFA500),
      appBar: AppBar(
        title: Text(
          'Pet Biography',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFFFA500),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 1.1,
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 35.0),
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
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Name of pet*',
                      labelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      hintText: 'Name of pet',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: DropdownButtonFormField<String>(
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
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Breed of pet*',
                        border: OutlineInputBorder(),
                      ),
                      value: selectedPetType,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedPetType = newValue;
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
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gender*',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
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
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
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
                            ),
                            IconButton(
                              onPressed: () {
                                _selectDate(context);
                              },
                              icon: Icon(Icons.calendar_today),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter pet Weight*',
                      labelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      hintText: 'Enter pet Weight',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter Pet Color*',
                      labelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      hintText: 'Enter Pet Color',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
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
}
