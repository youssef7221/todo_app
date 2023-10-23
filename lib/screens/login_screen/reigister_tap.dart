import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase/firebasefunctions.dart';
import 'package:todo/screens/homescreen/homescreen.dart';
import 'package:todo/screens/login_screen/login_screen.dart';
import 'package:todo/screens/models/usermodel.dart';

class RegisterTab extends StatelessWidget {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController ageTextEditingController = TextEditingController();

  bool obscuredText = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
                controller: emailTextEditingController,
                decoration: InputDecoration(
                    label: Text("Email")
                ), validator: (value) {
              if(value == null ||value.isEmpty || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*"
              r"+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value))
              {
                return "please Enter Your Email";
              }
              return null ;
            }

            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              obscureText: obscuredText,
              controller: passwordTextEditingController,
              validator: (value) {
                if(value == null||value.isEmpty )
                {
                  return "please Enter At least 6 characters";
                }
                return null ;
              },
              decoration: InputDecoration(
                  label: Text("Password"),

              ),
            ),
            TextFormField(
                controller: ageTextEditingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    label: Text("Age")
                ), validator: (value) {
              if(value == null ||value.isEmpty )
              {
                return "please Enter Your Age";
              }
              return null ;
            }

            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
                controller: nameTextEditingController,
                decoration: InputDecoration(
                    label: Text("Name")
                ), validator: (value) {
              if(value == null ||value.isEmpty )
              {
                return "please Enter Your Name";
              }
              return null ;
            }

            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: () {
              if (formKey.currentState!.validate()) {
                FirebaseFunctions.createUser(nameTextEditingController.text,int.parse(ageTextEditingController.text),
                    emailTextEditingController.text,passwordTextEditingController.text
                    ,()
                {
                Navigator.pushNamedAndRemoveUntil(context, LoginScreen.route, (route) => false);
                },(error){
                  showDialog(context: context,
                    barrierDismissible: false,
                    builder: (context){
                   return AlertDialog(
                      title: Text("Error"),
                      content: Text(error.toString()),
                      actions: [
                        ElevatedButton(onPressed: (){
                          Navigator.pop(context);
                        }, child:Text("Ok"))
                      ],
                    );
                  },);
                });
              }
            }, child: Text("Sign Up"),style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).hintColor
            ),)
          ],
        ),
      ),
    );
  }
}
