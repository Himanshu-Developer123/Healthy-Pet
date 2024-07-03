import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/auth_service.dart';

class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await ref.read(authServiceProvider).signInWithGoogle();
          },
          child: const Text('Sign with google'),
        ),
      ),
    );
  }
  
}