import 'package:amazon_clone_app/common/widgets/custom_button.dart';
import 'package:amazon_clone_app/common/widgets/custom_textfield.dart';
import 'package:amazon_clone_app/constants/global_variable.dart';

import 'package:flutter/material.dart';

enum Auth{
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();


    @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: GlobalVariable.greyBackgroundCOlor,
        body:SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
               const Text("Welcome",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500
                ),
                
                ),
                ListTile(
                  tileColor: _auth == Auth.signup ? GlobalVariable.backgroundColor : GlobalVariable.greyBackgroundCOlor,
                  title:  const Text("Create Account", 
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  )
                  ),
                leading: Radio(
                  activeColor: GlobalVariable.secondaryColor,
                  value: Auth.signup,
                 groupValue: _auth, 
                 onChanged: (Auth? val){
                      setState(() {
                        _auth = val! ;
                      });

                 }),

                ),
                if(_auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: GlobalVariable.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(controller: _nameController,
                        hintText: "Name",
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        CustomTextField(controller: _emailController,
                        hintText: "Email",
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        CustomTextField(controller: _passwordController,
                        hintText: "Password",
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        CustomButton(text: "Sign Up", onTap: (){})
                      ],
                    ),
                
                    ),
                ),

                ListTile(
                  title:  const Text("Sign in Account", 
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  )
                  ),
                leading: Radio(
                  activeColor: GlobalVariable.secondaryColor,
                  value: Auth.signin,
                 groupValue: _auth, 
                 onChanged: (Auth? val){
                      setState(() {
                        _auth = val! ;
                      });

                 }),

                ),

                if(_auth == Auth.signin)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: GlobalVariable.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        
                        CustomTextField(controller: _emailController,
                        hintText: "Email",
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        CustomTextField(controller: _passwordController,
                        hintText: "Password",
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        CustomButton(text: "Sign In", onTap: (){})
                      ],
                    ),
                
                    ),
                ),

              ]),
          ) ,
          )

    );
  }
}