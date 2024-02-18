// ignore_for_file: prefer_const_constructors, sort_child_properties_last, depend_on_referenced_packages

import 'package:blood_pressure/details.dart';
import 'package:blood_pressure/infopage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController systolicController = TextEditingController();
  TextEditingController diastolicController = TextEditingController();

  void _validateAndNavigate() {
    // Validate input values
    int? systolic = int.tryParse(systolicController.text);
    int? diastolic = int.tryParse(diastolicController.text);

    if (systolic != null && diastolic != null) {
      // Navigate to information screen with input data
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => InformationScreen(
            inputData: {'systolic': systolic, 'diastolic': diastolic},
          ),
        ),
      );
    } else {
      // Show an alert for invalid input
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Invalid Input'),
          content: Text('Please enter valid systolic and diastolic values.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Blood Pressure Input Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/bp.png",
                width: 250,
              ),
              Gap(50),
              TextField(
                controller: systolicController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Systolic',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0))),
              ),
              SizedBox(height: 20),
              TextField(
                controller: diastolicController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Diastolic',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0))),
              ),
              Gap(50),
              ElevatedButton.icon(
                onPressed: _validateAndNavigate,
                icon: Icon(
                  Icons.keyboard_double_arrow_right_sharp,
                  color: Colors.white,
                ),
                label: Text(
                  'Show Info',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    minimumSize: Size(150, 50)),
              ),
              Gap(20),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(),
                      ),
                    );
                  },
                  icon: Icon(Icons.report),
                  label: Text(
                    "Blood Pressure Chart",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
