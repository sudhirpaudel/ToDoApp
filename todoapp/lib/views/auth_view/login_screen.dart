import 'package:flutter/material.dart';
import 'package:todoapp/config/constants/app_color.dart';
import 'package:todoapp/config/constants/images_url.dart';
import 'package:todoapp/model/user_model.dart';
import 'package:todoapp/views/auth_view/signup_screen.dart';
import 'package:todoapp/views/user_view/home_view/home_page_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool showPass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 180,
        backgroundColor: secondaryColor,
        title: Container(
          height: 120,
          width: 120,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(logoBold),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            child: Text(
              'Log-In',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 25, 5),
            child: Text(
              "Email",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: TextField(
              controller: emailController,
              cursorColor: lightPrimaryColor,
              style: Theme.of(context).textTheme.bodyText1,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              cursorHeight: 24,
              decoration: InputDecoration(
                hintText: "something@email.com",
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: lighterPrimaryColor),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: lightPrimaryColor, width: 2.0),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: lightPrimaryColor, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 2.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 5),
            child: Text(
              "Password",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: TextField(
              controller: passwordController,
              cursorColor: lightPrimaryColor,
              obscureText: showPass,
              style: Theme.of(context).textTheme.bodyText1,
              textInputAction: TextInputAction.send,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "something123",
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: lighterPrimaryColor),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: lightPrimaryColor, width: 2.0),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: lightPrimaryColor, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 2.0),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      showPass = !showPass;
                    });
                  },
                  icon: !showPass
                      ? const Icon(
                          Icons.visibility_off,
                          color: lightPrimaryColor,
                        )
                      : const Icon(
                          Icons.visibility,
                          color: lightPrimaryColor,
                        ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const SignupScreen(),
                    ),
                  );
                },
                child: Text(
                  "forget password?  ",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            height: 60,
            decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const HomePageLayout(),
                  ),
                );
              },
              child: Text(
                "Login",
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: secondaryColor,
                    ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account ?",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              TextButton(
                onPressed: () {
                  UserLogin userLogin = UserLogin(
                    email: emailController.value.text,
                    password: passwordController.value.text,
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const SignupScreen(),
                    ),
                  );
                },
                child: Text(
                  "SignUp",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(color: secondaryColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
