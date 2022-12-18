import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:todoapp/model/todo_model.dart';
import 'package:todoapp/reponsive/mobile_screen_layout.dart';
import 'package:todoapp/reponsive/responsive_app.dart';
import 'package:todoapp/reponsive/web_screen_layout.dart';
import 'package:todoapp/src/themes/material/material_theme.dart';
import 'package:todoapp/view_model/ongoingtodo_bloc/ongoingtodo_bloc.dart';
import 'package:todoapp/view_model/settings_bloc/settings_bloc.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OngoingtodoBloc()
            ..add(
              GetToDo(
              ),
            ),
        ),
        BlocProvider(
          create: (context) => SettingsBloc()..add(UpdatePic()),
        ),
      ],
      child: PlatformApp(
        material: (context, platform) => materialAppTheme,
        home: const ResponsiveApp(
          mobileLayout: MobileScreenLayout(),
          webLayout: WebScreenLayout(),
        ),
      ),
    );
  }
}
