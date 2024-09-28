import 'dart:io';
import 'package:final_project/firebase_usage/firebase_storage.dart';
import 'package:final_project/firebase_usage/firestore_functions.dart';
import 'package:final_project/firebase_usage/user_model.dart';
import 'package:final_project/shared/shared_methods.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key, required this.id});
  final String id;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  File? selectedImage;
  UserModel? userModel;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    userModel = await FirestoreFunctions().getUserById(widget.id);
    if (userModel != null) {
      nameController.text = userModel!.name;
      phoneController.text = userModel!.phone;
      setState(() {});
    }
  }

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
      _updateImage();
    }
  }

  Future<void> _updateName() async {
    await FirestoreFunctions().updateName(nameController.text, userModel!);
    fetchData();
  }

  Future<void> _updatePhone() async {
    await FirestoreFunctions().updatePhone(phoneController.text, userModel!);
    fetchData();
  }

  Future<void> _updateImage() async {
    if (selectedImage != null) {
      try {
        String? imageUrl =
            await FirebaseStorageFunctions().uploadImage(selectedImage!);
        await FirestoreFunctions().updateImage(imageUrl!, userModel!);
        fetchData();
        setState(() {
          selectedImage = null;
        });
      } catch (e) {
        _showSnackBar('Error uploading image: $e');
      }
    }
  }

  void _showEditDialog(
      String title, TextEditingController controller, Function onSave) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit $title'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Enter $title'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                onSave();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userModel == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 45, left: 20, right: 20),
                        height: MediaQuery.of(context).size.height / 4.3,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width,
                              105,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 6.5),
                          child: Material(
                            elevation: 10,
                            borderRadius: BorderRadius.circular(70),
                            child: Stack(
                              children: [
                                (userModel!.imageurl.isEmpty &&
                                        selectedImage == null)
                                    ? CircleAvatar(
                                        radius: 70,
                                        child: Text(
                                          userModel!.name.isNotEmpty
                                              ? userModel!.name[0]
                                              : '',
                                          style: const TextStyle(fontSize: 70),
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(70),
                                        child: selectedImage != null
                                            ? Image.file(
                                                selectedImage!,
                                                width: 140,
                                                height: 140,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.network(
                                                userModel!.imageurl,
                                                width: 140,
                                                height: 140,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: IconButton(
                                    icon: Material(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.deepPurple,
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 28,
                                      ),
                                    ),
                                    onPressed: _pickImage,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 70),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              userModel!.name,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  _buildEditableProfileField(
                    icon: Icons.person,
                    label: 'Name',
                    value: userModel!.name,
                    onEdit: () {
                      _showEditDialog('Name', nameController, _updateName);
                    },
                  ),
                  _buildEditableProfileField(
                    icon: Icons.phone,
                    label: 'Phone No.',
                    value: userModel!.phone,
                    onEdit: () {
                      _showEditDialog('Phone', phoneController, _updatePhone);
                    },
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildEditableProfileField({
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onEdit,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label),
                    Text(value),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: onEdit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
