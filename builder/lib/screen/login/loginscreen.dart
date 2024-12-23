import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key,});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(image: DecorationImage(image:AssetImage('assets/loginBackgroudAsset/loginback.jpg'))),
      child:  Form(
        child: Container(
          margin: const EdgeInsets.fromLTRB(250, 0, 250, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('LOGIN',style: TextStyle(fontSize: 30,color: Colors.blue),),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  label: Text('Username')
                ),
              ),
              const SizedBox(height: 10,),
              const TextField(
                decoration: InputDecoration(
                  label: Text('Password')
                ),
              ),
              TextButton(onPressed: (){}, child: const Text('Forgot Password',style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline,))),
              OutlinedButton(
                onPressed: (){},
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                ),
                child: const Text("Login"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Don\'t have account?',style: TextStyle(color: Colors.black),),
                  TextButton(onPressed: (){}, child: const Text('Signup',style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline,)))
                ],
              )
              
            ],
          ),
        )),
    );
  }
}