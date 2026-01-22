import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_autoroute_shell_app/router/app_router.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  final VoidCallback? onLoginCallback;
  const LoginPage({super.key, required this.onLoginCallback});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/background.png'), fit: BoxFit.fill),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: FadeInUp(
                        duration: Duration(seconds: 1),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage('assets/images/light-1.png')),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: FadeInUp(
                        duration: Duration(milliseconds: 1200),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage('assets/images/light-2.png')),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: FadeInUp(
                        duration: Duration(milliseconds: 1300),
                        child: Container(
                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/clock.png'))),
                        ),
                      ),
                    ),
                    Positioned(
                      child: FadeInUp(
                        duration: Duration(milliseconds: 1600),
                        child: Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: Color.fromRGBO(143, 148, 251, .2), blurRadius: 20.0, offset: Offset(0, 10)),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email or Phone number",
                                hintStyle: TextStyle(color: Colors.grey[400]),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email or phone number';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey[400]),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    FadeInUp(
                      duration: Duration(milliseconds: 1900),
                      child: InkWell(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [Color.fromRGBO(143, 148, 251, 1), Color.fromRGBO(143, 148, 251, .6)],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        onTap: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          widget.onLoginCallback?.call();
                          context.router.replaceAll([const AppShellRoute()]);
                        },
                      ),
                    ),
                    SizedBox(height: 70),
                    FadeInUp(
                      duration: Duration(milliseconds: 2000),
                      child: Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1))),
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
