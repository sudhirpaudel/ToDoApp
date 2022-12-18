import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/config/constants/app_color.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todoapp/utls/image_picker.dart';
import 'package:todoapp/view_model/settings_bloc/settings_bloc.dart';

class PickImageDialog extends StatefulWidget {
  const PickImageDialog({Key? key}) : super(key: key);

  @override
  State<PickImageDialog> createState() => _PickImageDialogState();
}

class _PickImageDialogState extends State<PickImageDialog>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  // ignore: unused_field
  late Animation<double> _animation;
  double _translateY = -500;
  bool _animType = true;
  bool showPass = false;
  // ignore: unused_field
  Uint8List? _image;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        setState(() {
          if (_animType) {
            if (_translateY < 0) {
              _translateY = _translateY + 100;
            }
          } else {
            if (_translateY > -500) {
              _translateY = _translateY - 100;
            }
          }
        });
      });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return StatefulBuilder(
        builder: (context, setState) {
          return Transform.translate(
            offset: Offset(0, _translateY),
            child: SimpleDialog(
              insetPadding: EdgeInsets.zero,
              titlePadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              backgroundColor: Colors.transparent,
              children: [
                SizedBox(
                  width: width,
                  height: height,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 40,
                        child: Container(
                          height: 150,
                          width: 10,
                          color: secondaryColor,
                        ),
                      ),
                      Positioned(
                        right: 40,
                        child: Container(
                          height: 150,
                          width: 10,
                          color: secondaryColor,
                        ),
                      ),
                      Positioned(
                        left: 10,
                        right: 10,
                        top: 140,
                        child: Container(
                          height: 180,
                          width: width,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              BlocListener<SettingsBloc, SettingsState>(
                                listener: (context, state) {},
                                child: Positioned(
                                  top: 20,
                                  left: 30,
                                  child: TextButton(
                                    onPressed: () async {
                                      Uint8List? image = await pickImageFile(
                                          ImageSource.camera);

                                      // ignore: use_build_context_synchronously
                                      context.read<SettingsBloc>().add(
                                            UpdatePic(image: image),
                                          );

                                      // ignore: use_build_context_synchronously
                                      Navigator.pop(context);
                                    },
                                    child: SizedBox(
                                      height: 120,
                                      width: 120,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'CAMERA',
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: primaryColor),
                                          ),
                                          Icon(
                                            Icons.camera_outlined,
                                            size: 80,
                                            color: primaryColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              BlocListener<SettingsBloc, SettingsState>(
                                listener: (context, state) {},
                                child: Positioned(
                                  top: 20,
                                  right: 30,
                                  child: TextButton(
                                    onPressed: () async {
                                      Uint8List? image = await pickImageFile(
                                          ImageSource.gallery);
                                      // ignore: use_build_context_synchronously
                                      context.read<SettingsBloc>().add(
                                            UpdatePic(image: image),
                                          );
                                      // ignore: use_build_context_synchronously
                                      Navigator.pop(context);
                                    },
                                    child: SizedBox(
                                      height: 120,
                                      width: 120,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'GALLERY',
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: primaryColor),
                                          ),
                                          Icon(
                                            Icons.photo_library_outlined,
                                            size: 80,
                                            color: primaryColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 50,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                _animType = false;
                                _animationController.forward();
                              });
                              Timer(const Duration(milliseconds: 100), () {
                                Navigator.pop(context);
                              });
                            },
                            icon: const Icon(
                              Icons.close,
                              color: primaryColor,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      
    );
  }
}
