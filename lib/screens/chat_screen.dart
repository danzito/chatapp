import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../widgets/chat_messages.dart';
import '../widgets/new_messages.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void setupPushNotifications() async {
    final fcm = FirebaseMessaging.instance;

    await fcm.requestPermission();
    // final token = await fcm.getToken();
    // print(token);

    fcm.subscribeToTopic('chat');
  }

  @override
  void initState() {
    setupPushNotifications();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Chat!'),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: const Column(
        children: [
          Expanded(child: ChatMessages()),
          NewMessage(),
        ],
      ),
      // backgroundColor: Theme.of(context).colorScheme.primary,
      // body: ListView.builder(
      //   itemBuilder: (ctx, index) => Container(
      //     padding: const EdgeInsets.all(8),
      //     child: const Text('This works'),
      //   ),
      //   itemCount: 10,
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     FirebaseFirestore.instance
      //         .collection('chats/Q644ImTKDQSBFthvaw1A/messages')
      //         .snapshots()
      //         .listen((event) {
      //       //     print('See below ->');
      //       // print(event.docs[0]);
      //     });
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
