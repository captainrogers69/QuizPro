import 'package:flutter/material.dart';
import 'package:flutter_riverpod_quiz/homequiz.dart';

class Register extends StatefulWidget {
  //const register({ Key? key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //   image: AssetImage('lib/img/backg11.jpeg'),
              //   fit: BoxFit.cover
              //   ),
              // ),
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
                        // onChanged: (value){
                        //   global.username=value;
                        // },
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
                        labelText: "Username",
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
                            //fontStyle: FontStyle.bold
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
                            //fontStyle: FontStyle.bold
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
                  onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> QuizScreen()));
                },
                ),
              ),
                  ],
                ),
              )
        ]
      ),
    );
  }
}