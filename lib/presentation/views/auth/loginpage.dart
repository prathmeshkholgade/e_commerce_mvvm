import 'package:e_commerce_app/di/injection.dart';
import 'package:e_commerce_app/presentation/bloc/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Loginpage extends StatefulWidget {
  Loginpage({super.key});
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formkey = GlobalKey<FormState>();
  final authControler = sl<AuthController>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 60),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 70),
                child: Container(
                  margin: EdgeInsets.only(top: 35),
                  child: Text(
                    "hopworks",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Welcome Back!",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(
                              50,
                            ), // Light shadow color
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          hintText: "UserName",
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 5,
                          ),
                          labelText: "UserName",
                          border: InputBorder.none,
                          labelStyle: TextStyle(fontSize: 13),
                          hintStyle: TextStyle(fontSize: 12),
                        ),
                        controller: userNameController,
                        validator:
                            (value) =>
                                value!.isEmpty ? "Please enter username" : null,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(
                              50,
                            ), // Light shadow color
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        style: TextStyle(fontSize: 14),
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          hintText: "Password",
                          isDense: true,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 15,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 5,
                          ),
                          labelText: "Password",
                          border: InputBorder.none,
                          labelStyle: TextStyle(fontSize: 13),
                          hintStyle: TextStyle(fontSize: 12),
                        ),
                        controller: passwordController,
                        validator:
                            (value) =>
                                value!.isEmpty ? "Please enter username" : null,
                      ),
                    ),
                    SizedBox(height: 20),

                    GestureDetector(
                      onTap: () {
                        // if (_formkey.currentState!.validate()) {
                        authControler.loginUser(
                          userNameController.text.trim(),
                          passwordController.text.trim(),
                        );
                        // }
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Obx(
                          () =>
                              authControler.isLoading.value
                                  ? Center(
                                    child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        padding: EdgeInsets.all(0),
                                        color:
                                            Theme.of(
                                              context,
                                            ).secondaryHeaderColor,
                                      ),
                                    ),
                                  )
                                  : Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text("Or Sign in with social account"),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.facebook),
                  SizedBox(width: 40),
                  Icon(FontAwesomeIcons.google),
                ],
              ),
              SizedBox(height: 70),
              RichText(
                text: TextSpan(
                  text: "Don't have an account?",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: "SIGN UP",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
