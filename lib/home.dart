import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<ProfileScreen>(
                      builder: (context) => ProfileScreen(
                        actions: [
                          SignedOutAction((context) {
                            Navigator.of(context).pop();
                          })
                        ],
                        children: [
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.asset("assets/flutterfire_300x.jpg"),
                            ),
                          )
                        ],
                      ),
                    ));
              })
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              "assets/dash.jpg",
              width: 200,
              height: 200,
            ),
            Text("Bienvenido", style: Theme.of(context).textTheme.displaySmall),
            const SignOutButton(),
          ],
        ),
      ),
    );
  }
}
