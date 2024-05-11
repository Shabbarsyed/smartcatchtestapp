import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:smartcatchapp/widgets/logo.dart';
import '../auth/auth.dart';
import '../theme/theme.dart';
import '../utils/size_config.dart';
import 'email_verification.dart';
import 'login.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignUp extends StatefulWidget {
  SignUp({
    Key? key,
    required this.isLoading,
  }) : super(key: key);

  bool isLoading;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool value = false;
  final User? user = Auth().currentUser;
  bool isLogin = true;
  bool visible = false;
  bool confirmationVisible = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  Future<void> _createUserWithEmailAndPassword() async {
    setState(() {
      widget.isLoading = true;
    });
    try {
      await Auth()
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
            name: nameController.text.trim(),
          )
          .then((value) => {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Code Sent to email'),
                  behavior: SnackBarBehavior.floating,
                ))
              })
          .then(
            (value) => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => EmailVerification(),
              ),
            ),
          );
    } on FirebaseAuthException catch (e) {
      setState(() {
        widget.isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message!),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
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
                          height: 35,
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
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Join Smart Catch",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            TextFormField(
                              controller: nameController,
                              autocorrect: false,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.done,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14))),
                                contentPadding:
                                    EdgeInsets.fromLTRB(16, 14, 16, 14),
                                errorStyle:
                                    TextStyle(fontSize: 12, height: 0.75),
                                hintText: 'Enter Name',
                                labelText: 'Name',
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: emailController,
                              autocorrect: false,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.done,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!EmailValidator.validate(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14))),
                                contentPadding:
                                    EdgeInsets.fromLTRB(16, 14, 16, 14),
                                errorStyle:
                                    TextStyle(fontSize: 12, height: 0.75),
                                hintText: 'Enter Email',
                                labelText: 'Email',
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: passwordController,
                              obscureText: !visible,
                              autocorrect: false,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.done,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length <= 5) {
                                  return 'Password must be longer than 6 characters';
                                }
                                if (value.length > 20) {
                                  return 'Password must not be longer than 20 characters';
                                }
                                if (!(RegExp(r'(?=.*[A-Z])\w+')
                                    .hasMatch(value))) {
                                  return 'Password must contain one uppercase letter';
                                }
                                if (!(RegExp(r'(?=.*[a-z])\w+')
                                    .hasMatch(value))) {
                                  return 'Password must contain one lowercase letter';
                                }
                                if (!(RegExp(r'(?=.*?[0-9])')
                                    .hasMatch(value))) {
                                  return 'Password must contain one numeric character';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter Password',
                                labelText: 'Password',
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14))),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(16, 14, 16, 14),
                                errorStyle:
                                    const TextStyle(fontSize: 12, height: 0.75),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    visible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      visible = !visible;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: passwordConfirmationController,
                              obscureText: !confirmationVisible,
                              autocorrect: false,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.done,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please re enter your password';
                                }
                                if (value != passwordController.text) {
                                  return "Password Don't match";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Re Enter Password',
                                labelText: 'Password',
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14))),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(16, 14, 16, 14),
                                errorStyle:
                                    const TextStyle(fontSize: 12, height: 0.75),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    confirmationVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      confirmationVisible =
                                          !confirmationVisible;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth,
                              child: FilledButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _createUserWithEmailAndPassword();
                                  }
                                },
                                child: const Text("Sign Up"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an Account?",
                          style: TextStyle(
                            color: MaterialTheme.lightScheme().onPrimary,
                          ),
                        ),
                        TextButton(
                          onPressed: () => {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => Login(
                                          isLoading: false,
                                        )))
                          },
                          child: Text(
                            "Sign In",
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
      }),
    );
  }
}
