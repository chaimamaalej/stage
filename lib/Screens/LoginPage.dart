import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../palatte.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/response/login_response.dart';
import '../widgets/widgets.dart';
import '../widgets/background_image.dart'; // Import the BackgroundImage widget

class LoginPage extends StatelessWidget {
  @override  
  _LoginPageState createState() => new _LoginPageState();  
}  
  
enum LoginStatus { notSignIn, signIn }  
  
class _LoginPageState extends State<LoginPage> implements LoginCallBack {  
  LoginStatus _loginStatus = LoginStatus.notSignIn;  
  BuildContext _ctx;  
  bool _isLoading = false;  
  final formKey = new GlobalKey<FormState>();  
  final scaffoldKey = new GlobalKey<ScaffoldState>();  
    
  String _username, _password;  
  
  LoginResponse _response;  
  
  _LoginPageState() {  
    _response = new LoginResponse(this);  
  }  
  
  void _submit() {  
    final form = formKey.currentState;  
  
    if (form!.validate()) {  
      setState(() {  
        _isLoading = true;  
        form!.save();  
        _response.doLogin(_username, _password);  
      });  
    }  
  }  
    
  
  void _showSnackBar(String text) {  
    scaffoldKey.currentState.showSnackBar(new SnackBar(  
      content: new Text(text),  
    ));  
  }  
  
  var value;  
 getPref() async {  
   SharedPreferences preferences = await SharedPreferences.getInstance();  
   setState(() {  
     value = preferences.getInt("value");  
  
     _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;  
   });  
 }  
  
   signOut() async {  
    SharedPreferences preferences = await SharedPreferences.getInstance();  
    setState(() {  
      preferences.setInt("value", null);  
      preferences.commit();  
      _loginStatus = LoginStatus.notSignIn;  
    });  
  }  
  
  @override  
  void initState() {  
    super.initState();  
    getPref();  
  }  
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(key: UniqueKey()),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    child: Center(
                      child: Text(
                        'Log In',
                        style: kHeading,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextInput(
                              icon: FontAwesomeIcons.solidEnvelope,
                              hint: 'Email',
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next, key: UniqueKey(),
                            ),
                            PasswordInput(
                              icon: FontAwesomeIcons.lock,
                              hint: 'Password',
                              inputAction: TextInputAction.done, key: UniqueKey(),
                            ),
                            Text(
                              'Forgot Password?',
                              style: kBodyText,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            RoundedButton(
                              buttonText: 'Login', key: UniqueKey(),
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: Colors.white, width: 1),
                                ),
                              ),
                              child: Text(
                                'CreateNewAccount',
                                style: kBodyText,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
