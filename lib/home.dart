// ignore_for_file: prefer_const_constructors

import 'package:blood_pressure/infopage.dart';
import 'package:flutter/material.dart';

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
    return 
    Scaffold(
      appBar: AppBar(
        title: Text(
          'Blood Pressure Input Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: systolicController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Systolic'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: diastolicController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Diastolic'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _validateAndNavigate,
              child: Text('Show Info'),
            ),
          ],
        ),
      ),
    );
  }
}
