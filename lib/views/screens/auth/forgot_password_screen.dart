import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/constants/all_constants.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        "Forgot Password",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 26),
                      TextField(
                        decoration: kTextInputDecoration.copyWith(
                          hintText: "Enter your email",
                        ),
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 26),
                      ElevatedButton(
                        onPressed: () {
                          _emailController.clear();
                        },
                        child: const Text(
                          "Reset Password",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
