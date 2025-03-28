import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:test_technique_quantech/const/colors.dart';
import 'dart:async';

import 'package:test_technique_quantech/pages/homescreen.dart';

class TransfertVirementScreen extends StatefulWidget {
  @override
  _TransfertVirementScreenState createState() =>
      _TransfertVirementScreenState();
}

class _TransfertVirementScreenState extends State<TransfertVirementScreen> {
  bool isRecurrent = false;
  String selectedAccount = "Compte Enfant";
  TextEditingController motifController = TextEditingController();
  TextEditingController montantController = TextEditingController();
  int selectedTransferType = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Transférer de \n l'argent"),
        titleTextStyle: TextStyle(
          color: Color(0xFF1D2939),
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFFC6183D), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Group_95.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            height: 1.0,
            color: Color.fromARGB(255, 237, 236, 236),
          ),
        ),
      ),
      body: SingleChildScrollView(
        // Added SingleChildScrollView to prevent overflow
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTransferOptions(),
            SizedBox(height: 16.0),
            _buildAmountSection(),
            SizedBox(height: 16.0),
            _buildRecurrentSwitch(),
            SizedBox(height: 16.0), // Added spacing before the button
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        child:
            _buildSubmitButton(), // Moved the button to the bottom of the page
      ),
    );
  }

  Widget _buildTransferOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedTransferType = 0;
                      });
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              LucideIcons.wallet,
                              color:
                                  selectedTransferType == 0
                                      ? Color(0xFFC6183D)
                                      : Colors.grey,
                              size: 24,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Virement compte\nà compte',
                                style: TextStyle(
                                  color:
                                      selectedTransferType == 0
                                          ? Color(0xFF1D2939)
                                          : Colors.grey,
                                  fontSize: 16,
                                  fontWeight:
                                      selectedTransferType == 0
                                          ? FontWeight.w600
                                          : FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 2,
                          color:
                              selectedTransferType == 0
                                  ? Color(0xFFC6183D)
                                  : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedTransferType = 1;
                      });
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              LucideIcons.user,
                              color:
                                  selectedTransferType == 1
                                      ? Color(0xFFC6183D)
                                      : Colors.grey,
                              size: 24,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Virement vers\nun bénéficiaire',
                                style: TextStyle(
                                  color:
                                      selectedTransferType == 1
                                          ? Color(0xFF1D2939)
                                          : Colors.grey,
                                  fontSize: 16,
                                  fontWeight:
                                      selectedTransferType == 1
                                          ? FontWeight.w600
                                          : FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Container(
                          height: 2,
                          color:
                              selectedTransferType == 1
                                  ? Color(0xFFC6183D)
                                  : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(height: 1, color: Colors.grey[300]),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xfff6f7f8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.savings_outlined,
                      color: Colors.grey[600],
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Compte épargne TG009 01285 109800909013525',
                            style: TextStyle(
                              color: Color(0xFF1D2939),
                              fontSize: 8,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '1 310 000 XOF',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
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
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xffFFF1F2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(LucideIcons.users, color: Color(0xFFC6183D), size: 20),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Compte Enfant TG009 01285 109800909013525',
                            style: TextStyle(
                              color: Color(0xFF1D2939),
                              fontSize: 8,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '873 750 XOF',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAmountSection() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Saisir le motif du virement',
            style: TextStyle(color: AppColors.lightBlack, fontSize: 14),
          ),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 246, 246, 246),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Color(0xFFE4E7EC)),
            ),
            child: TextField(
              controller: motifController,
              keyboardType: TextInputType.text,
              style: TextStyle(
                color: AppColors.lightBlack,
                fontWeight: FontWeight.w600,
              ), // Changed to red for the entered text
              decoration: InputDecoration(
                prefixIcon: Icon(LucideIcons.coins, color: Color(0xFF667085)),
                hintText: 'Cliquer pour saisir le motif',
                hintStyle: TextStyle(
                  color: Color.fromRGBO(102, 112, 133, 1),
                  fontSize: 16,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Saisir du montant du virement',
            style: TextStyle(color: AppColors.lightBlack, fontSize: 14),
          ),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 246, 246, 246),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Color(0xFFE4E7EC)),
            ),
            child: TextField(
              controller: montantController,
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: AppColors.lightBlack,
                fontWeight: FontWeight.w600,
              ), // Changed to red for the entered text
              decoration: InputDecoration(
                prefixIcon: Icon(LucideIcons.menu, color: Color(0xFF667085)),
                hintText: 'Cliquer pour saisir le montant',
                hintStyle: TextStyle(color: Color(0xFF667085), fontSize: 16),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecurrentSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Virement récurrent ?"),
        SizedBox(width: 10),
        Switch(
          activeColor: Color.fromARGB(255, 255, 255, 255),
          activeTrackColor: AppColors.darkRed,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Color(0xFFD9DDE4),
          value: isRecurrent,
          onChanged: (value) => setState(() => isRecurrent = value),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (motifController.text.isNotEmpty &&
              montantController.text.isNotEmpty) {
            _showConfirmationDialog(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    Icon(LucideIcons.alertCircle, color: Colors.white),
                    SizedBox(width: 8),
                    Text("Veuillez remplir tous les champs"),
                  ],
                ),
                backgroundColor: AppColors.darkRed,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), 
                ),
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkRed,
          padding: EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          "Suivant",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Récapitulatif",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1D2939),
                    ),
                  ),
                ),
                SizedBox(height: 24),

                // Compte à débiter
                Text(
                  "Compte à débiter",
                  style: TextStyle(fontSize: 14, color: Color(0xFF667085)),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      LucideIcons.landmark,
                      color: Color(0xFFC6183D),
                      size: 30,
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Compte Enfant",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF667085),
                          ),
                        ),
                        Text(
                          "TG009 01285 910209091383",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF667085),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Compte à créditer
                Text(
                  "Compte à créditer",
                  style: TextStyle(fontSize: 14, color: Color(0xFF667085)),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.savings_outlined,
                      color: Color(0xFFC6183D),
                      size: 30,
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Compte épargne",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF667085),
                          ),
                        ),
                        Text(
                          "TG009 01285 109800909013525",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF475467),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Mode de transfert
                Text(
                  "Mode de transfert",
                  style: TextStyle(fontSize: 14, color: Color(0xFF667085)),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 246, 246, 246),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        LucideIcons.wallet,
                        color: Color(0xFFC6183D),
                        size: 18,
                      ),
                      SizedBox(width: 8),
                      Container(height: 15, width: 1, color: Color(0xFF667085)),
                      SizedBox(width: 8),
                      Text(
                        "Virement compte à compte",
                        style: TextStyle(
                          fontSize: 13.5,
                          color: Color(0xFF1D2939),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),

                // Montant du montant
                Text(
                  "Montant du montant",
                  style: TextStyle(fontSize: 14, color: Color(0xFF667085)),
                ),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 246, 246, 246),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.edit_note_outlined,
                        color: Color(0xFF667085),
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Container(height: 15, width: 1, color: Color(0xFF667085)),
                      SizedBox(width: 8),
                      Text(
                        "540 000 XOF",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF1D2939),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),

                // Libellé du retrait
                Text(
                  "Libellé du retrait",
                  style: TextStyle(fontSize: 14, color: Color(0xFF667085)),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 246, 246, 246),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        LucideIcons.menu,
                        color: Color(0xFF667085),
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Container(height: 15, width: 1, color: Color(0xFF667085)),
                      SizedBox(width: 8),
                      Text(
                        "Urgence médicale",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF1D2939),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Show a circular progress indicator
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder:
                            (context) =>
                                Center(child: CircularProgressIndicator()),
                      );
                      Future.delayed(Duration(seconds: 3), () {
                        Navigator.pop(context);
                        _showOtpBottomSheet(context);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkRed,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Confirmer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showOtpBottomSheet(BuildContext context) {
    final otpController = TextEditingController();
    int remainingSeconds = 34;
    Timer? timer;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            timer?.cancel();
            timer = Timer.periodic(Duration(seconds: 1), (timer) {
              setState(() {
                if (remainingSeconds > 0) {
                  remainingSeconds--;
                } else {
                  timer.cancel();
                }
              });
            });

            return Container(
              height: MediaQuery.of(context).size.height * 0.9,
              // padding: EdgeInsets.only(left: 24, right: 24, top: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // color: Colors.red,
                    child: Padding(
                      padding: EdgeInsets.only(left: 0, right: 0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: AppColors.darkRed,
                                  size: 18,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color.fromARGB(
                                    255,
                                    227,
                                    227,
                                    227,
                                  ), // Color of the bottom border
                                  width: 1.0, // Width of the bottom border
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 1), // Added space at the start
                                Text(
                                  'Vérification du \n code OTP',
                                  style: TextStyle(
                                    color: Color(0xFF1D2939),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/Group_94.png', // Replace with your image path
                                  height: 100,
                                  fit:
                                      BoxFit.contain, // Adjust height as needed
                                ),
                                SizedBox(width: 1), // Added space at the end
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 60), // OTP Input Section
                  // padding: EdgeInsets.only(left: 24, right: 24, top: 24),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 24),
                    child: Text('Renseigner le OTP reçu par SMS'),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 24, top: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        6,
                        (index) => Container(
                          width: 50, // Increased width
                          height: 50, // Increased height
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(
                              255,
                              247,
                              246,
                              246,
                            ), // Added red background
                            borderRadius: BorderRadius.circular(
                              8,
                            ), // Added rounded border
                            border:
                                index == otpController.text.length
                                    ? Border.all(
                                      color: Color(0xFF69BBFD),
                                      width: 2,
                                    ) // Added red border for active element
                                    : null,
                          ),
                          child: Text(
                            index < otpController.text.length
                                ? otpController.text[index]
                                : '',
                            style: TextStyle(
                              fontSize: 24, // Increased font size
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: Text(
                      'Renvoyer le code dans 00:00',
                      style: TextStyle(color: Color(0xFF667085), fontSize: 12),
                    ),
                  ),
                  SizedBox(height: 7),
                  ElevatedButton(
                    onPressed:
                        otpController.text.length == 6
                            ? () {
                              //   Show a circular progress indicator
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder:
                                    (context) => Center(
                                      child: CircularProgressIndicator(),
                                    ),
                              );

                              // Delay for 3 seconds before showing the success dialog
                              Future.delayed(Duration(seconds: 3), () {
                                Navigator.pop(
                                  context,
                                ); // Close the progress indicator
                                // Show success message with check icon
                                showDialog(
                                  context: context,
                                  builder:
                                      (context) => AlertDialog(
                                        backgroundColor: Colors.white,
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/images/Group_43.png', // Replace with your image path
                                              width: 100,
                                              height: 100,
                                            ),
                                            SizedBox(height: 20),
                                          ],
                                        ),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Center(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Félicitation',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 22,
                                                          color: Color(
                                                            0xFF1D2939,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Votre virement a été effectué avec succès.',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color.fromARGB(
                                                            255,
                                                            71,
                                                            86,
                                                            107,
                                                          ),
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) =>
                                                          HomeScreenPage(),
                                                ),
                                              ); // Navigate to HomeScreenPage
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 1,
                                                  color: Color(
                                                    0xFF1D2939,
                                                  ), // Change color as needed
                                                ),
                                                SizedBox(height: 10),
                                                Align(
                                                  child: Text(
                                                    'OK',
                                                    style: TextStyle(
                                                      color: AppColors.darkRed,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                );
                              });
                            }
                            : null,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFC6183D),
                      minimumSize: Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Valider',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  // SizedBox(height: 24),

                  // Custom Keypad
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 1.5,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                      children: [
                        ...List.generate(9, (index) {
                          return _buildKeypadButton(
                            '${index + 1}',
                            subtitle:
                                index < 8
                                    ? [
                                      'ABC',
                                      'DEF',
                                      'GHI',
                                      'JKL',
                                      'MNO',
                                      'PQRS',
                                      'TUV',
                                      'WXYZ',
                                    ][index]
                                    : '',
                            onTap: () {
                              if (otpController.text.length < 6) {
                                setState(() {
                                  otpController.text += '${index + 1}';
                                });
                              }
                            },
                          );
                        }),
                        _buildKeypadButton('', onTap: null),
                        _buildKeypadButton(
                          '0',
                          onTap: () {
                            if (otpController.text.length < 6) {
                              setState(() {
                                otpController.text += '0';
                              });
                            }
                          },
                        ),
                        _buildKeypadButton(
                          '',
                          icon: Icons.backspace_outlined,
                          onTap: () {
                            if (otpController.text.isNotEmpty) {
                              setState(() {
                                otpController.text = otpController.text
                                    .substring(
                                      0,
                                      otpController.text.length - 1,
                                    );
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ).whenComplete(() => timer?.cancel());
  }

  Widget _buildKeypadButton(
    String text, {
    String subtitle = '',
    IconData? icon,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xFFE4E7EC)),
        ),
        child:
            icon != null
                ? Icon(icon, color: Color(0xFF667085))
                : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1D2939),
                      ),
                    ),
                    if (subtitle.isNotEmpty)
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF667085),
                        ),
                      ),
                  ],
                ),
      ),
    );
  }
}
