import 'package:chatapptute/services/auth/auth_service.dart';
import 'package:chatapptute/components/my_button.dart';
import 'package:chatapptute/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  // email and pw text controllers
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _pwcontroller = TextEditingController();
  final TextEditingController _confirmPwcontroller = TextEditingController();

  // tap to go to register page
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  // register method
  void register(BuildContext context) {
    // get auth service
    final _auth = AuthService();

    // password match -> create user
    if (_pwcontroller.text == _confirmPwcontroller.text) {
      try {
        _auth.signUpWithEmailPassword(
          _emailcontroller.text,
          _pwcontroller.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }
    // passwords dont match -> tell user to fix

    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords don't match!"),
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
              "Let's create an account for you",
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

            const SizedBox(height: 10),

            // confirm pw text field
            MyTextField(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _confirmPwcontroller,
            ),

            // 간격
            const SizedBox(height: 25),

            // login button
            MyButton(
              text: "Register",
              onTap: () => register(context),
            ),

            // 간격
            const SizedBox(height: 25),

            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now",
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
