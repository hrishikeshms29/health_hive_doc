import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_hive_doc/views/Profile_update/profile_update.dart';


import '../../consts/images.dart';
import '../../controllers/auth_controller.dart';
import '../login_in/login_in.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.zero,
          color: colorScheme.background,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              Center(
                child: Image.asset(logo, width: 200), // Replace with your logo asset path
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Enter Name",
                              prefixIcon: Icon(Icons.person),
                            ),
                            controller: controller.fullnameController,
                          ),
                          SizedBox(height: 16),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Enter your Email",
                              prefixIcon: Icon(Icons.email),
                            ),
                            controller: controller.emailController,
                          ),
                          SizedBox(height: 16),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Enter your Password",
                              prefixIcon: Icon(Icons.lock),
                            ),
                            obscureText: true,
                            controller: controller.passwordController,
                          ),
                          SizedBox(height: 16),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Confirm your Password",
                              prefixIcon: Icon(Icons.lock_outline),
                            ),
                            obscureText: true,
                          ),
                          SizedBox(height: 32),
                          ElevatedButton(
                            onPressed: () async {
                              String email = controller.emailController.text.trim();
                              String password = controller.passwordController.text.trim();
                              await controller.signupUser(email, password);
                            },
                            child: Text('Sign Up'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: colorScheme.onPrimary,
                              backgroundColor: colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextButton(
                            onPressed: () {
                              Get.to(()=>LoginDoctorPage());
                            },
                            child: Text(
                              "Already have an account? Log in",
                              style: TextStyle(
                                color: colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
