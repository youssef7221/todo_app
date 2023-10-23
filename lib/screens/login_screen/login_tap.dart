import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/homescreen/homescreen.dart';

import '../../firebase/firebasefunctions.dart';
import '../provider/settings_provider.dart';

class LoginTab extends StatefulWidget {
  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
   TextEditingController emailTextEditingController = TextEditingController();
   TextEditingController passwordTextEditingController = TextEditingController();
   bool obscuredText = true;
   GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    settingsprovider provider = Provider.of(context);
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
                if(value == null||value.isEmpty || value.length < 6)
                  {
                    return "please Enter Your Password";
                  }
                return null ;
              },
              decoration: InputDecoration(
                  label: Text("Password"),
                suffixIcon: IconButton(
                    onPressed: () {
                      obscuredText = !obscuredText;
                      setState(() {});
                }, icon:obscuredText ? Icon(Icons.visibility) : Icon(Icons.visibility_off))
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: () {
              if (formKey.currentState!.validate()) {
                provider.initUser();
                FirebaseFunctions.loginUser(emailTextEditingController.text, passwordTextEditingController.text,
                    (){
                  Navigator.popAndPushNamed(context, home.route);
                    } , (error){
                  showDialog(context: context,
                    barrierDismissible: false,
                    builder: (context){
                      return AlertDialog(
                        title: Text("Error"),
                        content: Text(error),
                        actions: [
                          ElevatedButton(onPressed: (){
                            Navigator.pop(context);
                          }, child:Text("Ok"))
                        ],
                      );
                    },);
                });
              }

            }, child: Text("Login"),style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).hintColor
            ),)
          ],
        ),
      ),
    );
  }
}
