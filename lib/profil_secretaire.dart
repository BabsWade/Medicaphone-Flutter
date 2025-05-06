import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'custom_end_drawer.dart';

class ProfilSecretairePage extends StatefulWidget {
  @override
  _ProfilSecretairePageState createState() => _ProfilSecretairePageState();
}

class _ProfilSecretairePageState extends State<ProfilSecretairePage> {
  File? _image;
  final picker = ImagePicker();

  final _nomController = TextEditingController(text: 'Wade');
  final _prenomController = TextEditingController(text: 'Babacar');
  final _dateNaissanceController = TextEditingController(text: '12/03/1990');
  final _emailController = TextEditingController(
    text: 'Babacar.Wade@email.com',
  );
  final _telController = TextEditingController(text: '0601020304');

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: label,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            border: InputBorder.none,
            suffixIcon: Icon(Icons.edit, color: Color(0xFF00A6C7)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const drawerColor = Color(0xFF00A6C7);
    return Scaffold(
      backgroundColor: Color(0xFFF3FDFE),
      appBar: AppBar(
        backgroundColor: Color(0xFFF3FDFE),
        title: Text('Profil secrétaire', style: TextStyle(color: Colors.black)),
        automaticallyImplyLeading: false,
        leading: Builder(
          builder:
              (context) => Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.chevron_left, color: drawerColor),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
        ),
        actions: [
          Builder(
            builder:
                (context) => Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE7F6FB),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.menu, color: drawerColor),
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    ),
                  ),
                ),
          ),
        ],
      ),
      endDrawer: CustomEndDrawer(userFirstName: 'Dr Babacar'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),
            // Image + bouton d'édition
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image:
                              _image != null
                                  ? DecorationImage(
                                    image: FileImage(_image!),
                                    fit: BoxFit.cover,
                                  )
                                  : null,
                        ),
                        child:
                            _image == null
                                ? Icon(
                                  Icons.person,
                                  size: 40,
                                  color: Colors.grey,
                                )
                                : null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap:
                              _pickImage, // 👉 déclenche le sélecteur d’image
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Color(0xFF00A6C7),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.edit,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16),
                 
                ],
              ),
            ),
            SizedBox(height: 24),

            // Champs pré-remplis
            _buildTextField("Nom", _nomController),
            _buildTextField("Prénom", _prenomController),
            _buildTextField("Date de naissance", _dateNaissanceController),
            _buildTextField("Adresse email", _emailController),
            _buildTextField("Numéro de téléphone", _telController),

            SizedBox(height: 32),
            // Actions
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 24),
                  Text(
                    "Ajouter un patient",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Supprimer un patient",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Modifier les infos du patient",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Modifier les notes",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilSecretairePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00A6C7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Modifier', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
