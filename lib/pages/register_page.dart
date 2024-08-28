import 'package:chatapp1/components/my_button.dart';
import 'package:chatapp1/components/my_textfield.dart';
import 'package:chatapp1/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpwController = TextEditingController();

  RegisterPage({super.key, this.onTap});
  final void Function()? onTap;

  void register(BuildContext context) {
    final _auth = AuthService();
    if (_passwordController.text == _confirmpwController.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text, _passwordController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Password don't match!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 30),
          Text(
            "lets create account",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          MyTextfield(
            obscureText: false,
            hinText: "emil",
            controller: _emailController,
          ),
          const SizedBox(
            height: 10,
          ),
          MyTextfield(
            obscureText: true,
            hinText: "password",
            controller: _passwordController,
          ),
          const SizedBox(
            height: 10,
          ),
          MyTextfield(
            obscureText: true,
            hinText: "confirm password",
            controller: _confirmpwController,
          ),
          const SizedBox(
            height: 25,
          ),
          MyButton(
            onTap: () => register(context),
            text: "register",
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "already account ?",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "login Now",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
