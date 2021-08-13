import 'package:flutter/material.dart';
// import 'package:flutter_riverpod_quiz/homequiz.dart';
import 'package:flutter_riverpod_quiz/login.dart';
import 'package:flutter_riverpod_quiz/register.dart';

class Homestart extends StatefulWidget {
  //const Homestart({ Key? key }) : super(key: key);

  @override
  _HomestartState createState() => _HomestartState();
}

class _HomestartState extends State<Homestart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [ Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFD4418E), Color(0xFF0652C5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
              )
            ),
          child: SingleChildScrollView(
            child:
                  Center(child: Column(
              children: [
                  SizedBox(height: 95.0,),
                  CircleAvatar(
                  backgroundImage: AssetImage('assets/homequiz.jpg'),
                  radius: 80.0,
                ),
                  SizedBox(height: 45.0),
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
                        child: Text('Log In', style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20, color: Colors.black))),
                      onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> login()));
                    },
                    ),
                  ),
                SizedBox(height: 16,),
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
                        child: Text('Register', style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20, color: Colors.black))),
                      onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> Register()));
                    },
                    ),
                  ),
                  const SizedBox(height: 150.0,),
                  Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.white,
                  child: const Text('Follow us on Social Media', style: TextStyle(fontWeight: FontWeight.bold),)
                ),
                  const SizedBox(height: 30.0,),
                  Row(
                  children: [
                    const SizedBox(width: 160.0,),
                    Container(
                      padding: const EdgeInsets.all(2.0),
                      color: Colors.white,
                      child: const Icon(Icons.facebook),
                    ),
                    const SizedBox(width: 5.0,),
                    Container(
                      padding: const EdgeInsets.all(2.0),
                      color: Colors.white,
                      child: const Icon(Icons.subscriptions)
                    ),
                    const SizedBox(width: 5.0,),
                    Container(
                      padding: const EdgeInsets.all(2.0),
                      color: Colors.white,
                      child: const Icon(Icons.mail),
                    )
                  ],
                ),
                SizedBox(height: 45.0)
              ],
            ),
            )
            
          ),
        ),
        ]
      ),
    );
  }
}