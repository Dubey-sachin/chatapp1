import 'package:chatapp1/pages/login_page.dart';
import 'package:chatapp1/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOeRegister extends StatefulWidget {
  const LoginOeRegister({super.key});

  @override
  State<LoginOeRegister> createState() => _LoginOeRegisterState();
}

class _LoginOeRegisterState extends State<LoginOeRegister> {
  bool showLoginPage = true;
  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglePage,
      );
    } else {
      return RegisterPage(
        onTap: togglePage,
      );
    }
  }
}
