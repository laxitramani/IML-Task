import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iml_task/bloc/data/data_bloc.dart';
import 'package:iml_task/utils/routes.dart';
import 'package:iml_task/utils/size_config.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => DataBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: Routes.routes,
        theme: ThemeData(useMaterial3: true),
        initialRoute: RouteName.splashScreen,
      ),
    );
  }
}
