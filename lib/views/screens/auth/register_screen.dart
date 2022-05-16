import 'package:ecommerce_app/views/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/constants/all_constants.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _fullNameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    SizeConfig().init(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      print('Take A Photo');
                    },
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: AppColors.spaceCadet,
                        ),
                        Positioned(
                          right: 6,
                          bottom: 16,
                          child: Icon(Icons.add_a_photo_outlined),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 26),
                TextField(
                  decoration: kTextInputDecoration.copyWith(
                    hintText: "Enter your full name",
                  ),
                  controller: _fullNameController,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: kTextInputDecoration.copyWith(
                    hintText: "Enter your username",
                  ),
                  controller: _usernameController,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 16),
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
                    print("You signed in");
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account:",
                      style:
                          TextStyle(fontSize: 18, color: AppColors.lightGrey),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        "Login",
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
