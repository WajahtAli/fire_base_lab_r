import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class UpdateScreen extends StatelessWidget {
  final String docId;
  const UpdateScreen({required this.docId ,super.key});

  @override
  Widget build(BuildContext context) {
    final name = TextEditingController();
    final rollNo = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Text('Update Screen'),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: name,
            decoration: const InputDecoration(
                hintText: 'Enter your Roll No',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: rollNo,
            decoration: const InputDecoration(
                hintText: 'Enter your Roll No',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              await FirebaseFirestore.instance
                  .collection('data')
                  .doc(docId)
                  .update({
                "name": name.text,
                "rollNo": rollNo.text,
              });
            },
            child: const Text('Update Student'),
          ),
        ],
      ),
    );
  }
}
