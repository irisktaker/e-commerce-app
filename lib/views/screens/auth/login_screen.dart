import 'package:flutter/material.dart';

import 'package:ecommerce_app/views/screens/bottom_nva_bar.dart';
import 'package:ecommerce_app/controllers/auth_controllers.dart';
import 'package:ecommerce_app/views/screens/auth/register_screen.dart';

import '/utils/constants/all_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  _loginUser() async {
    setState(() => _isLoading = true);

    String res = await AuthController().loginUser(
      _emailController.text,
      _passwordController.text,
    );

    res = 'success';
    setState(() => _isLoading = false);

    if (res != 'success') {
      return showSnackBar(res, context);
    } else {
      showSnackBar('Login successfully', context);
      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainBottomNavBar(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        decoration: kTextInputDecoration.copyWith(
                          hintText: "Enter your email",
                        ),
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        decoration: kTextInputDecoration.copyWith(
                          hintText: "Enter your password",
                        ),
                        obscureText: true,
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(height: 26),
                      ElevatedButton(
                        onPressed: () {
                          _loginUser();
                          _emailController.clear();
                          _passwordController.clear();
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Need an account:",
                            style: TextStyle(
                                fontSize: 18, color: AppColors.lightGrey),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen()));
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
