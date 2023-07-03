import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../palatte.dart';
import '../widgets/widgets.dart';
import '../widgets/background_image.dart'; // Import the BackgroundImage widget

class RegisterPage extends StatelessWidget {
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
                        'Register',
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
                              icon: FontAwesomeIcons.user,
                              hint: 'First Name',
                              inputType: TextInputType.text,
                              inputAction: TextInputAction.next,
                              key: UniqueKey(),
                            ),
                            TextInput(
                              icon: FontAwesomeIcons.user,
                              hint: 'Last Name',
                              inputType: TextInputType.text,
                              inputAction: TextInputAction.next,
                              key: UniqueKey(),
                            ),
                            TextInput(
                              icon: FontAwesomeIcons.solidEnvelope,
                              hint: 'Email',
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                              key: UniqueKey(),
                            ),
                            PasswordInput(
                              icon: FontAwesomeIcons.lock,
                              hint: 'Password',
                              inputAction: TextInputAction.done,
                              key: UniqueKey(),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            RoundedButton(
                              buttonText: 'Register',
                              key: UniqueKey(),
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Create New Account',
                                style: kBodyText,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
