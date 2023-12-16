import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/home/home_view.dart';

import '../../core/network/user_fun.dart';
import '../home/widgets/custom_textfield.dart';
import '../register/register_view.dart';



class LoginView extends StatefulWidget {
  static const String routeName = "login";

    const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool isVisible = false;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(

            image: AssetImage("assets/images/pattern.png"),
            fit: BoxFit.cover,
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "Login",
              style: theme.textTheme.titleLarge?.copyWith(color: Colors.black),
            ),
          ),
          centerTitle: true,
          toolbarHeight: 120,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.14,
                  ),
                  Text(
                    "Welcome back!",
                    style: theme.textTheme.titleLarge
                        ?.copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    textEditingController: emailController,
                    validator: (value) {
                      if (value == null || value
                          .trim()
                          .isEmpty) {
                        return "You must enter your password";
                      }
                      var regex = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (!regex.hasMatch(value)) {
                        return "Invalid email address";
                      }
                      return null;
                    },
                    label: "Email",

                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextField(
                    textEditingController: passController,
                    icon: GestureDetector(
                      onTap: () {
                        isVisible = !isVisible;
                        setState(() {});
                      },
                      child: isVisible == true
                          ? const Icon(
                        Icons.remove_red_eye_outlined,
                        size: 28,
                      )
                          : const Icon(
                        Icons.visibility_off_outlined,
                        size: 28,
                      ),
                    ),
                    obscure: !isVisible,
                    color: theme.primaryColor,
                    validator: (value) {
                      if (value == null || value
                          .trim()
                          .isEmpty) {
                        return "You must enter your password";
                      }
                      return null;
                    },
                    label: "Password",
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forget password?",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSecondary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  MaterialButton(
                    onPressed: () {

                      var user = login();
                      Navigator.pushReplacementNamed(context, HomeView.routeName,arguments: user);

                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Login",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          const Icon(Icons.arrow_forward,
                              size: 28, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterView.routeName);
                      },
                      child: Text(
                        "Create a new account!",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

   login() async {

    if (formKey.currentState!.validate()) {
      // call login api
      try {
         var user = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text,
            password: passController.text,
            );
             var credentialUser = await UserFun.getUser(user.user?.uid);
             return credentialUser;

      }
      on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }

    }
  }
}
