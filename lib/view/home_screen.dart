import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/authentication_viewmodel.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final provider = ChangeNotifierProvider((ref) => AuthenticationViewModel());
  @override
  Widget build(BuildContext context) {
    final providerValue  = ref.watch(provider);
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child:

      Center(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Text('Welcome Home '),

            GestureDetector(
                onTap: (){
                  providerValue.logout(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('Logout'),
                ))
          ],
        ),
      ),
      ),
    );
  }
}





