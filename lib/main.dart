import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthypet/firebase_options.dart';
import 'package:healthypet/router.dart';
import 'features/auth/pages/details_page.dart';
import 'features/auth/pages/login_page.dart';
import 'features/home_screen/pages/home_page.dart';
import 'features/splash_screen/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(

      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,


      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      // home: DetailsPage()

      // StreamBuilder(
      //     stream: FirebaseAuth.instance.authStateChanges(),
      //     builder: (context,snapshot){
      //       if(!snapshot.hasData){
      //         return LoginPage();
      //       }
      //       else if(snapshot.connectionState == ConnectionState.waiting){
      //         return CircularProgressIndicator();
      //       }
      //       return Container();
      //     },),
    );
  }
}
