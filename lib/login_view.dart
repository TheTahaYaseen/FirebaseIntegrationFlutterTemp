import 'package:flutter/material.dart';
import 'package:nov14/home_view.dart';
import 'package:nov14/services/auth_services.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(hintText: "Email"),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                controller: passController,
                decoration: const InputDecoration(hintText: "Password"),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (emailController.text.isEmpty ||
                    passController.text.isEmpty) {
                  print("Enter email or password");
                  return;
                }
                var credential = await AuthServices().loginUser(
                  email: emailController.text,
                  password: passController.text,
                );
                if (credential != null) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeView()));
                }
              },
              child: const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
