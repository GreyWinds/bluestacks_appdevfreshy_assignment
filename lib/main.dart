import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'constants.dart';
import 'login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: ThemeData.dark(),
      home: LoginPage(onSignIn: () => print('dunzo')),
    );
  }
}

class LoginPage extends StatefulWidget {
  final VoidCallback _onSignIn;

  LoginPage({@required onSignIn})
      : assert(onSignIn != null),
        _onSignIn = onSignIn;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  bool _isInAsyncCall = false;

  bool _isInvalidAsyncUser = false;
  bool _isInvalidAsyncPass = false;

  String _username;
  String _password;
  bool _isLoggedIn = false;

  String _validateUserName(String userName) {
    if (userName.length < 3) {
      return 'Username must be at least 3 characters';
    }

    if (userName.length > 11) {
      return 'Username must be less than 11 characters';
    }

    if (_isInvalidAsyncUser) {
      _isInvalidAsyncUser = false;
      return 'Incorrect user name';
    }

    return null;
  }

  String _validatePassword(String password) {
    if (password.length < 3) {
      return 'Password must be at least 3 characters';
    }

    if (password.length > 11) {
      return 'Username must be less than 11 characters';
    }

    if (_isInvalidAsyncPass) {
      _isInvalidAsyncPass = false;
      return 'Incorrect password';
    }

    return null;
  }

  void _submit() {
    if (_loginFormKey.currentState.validate()) {
      _loginFormKey.currentState.save();

      FocusScope.of(context).requestFocus(new FocusNode());

      setState(() {
        _isInAsyncCall = true;
      });

      Future.delayed(Duration(seconds: 4), () {
        final _accountUsername = '9898989898';
        final _accountPassword = 'password123';
        setState(() {
          if (_username == _accountUsername) {
            _isInvalidAsyncUser = false;
            if (_password == _accountPassword) {
              _isInvalidAsyncPass = false;
              _isLoggedIn = true;
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SecondPage();
              }));
            } else
              _isInvalidAsyncPass = true;
          } else {
            _isInvalidAsyncUser = true;

            _isInvalidAsyncPass = false;
          }

          _isInAsyncCall = false;
        });
        if (_isLoggedIn == true) widget._onSignIn();
      });
    }
  }

  static const PrimaryColor = Color(0xFF2E2D32);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
      body: ModalProgressHUD(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 100, width: 100),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: buildLoginForm(context),
              ),
            ],
          ),
        ),
        inAsyncCall: _isInAsyncCall,
        opacity: 0.5,
        progressIndicator: CircularProgressIndicator(),
      ),
    );
  }

  Widget buildLoginForm(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    _loginFormKey.currentState?.validate();
    return Form(
      key: this._loginFormKey,
      child: Column(
        children: [
          Image(
            image: AssetImage(
              'images/logo.gif',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              key: Key('username'),
              decoration: kTextFeildDecoration.copyWith(hintText: 'Username'),
              style: TextStyle(fontSize: 20.0, color: Colors.white),
              validator: _validateUserName,
              onSaved: (value) => _username = value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              key: Key('password'),
              obscureText: true,
              decoration: kTextFeildDecoration.copyWith(hintText: 'Password'),
              style: TextStyle(fontSize: 20.0, color: Colors.white),
              validator: _validatePassword,
              onSaved: (value) => _password = value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Material(
              elevation: 5.0,
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30.0),
              child: MaterialButton(
                onPressed: _submit,
                child: Text('Log In'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
