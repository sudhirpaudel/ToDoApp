import 'package:flutter/material.dart';
import 'package:todoapp/config/constants/app_color.dart';
import 'package:todoapp/config/constants/images_url.dart';
import 'package:todoapp/model/user_model.dart';
import 'package:todoapp/views/auth_view/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool showPass = true;
  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    double width = MediaQuery.of(context).size.width;
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
              'Sign-Up',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 0, 5),
                    child: Text(
                      "FirstName",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  SizedBox(
                    width: width / 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 10, 0),
                      child: SizedBox(
                        height: 50,
                        child: TextField(
                          controller: firstNameController,
                          cursorColor: lightPrimaryColor,
                          style: Theme.of(context).textTheme.bodyText1,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          cursorHeight: 24,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(top: 10, left: 12),
                            hintText: "Iron",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: lighterPrimaryColor),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: lightPrimaryColor, width: 2.0),
                            ),
                            disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: lightPrimaryColor, width: 2.0),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: primaryColor, width: 2.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child: Text(
                      "LastName",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  SizedBox(
                    width: width / 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                      child: SizedBox(
                        height: 50,
                        child: TextField(
                          controller: lastNameController,
                          cursorColor: lightPrimaryColor,
                          style: Theme.of(context).textTheme.bodyText1,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          cursorHeight: 24,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(top: 10, left: 12),
                            hintText: "Man",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: lighterPrimaryColor),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: lightPrimaryColor,
                                width: 2.0,
                              ),
                            ),
                            disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: lightPrimaryColor,
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: primaryColor,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 5),
            child: Text(
              "PhoneNumber",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: SizedBox(
              height: 50,
              child: TextField(
                controller: phoneNumberController,
                cursorColor: lightPrimaryColor,
                style: Theme.of(context).textTheme.bodyText1,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                cursorHeight: 24,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 10, left: 12),
                  hintText: "9898978787",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: lighterPrimaryColor),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: lightPrimaryColor,
                      width: 2.0,
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: lightPrimaryColor,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                      width: 2.0,
                    ),
                  ),
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
              "Email",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: SizedBox(
              height: 50,
              child: TextField(
                controller: emailController,
                cursorColor: lightPrimaryColor,
                style: Theme.of(context).textTheme.bodyText1,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                cursorHeight: 24,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                    top: 10,
                    left: 12,
                  ),
                  hintText: "something@email.com",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: lighterPrimaryColor),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: lightPrimaryColor,
                      width: 2.0,
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: lightPrimaryColor,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                      width: 2.0,
                    ),
                  ),
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
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
            child: SizedBox(
              height: 50,
              child: TextField(
                controller: passwordController,
                cursorColor: lightPrimaryColor,
                obscureText: showPass,
                style: Theme.of(context).textTheme.bodyText1,
                textInputAction: TextInputAction.send,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 10, left: 12),
                  hintText: "something123",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: lighterPrimaryColor),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: lightPrimaryColor, width: 2.0),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: lightPrimaryColor, width: 2.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 2.0),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(
                        () {
                          showPass = !showPass;
                        },
                      );
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
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            height: 60,
            decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: TextButton(
              onPressed: () {
                UserSignup userSignup = UserSignup(
                  firstName: firstNameController.value.text,
                  lastName: lastNameController.value.text,
                  phoneNumber: phoneNumberController.value.text,
                  email: emailController.value.text,
                  password: passwordController.value.text,
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const LoginScreen(),
                  ),
                );
              },
              child: Text(
                "Sign-up",
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
                "Already have an account ?",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const LoginScreen(),
                    ),
                  );
                },
                child: Text(
                  "Log-in",
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
