import 'package:flutter/material.dart';
import 'custom_end_drawer.dart';
import 'create_secretaire_form.dart';

class SecretairePage extends StatelessWidget {
  final List<Map<String, String>> secretaireList = [
    {
      'name': 'Babacar Wade',
      'email': 'Babacar.Wade@mail.com',
      'avatar': 'assets/avatar.png',
    },
    {
      'name': 'Mansour Ndiaye',
      'email': 'Mansour.Ndiaye@mail.com',
      'avatar': 'assets/avatar.png',
    },
    // Ajoute d'autres secrétaires ici
  ];

  @override
  Widget build(BuildContext context) {
    const drawerColor = Color(0xFF00A6C7);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF3FDFE),
        title: Text('Secrétaires', style: TextStyle(color: Colors.black)),
        automaticallyImplyLeading: false, // On désactive l'icône automatique
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
                      icon: Icon(Icons.menu, color: Color(0xFF00A6C7)),
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF3FDFE), Color(0xFFD6F1F7)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Liste des secrétaires
              Expanded(
                child: ListView.builder(
                  itemCount: secretaireList.length,
                  itemBuilder: (context, index) {
                    final secretaire = secretaireList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(
                          top: 14,
                          right: 20,
                          bottom: 14,
                          left: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            // Avatar
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                secretaire['avatar']!,
                              ),
                              radius: 24,
                            ),
                            SizedBox(width: 16),
                            // Informations Secrétaire
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    secretaire['name']!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    secretaire['email']!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Trois points verticaux pour actions
                            IconButton(
                              icon: Icon(
                                Icons.more_vert,
                                color: Color(
                                  0xFF00A6C7,
                                ), // Couleur appliquée à l'icône
                              ),
                              onPressed: () {
                                // Actions à ajouter ici
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateSecretaireList(),
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
                  child: Text(
                    'Créer un profil secrétaire',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
