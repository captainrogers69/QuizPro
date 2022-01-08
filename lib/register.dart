import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod_quiz/controllers/auth_controller.dart';
import 'package:flutter_riverpod_quiz/homequiz.dart';
import 'package:flutter_riverpod_quiz/services/auth_services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Register extends HookWidget {

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();  
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: useProvider(loadingStateProvider).state,
      progressIndicator: CircularProgressIndicator(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFD4418E), Color(0xFF0652C5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
              )
            ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 95.0,),
                      CircleAvatar(
                        radius: 80.0,
                        backgroundImage: AssetImage('assets/homequiz.jpg'),
                      ),
                      SizedBox(height: 20.0,),
                      Column(
                        children: [
                          Text("Create Account",style: TextStyle(fontSize: 28.0,fontFamily: 'JosefinSans',fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 15, 2),
                        child: TextField(
                          controller: _usernameController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.orange, width: 2),
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          labelText: "Enter Your Name",
                          labelStyle: TextStyle(
                              color: Colors.purple,
                              fontSize: 20,
                              //fontStyle: FontStyle.bold
                              ),
                        ),
                        maxLength: 14,
                    ),
                      ),
                      SizedBox(height: 1.0),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 15, 2),
                        child: TextField(
                          controller: _emailController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.orange, width: 2),
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          labelText: "your email address",
                          labelStyle: TextStyle(
                              color: Colors.purple,
                              fontSize: 20,
                              ),
                        ),
                        maxLength: 30,
                    ),
                      ),
                      SizedBox(height: 1.0),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 15, 2),
                        child: 
                        TextField(
                          controller: _passwordController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.orange, width: 2),
                          ),
                          prefixIcon: Icon(
                            Icons.password,
                            color: Colors.black,
                          ),
                          labelText: "Create a Password",
                          labelStyle: TextStyle(
                              color: Colors.purple,
                              fontSize: 20,
                              ),
                        ),
                        maxLength: 20,
                    ),
                      ),
                      Container(
                  height: 40.0,
                  width: 300.0,
                  //color: Colors.white,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: GestureDetector(
                    child: Center(
                      child: Text('Create Your Account', style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20, color: Colors.black))),
                    onTap: () async {
                      
                              if (_usernameController.text.isNotEmpty) {
                                context.read(loadingStateProvider).state = true;
                                await context
                                    .read(authControllerProvider.notifier)
                                    .signUp(
                                        _emailController.text.trim(),
                                        _passwordController.text.trim(),
                                        context);
                                await context
                                    .read(authControllerProvider.notifier)
                                    .setUserName(
                                        _usernameController.text.trim());
                                context.read(loadingStateProvider).state =
                                    false;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuizScreen(),
                                  ),
                                );
                              } else {
                                print("Please provide your name");
                              }

                              // Navigator.pop(context);
                            
                  },
                  ),
                ),
                    ],
                  ),
                )
          ]
        ),
      ),
    );
  }
}