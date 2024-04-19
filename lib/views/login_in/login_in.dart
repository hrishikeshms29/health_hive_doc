import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_hive_doc/controllers/auth_controller.dart';

class LoginDoctorPage extends StatelessWidget {
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50], // Light shade of deep purple
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4, // Add elevation to the card
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners for the card
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Doctor Login',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.deepPurple, // Deep purple color for the title
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _authController.emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email, color: Colors.deepPurple), // Deep purple email icon
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _authController.passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock, color: Colors.deepPurple), // Deep purple lock icon
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _authController.loginDoctor(
                        _authController.emailController.text.trim(),
                        _authController.passwordController.text.trim(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple, // Deep purple color for the button
                      elevation: 0, // No elevation for the button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Rounded corners for the button
                      ),
                    ),
                    child: Text('Login', style: TextStyle(color: Colors.white)), // White text color for the button
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
