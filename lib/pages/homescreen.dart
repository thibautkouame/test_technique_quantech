import 'package:flutter/material.dart';
import 'package:test_technique_quantech/const/colors.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:test_technique_quantech/pages/features.dart';
import 'package:test_technique_quantech/pages/senmoney.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  String selectedAccount = 'COMPTE COURANT';
  bool isBalanceVisible = false; // par defaut le solde est caché

  String get accountBalance {
    return selectedAccount == 'COMPTE COURANT'
        ? '2 930 500 XOF'
        : '100 000 XOF';
  }

  final List<String> imgList = ['assets/images/banner.png']; // liste des images

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkRed,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.menu, color: Colors.white),
          onPressed: () {
            showDevelopmentDialog(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.bell, color: Colors.white),
            onPressed: () {
              showDevelopmentDialog(context);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedAccount = 'COMPTE COURANT';
                          isBalanceVisible =
                              false; // Hide balance when switching
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            selectedAccount == 'COMPTE COURANT'
                                ? Colors.white24
                                : Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              selectedAccount == 'COMPTE COURANT'
                                  ? BorderRadius.circular(16)
                                  : BorderRadius.zero,
                        ),
                      ),
                      child: const Text(
                        'COMPTE COURANT',
                        style: TextStyle(color: Colors.white, fontSize: 8),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedAccount = 'COMPTE EPARGNE';
                          isBalanceVisible =
                              false; // Hide balance when switching
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            selectedAccount == 'COMPTE EPARGNE'
                                ? Colors.white24
                                : Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              selectedAccount == 'COMPTE EPARGNE'
                                  ? BorderRadius.circular(16)
                                  : BorderRadius.zero,
                        ),
                      ),
                      child: const Text(
                        'COMPTE EPARGNE',
                        style: TextStyle(color: Colors.white, fontSize: 8),
                      ),
                    ),
                    const SizedBox(width: 37),
                    Padding(
                      padding: const EdgeInsets.all(
                        .0,
                      ), // Adjust padding as needed
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.add, color: Colors.white),
                          onPressed: () {
                              showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  content: const Text(
                                    'Cette fonctionnalité est en cours de développement.',
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text(
                                        'OK',
                                        style: TextStyle(
                                          color: AppColors.darkRed,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 50,
              ), // Espace pour ne pas cacher le contenu sous la carte
              // Actions rapides

              // Section Bénéficiaires
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Bénéficiaires',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
              // Transactions
              // const SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(color: Color(0xFFF9F9F9)),
                  padding: const EdgeInsets.only(top: 115),
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              TransfertVirementScreen(),
                                    ),
                                  );
                                },
                                child: _buildActionButton(
                                  LucideIcons.arrowUpRight,
                                  'Transfert',
                                ),
                              ),
                              _buildActionButton(
                                LucideIcons.arrowDownLeft,
                                'Retraits',
                              ),
                              _buildActionButton(
                                LucideIcons.umbrella,
                                'Assurances',
                              ),
                              _buildActionButton(LucideIcons.wallet, 'Compte'),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Bénéficiaires',
                            style: TextStyle(
                              color: Color(0xFF1D2939),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Row(
                                  children: [
                                    _buildBeneficiary('AG', 'Akim Ger...'),
                                    _buildBeneficiary('KF', 'Koffi Fran...'),
                                    _buildBeneficiary('ID', 'Idia Diane'),
                                    _buildBeneficiary('ZK', 'Zora Khan'),
                                    _buildAddBeneficiary(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(0),
                              width: 330,
                              height: 150,
                              child: Image.asset(
                                'assets/images/banner.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFCB1D41),
                              ),
                            ),
                            SizedBox(width: 5),
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFA1D422E).withOpacity(0.18),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, top: 16),
                          child: Text(
                            'Transactions',
                            style: TextStyle(
                              color: Color(0xFF1D2939),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              _buildDateFilter('Aujourd\'hui', true),
                              _buildDateFilter('Hier', false),
                              _buildDateFilter('Avant-Hier', false),
                              _buildDateFilter('Voir +', false),
                            ],
                          ),
                        ),
                        // Liste des transactions scrollable
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height *
                              0.4, // Ajuste la hauteur selon l'écran
                          child: Column(
                            children: [
                              _buildTransactionItem(
                                'Transfert d\'argent',
                                '150.000 Fcfa',
                                true,
                              ),
                              _buildTransactionItem(
                                'Retrait d\'argent',
                                '90.000 Fcfa',
                                false,
                              ),
                              _buildTransactionItem(
                                'Transfert d\'argent',
                                '150.000 Fcfa',
                                true,
                              ),
                              _buildTransactionItem(
                                'Retrait d\'argent',
                                '90.000 Fcfa',
                                false,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 70, // Ajoute un margin-top de 20
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.pink[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.account_balance,
                          size: 24,
                          color: Color(0xFFCB1D41),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Compte courant - Principal',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF475467),
                                  ),
                                ),
                                SizedBox(width: 4),
                                Text('🇹🇬'),
                              ],
                            ),
                            Text(
                              'TG009 01285 109800901352',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF475467),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Mon solde',
                    style: TextStyle(fontSize: 14, color: Color(0xFF1D2939)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isBalanceVisible
                            ? accountBalance
                            : '****', // Show or hide balance
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1D2939),
                        ),
                      ),
                      Switch(
                        value: isBalanceVisible,
                        onChanged: (bool value) {
                          setState(() {
                            isBalanceVisible = value; // Update visibility
                          });
                        },
                        activeColor: Colors.white,
                        activeTrackColor: const Color(0xFFCB1D41),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: const Color(0xFFD9D9D9), width: 1.0),
          ),
        ),
        child: Stack(
          clipBehavior:
              Clip.none, // Permet de dépasser les limites du parent si nécessaire
          children: [
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color(0xFFF9F9F9),
              selectedItemColor: AppColors.darkRed,
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              unselectedItemColor: Colors.grey,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(LucideIcons.home, size: 20),
                  label: 'Accueil',
                ),
                BottomNavigationBarItem(
                  icon: Icon(LucideIcons.lineChart, size: 20),
                  label: 'Historiques',
                ),
                BottomNavigationBarItem(
                  icon: Icon(LucideIcons.creditCard, size: 20),
                  label: 'Cartes',
                ),
                BottomNavigationBarItem(
                  icon: Icon(LucideIcons.user, size: 20),
                  label: 'Profil',
                ),
              ],
            ),
            // Ajout du bord supérieur pour l'élément actif
            Positioned(
              left:
                  MediaQuery.of(context).size.width / 4 * _selectedIndex +
                  16, // Position dynamique en fonction de l'index sélectionné
              bottom: 57, // Ajustez la position verticale selon vos besoins
              child: Container(
                width:
                    MediaQuery.of(context).size.width / 4 -
                    32, // Largeur ajustée aux éléments du BottomNavigationBar
                height: 2, // Épaisseur du bord
                decoration: BoxDecoration(
                  color: AppColors.darkRed, // Couleur du bord
                  borderRadius: BorderRadius.circular(
                    2,
                  ), // Coins légèrement arrondis
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 65,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFF1D293980), width: 2.0),
          ),
          child: Icon(icon, color: AppColors.darkRed),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Color(0xFF1D2939), fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildDateFilter(String text, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0, // Supprime l'ombre
          backgroundColor: isSelected ? AppColors.white : Colors.white,
          foregroundColor: isSelected ? Color(0xFF1D2939) : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side:
                isSelected
                    ? BorderSide(color: Color(0xFFE4E7EC), width: 1.5)
                    : BorderSide.none,
          ),
        ),
        child: Text(text),
      ),
    );
  }

  Widget _buildTransactionItem(String title, String amount, bool isTransfer) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isTransfer ? Colors.green[100] : Colors.red[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          isTransfer ? Icons.arrow_upward : Icons.arrow_downward,
          color: isTransfer ? Colors.green : Colors.red,
        ),
      ),
      title: Text(title),
      subtitle: const Text('09:10:45'),
      trailing: Text(
        amount,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildBeneficiary(String initials, String name) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xFFE4E7EC),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                initials,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1D2939),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: const TextStyle(color: Color(0xFF1D2939), fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildAddBeneficiary() {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xFFE4E7EC), width: 1.5),
            ),
            child: const Center(
              child: Icon(LucideIcons.plus, color: Color(0xFF101828), size: 30),
            ),
          ),
          const SizedBox(height: 4),
          const SizedBox(height: 16), // Pour aligner avec les autres items
        ],
      ),
    );
  }
}
