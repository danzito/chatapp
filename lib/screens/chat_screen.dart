import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: ListView.builder(
        itemBuilder: (ctx, index) => Container(
          padding: const EdgeInsets.all(8),
          child: const Text('This works'),
        ),
        itemCount: 10,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/Q644ImTKDQSBFthvaw1A/messages')
              .snapshots()
              .listen((event) {
            //     print('See below ->');
            // print(event.docs[0]);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
