import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartcatchapp/utils/size_config.dart';

import '../auth/auth.dart';
import '../theme/theme.dart';
import '../widgets/logo.dart';
import 'email_verification.dart';
import 'forgot_password.dart';
import 'home.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  Login({
    Key? key,
    required this.isLoading,
  }) : super(key: key);

  bool isLoading;
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final User? user = Auth().currentUser;
  bool isLogin = true;
  bool visible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late ScaffoldMessengerState snackbar;

  Future<void> _signInWithEmailAndPassword() async {
    setState(() {
      widget.isLoading = true;
    });
    try {
      await Auth()
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then(
            (value) => Auth().currentUser!.emailVerified
                ? Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(
                      builder: (context) => const Home(),
                    ))
                    .then((value) => ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Signed In Successfully'),
                        )))
                : Navigator.of(context)
                    .pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => EmailVerification(),
                      ),
                    )
                    .then((value) => ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Email sent Successfully'),
                        ))),
          );
    } on FirebaseAuthException catch (e) {
      setState(() {
        widget.isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message!),
      ));
    }
  }

  @override
  void dispose() {
    emailController.dispose();
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
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Welcome Back",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                const SizedBox(
                                  height: 35,
                                ),
                                TextFormField(
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(14))),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(16, 14, 16, 14),
                                    hintText: 'Enter Email',
                                    labelText: 'Email',
                                    errorStyle:
                                        TextStyle(fontSize: 12, height: 0.75),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
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
                                ),
                              ],
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
                            TextButton(
                              child: const Text(
                                "Forgot Password?",
                              ),
                              onPressed: () => {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ForgotPassword()))
                              },
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth,
                              child: FilledButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _signInWithEmailAndPassword();
                                  } else {}
                                },
                                child: const Text("Log In"),
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
      }),
    );
  }
}
