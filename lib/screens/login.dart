import 'package:ecom_fakestoreapi/widgets/EcomElevatedButton.dart';
import 'package:ecom_fakestoreapi/widgets/EcomTextField.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Flexible(
                child: Text(
                  'Enter Email and Passsword to Login',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              EcomTextField(
                controller: usernameController,
                labelText: "Username",
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 8),
              EcomTextField(
                controller: passwordController,
                labelText: "Password",
                keyboardType: TextInputType.visiblePassword,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: EcomElevatedButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/home');
          },
          child: const Text(
            'Login',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
