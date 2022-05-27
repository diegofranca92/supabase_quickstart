import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../components/auth_required_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends AuthRequiredState<HomePage> {
  User? user;

  @override
  void onAuthenticated(Session session) {
    final _user = session.user;
    user = _user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 34,
            width: 264,
            margin: const EdgeInsets.only(
              left: 15,
              right: 16,
            ),
            child: const Text(
              "Welcome to Supabase",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 30, bottom: 20),
              child: Text(
                "User: ${user!.userMetadata['full_name'] ?? user!.email}" ?? '',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              onTapSignOut();
            },
            child: const Text('SignOut'),
          )
        ],
      ),
    );
  }

  void onTapSignOut() async {
    await Supabase.instance.client.auth.signOut();
  }
}
