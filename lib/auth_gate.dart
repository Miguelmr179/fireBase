import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:loginfirebase/home.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SignInScreen(
              providers: [
                EmailAuthProvider(),
                GoogleProvider(
                    clientId: "1:164473088789:web:56099e76d3d9787102971c"),
              ],
              headerBuilder: (context, constraints, shrinkOffset) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset("assets/flutterfire_300x.jpg", width: 200,height: 200),
                  ),
                );
              },
              subtitleBuilder: (context, action) {
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0),
                    child: action == AuthAction.signIn
                        ? const Text(
                            "Bienvenido a FlutterFire porfavor inicia sesión")
                        : const Text(
                            "Bienvenido a FlutterFire Porfavor registrate"));
              },
              footerBuilder: (context, action) {
                return const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    "Al iniciar sesion, Aceptas nuestros terminos y condiciones",
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              },
            );
          }
          return const HomeScreen();
        });
  }
}
