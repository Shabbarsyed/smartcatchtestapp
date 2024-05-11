import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import '../theme/theme.dart';
import '../utils/size_config.dart';
import '../widgets/logo.dart';
import 'home.dart';
import 'dart:async';
import '../auth/auth.dart';
import 'login.dart';
import 'signup.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  bool isEmailVerified = false;
  Timer? timer;
  static const _timerDuration = 30;
  final StreamController _timerStream = new StreamController<int>();
  int? timerCounter;
  Timer? _resendCodeTimer;

  @override
  void initState() {
    super.initState();
    activeCounter();
    isEmailVerified = Auth().currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(
        const Duration(seconds: 3),
        (timer) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    _timerStream.close();
    _resendCodeTimer!.cancel();
    timer?.cancel();
    super.dispose();
  }

  activeCounter() {
    _resendCodeTimer =
        Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_timerDuration - timer.tick > 0) {
        _timerStream.sink.add(_timerDuration - timer.tick);
      } else {
        _timerStream.sink.add(0);
        _resendCodeTimer!.cancel();
      }
    });
  }

  Future sendVerificationEmail() async {
    try {
      final user = Auth().currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  Future checkEmailVerified() async {
    await Auth().currentUser!.reload();
    setState(() {
      isEmailVerified = Auth().currentUser!.emailVerified;
    });

    if (isEmailVerified) {
      await FirebaseChatCore.instance.createUserInFirestore(
        types.User(
          firstName: Auth().currentUser!.displayName!.split(' ').first,
          id: Auth().currentUser!.uid, // UID from Firebase Authentication
          imageUrl: 'https://i.pravatar.cc/300',
          lastName: Auth().currentUser!.displayName!.split(' ').last,
        ),
      );
      timer?.cancel();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SizeConfig().init(context);
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const Home()
      : Scaffold(
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
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: "Welcome ",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  children: [
                                    TextSpan(
                                      text: FirebaseAuth
                                          .instance.currentUser!.displayName
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            fontWeight: FontWeight
                                                .bold, // Override the font weight to bold
                                            // Add any other text style properties you need
                                          ),
                                    ),
                                    const TextSpan(
                                      text:
                                          ", A verification email has been sent to ",
                                    ),
                                    TextSpan(
                                      text:
                                          "${FirebaseAuth.instance.currentUser!.email}\n",
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    )
                                  ],
                                ),
                              ),
                              StreamBuilder(
                                  stream: _timerStream.stream,
                                  builder: (context, snapshot) {
                                    return SizedBox(
                                      width: SizeConfig.screenWidth,
                                      child: FilledButton(
                                        onPressed: snapshot.data == 0
                                            ? () {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  content: Text(
                                                    "Email Sent Succesfully",
                                                  ),
                                                ));
                                                _timerStream.sink.add(30);
                                                activeCounter();
                                                sendVerificationEmail();
                                              }
                                            : null,
                                        child: snapshot.data == 0
                                            ? Text(
                                                "Resend Email",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                      color: MaterialTheme
                                                              .lightScheme()
                                                          .onPrimary,
                                                      fontWeight: FontWeight
                                                          .bold, // Override the font weight to bold
                                                      // Add any other text style properties you need
                                                    ),
                                              )
                                            : Text(
                                                "Resend Email in ${snapshot.hasData ? snapshot.data.toString() : 30}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              ),
                                      ),
                                    );
                                  }),
                              TextButton(
                                  onPressed: () {
                                    FirebaseAuth.instance.signOut().then(
                                        (value) => Navigator.of(context)
                                            .pushReplacement(MaterialPageRoute(
                                                builder: (context) => Login(
                                                      isLoading: false,
                                                    ))));
                                  },
                                  child: const Text(
                                    "Cancel",
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Don't forget to check your spam folder",
                                style: Theme.of(context).textTheme.bodySmall,
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
          }),
        );
}
