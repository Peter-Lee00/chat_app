import 'package:chatapptute/services/auth/auth_service.dart';
import 'package:chatapptute/components/my_button.dart';
import 'package:chatapptute/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // email and pw text controllers
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _pwcontroller = TextEditingController();

  // tap to go to register page
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  // login method
  void login(BuildContext context) async {
    // auth service
    final authService = AuthService();

    // try login
    try {
      await authService.signInWithEmailPassword(
        _emailcontroller.text,
        _pwcontroller.text,
      );
    }

    // catch errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            // 간격
            const SizedBox(height: 50),

            // welcomeback message
            Text(
              "Welcome back, you've been missed",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            // 간격
            const SizedBox(height: 30),

            // email text field
            MyTextField(
              hintText: "Email",
              obscureText: false,
              controller: _emailcontroller,
            ),

            // 간격
            const SizedBox(height: 10),

            // pw text field
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: _pwcontroller,
            ),

            // 간격
            const SizedBox(height: 25),

            // login button
            MyButton(
              text: "Login",
              onTap: () => login(context),
            ),

            // 간격
            const SizedBox(height: 25),

            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a memeber? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
