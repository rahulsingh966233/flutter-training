import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutterchat/Widgets/User_Image_Picker.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn, this.isLoading);

  final bool isLoading;
  final void Function(String email, String password, String userName,
      File image, bool isLogin  ,BuildContext ctx) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  bool isLogin = true;
  final formKey = GlobalKey<FormState>();
  String userEmail = '';
  String userName = '';
  String userPassword = '';
  var userImageFile;

  void pickedImage(File image){
       userImageFile = image;
  }

  void trySubmit() {
    final isValid = formKey.currentState.validate();
    FocusScope.of(context).unfocus();


    if(userImageFile == null && !isLogin){
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Pleace pick an image'), backgroundColor: Theme.of(context).errorColor ,));
      return;
    }

    if (isValid) {
      formKey.currentState.save();
      widget.submitFn(userEmail.trim(), userPassword.trim(), userName.trim(), userImageFile, isLogin, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(17),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if(!isLogin)  UserImagePicker(pickedImage) ,
                  TextFormField(
                    key: ValueKey('Email'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Email address'),
                    onSaved: (value) {
                      userEmail = value;
                    },
                  ),
                  if (!isLogin)
                    TextFormField(
                      key: ValueKey('uname'),
                      decoration: InputDecoration(labelText: "Username"),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        userName = value;
                      },
                    ),
                  TextFormField(
                    key: ValueKey('pass'),
                    decoration: InputDecoration(labelText: "Password"),
                    validator: (value) {
                      if (value.isEmpty || value.length < 7) {
                        return 'Password must be at least 7 characters long';
                      }
                      return null;
                    },
                    obscureText: true,
                    onSaved: (value) {
                      userPassword = value;
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  if (widget.isLoading) CircularProgressIndicator(),
                  if (!widget.isLoading)
                    RaisedButton(
                      child: Text(isLogin ? "Login" : "Signup"),
                      onPressed: trySubmit,
                    ),
                  if (!widget.isLoading)
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(isLogin
                          ? "Create new account"
                          : 'I already have an account'),
                      onPressed: () {
                        setState(() {
                          isLogin = !isLogin;
                        });
                      },
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
