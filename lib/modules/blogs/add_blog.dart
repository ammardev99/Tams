// lib/screens/add_blog_screen.dart
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';
import 'package:tams/components/assets.dart';
import 'package:tams/models/blog_model.dart';
import 'package:tams/modules/blogs/add_blog_api.dart';

class AddBlogScreen extends StatefulWidget {
  const AddBlogScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddBlogScreenState createState() => _AddBlogScreenState();
}

class _AddBlogScreenState extends State<AddBlogScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _memoryController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  Uint8List? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final Uint8List imageBytes = await image.readAsBytes();
      setState(() {
        _image = imageBytes;
      });
    }
  }

  RxBool isloading = false.obs;
  Future<void> _addBlog() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (_image == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select an image')),
        );
        return;
      }
      isloading.value = true;

      final newBlog = Blog(
        id: '',
        title: _titleController.text,
        location: _locationController.text,
        memory: _memoryController.text,
        date: _dateController.text,
        author: _authorController.text,
        image: _image!,
      );

      try {
        await AddBlogApiService().addBlog(newBlog);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Blog added successfully')),
        );
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } catch (e) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add blog: $e')),
        );
      }
    }
    isloading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.white,
          ),
          backgroundColor: secondaryColor,
          title: heading('Add New Blog', Colors.white),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _locationController,
                  decoration: const InputDecoration(labelText: 'Location'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a location';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _memoryController,
                  decoration: const InputDecoration(labelText: 'Memory'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a memory';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _dateController,
                  decoration: const InputDecoration(labelText: 'Date'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a date';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _authorController,
                  decoration: const InputDecoration(labelText: 'Author'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an author';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _image == null
                    ? const Text('No image selected.')
                    : Image.memory(_image!, height: 200),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: const Text('Pick Image'),
                ),
                const SizedBox(height: 16),
                Obx(() {
                  return ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(secondaryColor)),
                    onPressed: _addBlog,
                    child: isloading.value == true
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : heading('Add Blog', Colors.white),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
