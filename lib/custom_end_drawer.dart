import 'package:flutter/material.dart';
import 'package:medicaphone_flutter/patients_list.dart';
import 'secretaires_list.dart';

class CustomEndDrawer extends StatelessWidget {
  final String userFirstName;

  const CustomEndDrawer({Key? key, required this.userFirstName})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Drawer(
        child: Container(
          height: double.infinity,
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
                // Avatar + nom
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                  'assets/avatar.png',
                                ),
                                radius: 24,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Bonjour,',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      userFirstName,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF00A6C7),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFE7F6FB),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.close, color: Color(0xFF00A6C7)),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                // Menu
                Expanded(
                  child: ListView(
                    children: [
                      _buildMenuItem(context, Icons.person, 'Secrétaires', () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => SecretairePage()),
                        );
                      }),
                      _buildMenuItem(context, Icons.people, 'Patients', () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => PatientsList()),
                        );
                      }),
                      _buildMenuItem(context, Icons.note, 'Notes', () {}),
                      _buildMenuItem(
                        context,
                        Icons.picture_as_pdf,
                        'Rapports PDF',
                        () {},
                      ),
                      _buildMenuItem(
                        context,
                        Icons.settings,
                        'Paramètres',
                        () {},
                      ),
                    ],
                  ),
                ),

                // Déconnexion
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF00A6C7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text(
                      'Déconnexion',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                // 🔗 Liens en bas
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            // Politique de confidentialité
                          },
                          child: Text(
                            'Politique de confidentialité',
                            style: TextStyle(color: Color(0xFF00A6C7)),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Contactez-nous
                          },
                          child: Text(
                            'Contactez-nous',
                            style: TextStyle(color: Color(0xFF00A6C7)),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF00A6C7)),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: Color(0xFF00A6C7),
          fontFamily: 'Poppins',
        ),
      ),
      onTap: onTap,
    );
  }
}
