import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecommerce_app/views/screens/bottom_nva_bar.dart';
import 'package:ecommerce_app/controllers/auth_controllers.dart';
import 'package:ecommerce_app/utils/constants/all_constants.dart';
import 'package:ecommerce_app/views/screens/auth/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Uint8List? _image;
  bool _isLoading = false;

  selectImage() async {
    Uint8List _imageFromGallery =
        await AuthController().pickImage(ImageSource.gallery);
    setState(() => _image = _imageFromGallery);
  }

  _signUpUser() async {
    setState(() => _isLoading = true);

    String res = await AuthController().signUpUser(
      _fullNameController.text,
      _usernameController.text,
      _emailController.text,
      _passwordController.text,
      _image,
    );

    setState(() => _isLoading = false);

    if (res != 'success') {
      return showSnackBar(res, context);
    } else {
      showSnackBar('Account has been created.', context);
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
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            _image != null
                                ? CircleAvatar(
                                    radius: 80,
                                    backgroundColor: AppColors.spaceCadet,
                                    backgroundImage: MemoryImage(_image!),
                                  )
                                : const CircleAvatar(
                                    radius: 80,
                                    backgroundColor: AppColors.spaceCadet,
                                    backgroundImage: NetworkImage(
                                      AppConstants.defaultUserImage,
                                    ),
                                  ),
                            Positioned(
                              right: -10,
                              bottom: 6,
                              child: IconButton(
                                onPressed: selectImage,
                                icon: const Icon(
                                  Icons.add_a_photo_outlined,
                                ),
                              ),
                            ),
                          ],
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
                          _signUpUser();
                          _fullNameController.clear();
                          _usernameController.clear();
                          _emailController.clear();
                          _passwordController.clear();
                          _image!.clear();
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
                            style: TextStyle(
                                fontSize: 18, color: AppColors.lightGrey),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
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
