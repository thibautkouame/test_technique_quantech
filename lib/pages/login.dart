import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math' as math;

import 'package:test_technique_quantech/const/colors.dart';
import 'package:test_technique_quantech/pages/homescreen.dart';
import 'package:test_technique_quantech/utils/config.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  TextEditingController _usernameController = TextEditingController(
    text: "emilys",
  );
  final TextEditingController _passwordController = TextEditingController(
    text: "emilyspass",
  );
  bool _isLoading = false;
  String? _errorMessage;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _login() async {

    String apiUrl = ApiConfig.getUrl('auth/login');
    
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': _usernameController.text,
        'password': _passwordController.text,
      }),
    );

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Bienvenue ${data['firstName']}!')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreenPage()),
      );
    } else {
      final errorData = jsonDecode(response.body);
      String errorMessage = errorData['message'] ?? 'Erreur inconnue';

      _showErrorDialog(context, errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Color(0xFFC6183D)),
                  onPressed: () {},
                ),
                SizedBox(height: 20),
                Text(
                  'Connexion',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 40),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Identifiant',
                    labelStyle: TextStyle(color: Color(0xFFB5BBC4)),
                    prefixIcon: Icon(
                      LucideIcons.user,
                      color: Color(0xFFB5BBC4),
                      size: 20,
                    ),
                    filled: true,
                    fillColor: Color(0xFFF2F4F7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Mot de passe',
                          labelStyle: TextStyle(color: Color(0xFFB5BBC4)),
                          prefixIcon: Icon(
                            LucideIcons.lock,
                            color: Color(0xFFB5BBC4),
                            size: 20,
                          ),
                          filled: true,
                          fillColor: Color(0xFFF2F4F7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF2F4F7),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: EdgeInsets.all(
                        10.0,
                      ), // Espace entre le bord et le contenu
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder:
                                  (context) => AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: Text(
                                      'Cette fonctionnalité est en cours de développement.',
                                      style: TextStyle(
                                        color: Color(0xFF1D2939),
                                        fontSize: 16,
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          'OK',
                                          style: TextStyle(
                                            color: AppColors.darkRed,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                            );
                          },
                          child: Icon(
                            LucideIcons.scanFace,
                            color: Color(0xFF1D2939).withOpacity(0.5),
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                if (_errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      _errorMessage!,
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Mot de passe oublié ?',
                      style: TextStyle(color: Color(0xFF98A2B3), fontSize: 12),
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFC6183D),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: _isLoading ? null : _login,
                    child: Text(
                      'Se connecter',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
        if (_isLoading)
          Container(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return CustomPaint(
                    painter: DottedCircularProgress(_animationController.value),
                    size: Size(50, 50),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}

class DottedCircularProgress extends CustomPainter {
  final double progress;
  DottedCircularProgress(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;
    final center = size.center(Offset.zero);
    final radius = size.width / 2;
    final int dots = 12;

    for (int i = 0; i < dots; i++) {
      double angle = (i / dots) * 2 * math.pi + (progress * 2 * math.pi);
      final Offset dotPosition = Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );
      canvas.drawCircle(dotPosition, 4, paint);
    }
  }

  @override
  bool shouldRepaint(DottedCircularProgress oldDelegate) => true;
}

void _showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            'Erreur Authentification',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.lightBlack,
            ),
          ),
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.lightBlack,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Column(
                children: [
                  Container(
                    height: 1,
                    color: Color(0xFF1D2939), // Change color as needed
                  ),
                  SizedBox(height: 15),
                  Align(
                    child: Text(
                      'ESSAYER A NOUVEAU',
                      style: TextStyle(
                        color: AppColors.lightBlack,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
  );
}
