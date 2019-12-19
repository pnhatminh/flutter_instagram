import 'package:flutter/material.dart';
import 'package:flutter_instagram_firebase/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  static final String id = "signup_screen";
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username, _email, _password, _password2;
  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_email);
      print(_password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Instagram",
              style: TextStyle(fontFamily: "Billabong", fontSize: 50.0)),
          Form(
            key: _formKey,
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Email"),
                  validator: (input) => !input.contains("@")
                      ? "Please enter a valid email"
                      : null,
                  onSaved: (input) => _email = input,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Username"),
                    validator: (input) =>
                        input.trim().isEmpty ? "Please enter a valid name" : null,
                    onSaved: (input) => _username = input,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Password"),
                  validator: (input) =>
                      input.length < 6 ? "Must be at least 6 characters" : null,
                  onSaved: (input) => _password = input,
                  obscureText: true, // Invisible
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Re-enter Password"),
                  validator: (input) => input.length != _password
                      ? "Password does not match"
                      : null,
                  onSaved: (input) => _password2 = input,
                  obscureText: true, // Invisible
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 250.0,
                child: FlatButton(
                    onPressed: _submit,
                    color: Colors.blue,
                    padding: EdgeInsets.all(10.0),
                    child: Text("Signup",
                        style: TextStyle(color: Colors.white, fontSize: 18.0))),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 250.0,
                child: FlatButton(
                    onPressed: () => Navigator.pop(context),
                    color: Colors.blue,
                    padding: EdgeInsets.all(10.0),
                    child: Text("Back to Login",
                        style: TextStyle(color: Colors.white, fontSize: 18.0))),
              )
            ]),
          ),
        ],
      ),
    ));
  }
}
