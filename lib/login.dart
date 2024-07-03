import 'package:flutter/material.dart';
import 'package:flutter_revived/backendfunctions.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {

  final TextEditingController _useremailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bggradient.jpg'),
                fit: BoxFit.cover
            )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 35, top: 40),
                child: const Text('Welcome', style: TextStyle(
                    color: Colors.white,
                    fontSize: 33
                ),),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5,
                      right: 35,
                      left: 35),
                  child: Column(
                    children: [
                      TextField(
                        controller: _useremailcontroller,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))
                        ),
                      ),
                      SizedBox(height: 30,),
                      TextField(
                        obscureText: true,
                        controller: _passwordcontroller,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Sign In', style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.w700
                        ),),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xff4c505b),
                            child: IconButton(
                              color: Colors.white,
                              onPressed: () async {
                                final email = _useremailcontroller.text;
                                final password = _passwordcontroller.text;

                                try {
                                  await BackendService.loginUser(email, password);
                                  print("\N\N\NUser successfully logged in\n\n\n");
                                } catch (e) {
                                  print("Shit happened and login failed,\nThe reason being");
                                  print(e);
                                }
                              },
                              icon: Icon(Icons.arrow_forward),
                            ),
                          )],
                      ),
                      SizedBox(height: 30,),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: (){
                                Navigator.pushNamed(context, 'register');
                              },
                              child: Text('Sign up', style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  color: Color(0xff4c505b)
                              ),),
                            ),

                            TextButton(
                              onPressed: (){},
                              child: Text('Forgot Password', style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  color: Color(0xff4c505b)
                              ),),
                            )]
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}