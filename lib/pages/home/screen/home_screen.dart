import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_lab_r/helpers/warning_helpers.dart';
import 'package:firebase_lab_r/pages/home/controller/home_controller.dart';
import 'package:firebase_lab_r/pages/update/screen/update_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  File? _image;

  Future<void> pickImage() async {
    ImagePicker imagePicker = ImagePicker();

    var selectedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (selectedImage != null) {
      setState(() {
        _image = File(selectedImage.path);
      });
    }
  }

  Future<void> pickImageFromCam() async {
    ImagePicker imagePicker = ImagePicker();

    var selectedImage = await imagePicker.pickImage(source: ImageSource.camera);

    if (selectedImage != null) {
      setState(() {
        _image = File(selectedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController rollNo = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Text('Home Screen'),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: name,
                decoration: const InputDecoration(
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue))),
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
                        .doc()
                        .set({
                          "name": name.text,
                          "rollNo": rollNo.text,
                        })
                        .then((value) => WarningHelper.flushBarErrorMessage(
                            context, "successfully added data"))
                        .onError((error, stackTrace) {
                          print('hello $error');
                          WarningHelper.flushBarErrorMessage(
                              context, "Fail to added data $error");
                        });
                  },
                  child: const Text('Submit')),
              const SizedBox(height: 35),
              ElevatedButton(
                onPressed: () {
                  pickImage();
                },
                child: const Text('Pick image'),
              ),
              _image != null
                  ? CircleAvatar(
                      radius: 60,
                      backgroundImage: FileImage(_image!),
                    )
                  : Container(
                      height: 100,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle),
                      child: InkWell(
                        onTap: () {
                          pickImageFromCam();
                        },
                        child: _image != null
                            ? CircleAvatar(
                                radius: 60,
                                backgroundImage: FileImage(_image!),
                              )
                            : const Icon(Icons.edit),
                      ),
                    ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: FirebaseFirestore.instance.collection('data').get(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData) {
                      List<QueryDocumentSnapshot<Map<String, dynamic>>>? snap =
                          snapshot.data?.docs;
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snap?.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic>? student = snap?[index].data();
                            return Dismissible(
                              key: Key(snap![index].id),
                              direction: DismissDirection.endToStart,
                              background: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                ),
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                              onDismissed: (data) {
                                FirebaseFirestore.instance
                                    .collection('data')
                                    .doc(snap[index].id)
                                    .delete();
                              },
                              child: Card(
                                child: ListTile(
                                  leading: const Icon(Icons.person),
                                  title: Text(student?['name'] ?? ""),
                                  subtitle: Text(student?['rollNo'] ?? ""),
                                  trailing: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdateScreen(
                                                        docId:
                                                            snap![index].id)));
                                      },
                                      child: const Icon(Icons.edit)),
                                ),
                              ),
                            );
                          });
                    } else {
                      return const Center(
                        child: Text('Something went wrong'),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
