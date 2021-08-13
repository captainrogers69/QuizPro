import 'package:flutter/material.dart';
import 'package:flutter_riverpod_quiz/homequiz.dart';

class login extends StatefulWidget {
  //const login({ Key? key }) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  bool hidepassword= true; 

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
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 95.0,),
                    CircleAvatar(
                      maxRadius: 80.0,
                      minRadius: 30.0,
                      backgroundImage: AssetImage('assets/homequiz.jpg',)
                    ),
                    SizedBox(height: 20.0,),
                    Column(
                      children: [
                        Text("Log in",style: TextStyle(fontSize: 32,fontFamily: 'JosefinSans',fontWeight: FontWeight.bold,
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
                        //},
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
                        labelText: "Enter your Username",
                        labelStyle: TextStyle(
                            color: Colors.purple,
                            fontSize: 20,
                            //fontStyle: FontStyle.bold
                            ),
                      ),
                      maxLength: 14,
                  ),
                    ),
                    SizedBox(height: 5.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 2),
                      child: TextField(
                        /*onChanged: (value2){
                          global.password=value2;
                        },*/
                        obscureText: hidepassword,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: _togglePasswordView,
                          child: Icon(Icons.visibility),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.orange, width: 2),
                        ),
                        prefixIcon: Icon(
                          Icons.password_outlined,
                          color: Colors.black,
                        ),
                        labelText: "Enter your Password",
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
                    child: Text('Log In', style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20, color: Colors.black))),
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
  void _togglePasswordView(){
   hidepassword = !hidepassword;
   setState(() {});
}
}
