import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';
import '../utils/size_config.dart';
import '../widgets/logo.dart';
import 'signup.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

  Future sendResetPasswordEmail() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Password reset email sent succesfully"),
      ));
      Navigator.of(context).popUntil((route) => route.isFirst);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
      Navigator.of(context).pop();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SizeConfig().init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaterialTheme.lightScheme().primary,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Column(
                        children: [
                          SizedBox(
                            height: 75,
                          ),
                          Logo(
                            height: 100,
                            width: 174,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                            color: MaterialTheme.lightScheme().surface,
                            borderRadius: BorderRadius.circular(24)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Receive a link on your email to reset your password",
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                              autocorrect: false,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!EmailValidator.validate(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14))),
                                contentPadding:
                                    EdgeInsets.fromLTRB(16, 14, 16, 14),
                                hintText: 'Enter Email',
                                labelText: 'Email',
                                errorStyle:
                                    TextStyle(fontSize: 12, height: 0.75),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth,
                              child: FilledButton(
                                onPressed: () {
                                  sendResetPasswordEmail();
                                },
                                child: const Text(
                                  "Send Email",
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Don't forget to check your spam folder",
                            ),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an Account?",
                            style: TextStyle(
                              color: MaterialTheme.lightScheme().onPrimary,
                            ),
                          ),
                          TextButton(
                            onPressed: () => {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => SignUp(
                                            isLoading: false,
                                          )))
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: MaterialTheme.lightScheme().onPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  checkEmailVerified() {}
}
