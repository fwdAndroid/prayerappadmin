import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prayerappadmin/bottompages/mainbottomclass.dart';
import 'package:prayerappadmin/providers/idprovider.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(
            create: (context) => IdProvider()),
      ],
      child: MaterialApp(
        title: 'prayerappadmin',
        theme: ThemeData(
colorScheme: ColorScheme.fromSwatch().copyWith(
  primary: Color(0xff00722d),
  secondary: Color(0xff00722d)
)
        ),
        home: const MainBottomClass()
      ),
    );
  }
}

