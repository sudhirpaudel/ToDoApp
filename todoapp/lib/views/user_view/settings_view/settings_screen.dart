import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/config/constants/app_color.dart';
import 'package:todoapp/config/constants/widgets.dart';
import 'package:todoapp/view_model/settings_bloc/settings_bloc.dart';
import 'package:todoapp/views/auth_view/login_screen.dart';
import 'package:todoapp/views/user_view/change_password/change_password.dart';
import 'package:todoapp/views/user_view/settings_view/pick_image_dialog.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Builder(builder: (context1) {
      return Scaffold(
         appBar: AppBar(
      toolbarHeight: 0,
    ),
        body: ListView(
          children: [
            Container(
              height: 130,
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  menuIcon(context),
                  SizedBox(
                    height: 140,
                    width: width - 110,
                    child: Center(
                      child: Text(
                        "Settings",
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.copyWith(color: secondaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Center(
                child: Text(
                  "Hi! Sudhir . Your Settings ",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: height - 200,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: secondaryColor,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: BlocBuilder<SettingsBloc, SettingsState>(
                          builder: (context, state) {
                            if (state is SettingsInitial) {
                              return SizedBox(
                                height: 120,
                                width: 120,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 120,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        color: lightSecondaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: state.image == null
                                          ? const Icon(
                                              Icons.person,
                                              size: 40,
                                              color: primaryColor,
                                            )
                                          : ClipRRect(
                                            borderRadius:BorderRadius.circular(120),
                                            child: Image(
                                                image:
                                                    MemoryImage(state.image!),
                                                fit: BoxFit.fill,
                                              ),
                                          ),
                                    ),
                                    Positioned(
                                      bottom: -10,
                                      right: -10,
                                      child: IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (_) => BlocProvider<
                                                SettingsBloc>.value(
                                              value: context1
                                                  .read<SettingsBloc>(),
                                              child:  
                                                const PickImageDialog(),
                                              
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.add_a_photo,
                                          color: primaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                            return SizedBox(
                              height: 120,
                              width: 120,
                              child: Stack(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: lightSecondaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.person,
                                      size: 60,
                                      color: primaryColor,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -10,
                                    right: -10,
                                    child: IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (_) =>
                                              const PickImageDialog(),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.add_a_photo,
                                        color: primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 60,
                      width: width,
                      decoration: const BoxDecoration(
                          color: primaryColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(5))),
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => const ChangePasswordDialog(),
                          );
                        },
                        child: Text(
                          "Change Password",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(
                                color: secondaryColor,
                              ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      height: 60,
                      width: width,
                      decoration: const BoxDecoration(
                          color: primaryColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(5))),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const LoginScreen(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Log Out",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                    color: secondaryColor,
                                  ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Icon(
                              Icons.logout,
                              color: secondaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    },
    );
  }
}
