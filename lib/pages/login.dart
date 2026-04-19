import 'package:flutter/material.dart';
import 'package:tracking_diary/l10n/app_localizations.dart';
import 'package:tracking_diary/widgets/google_button.dart';
import 'package:tracking_diary/widgets/hero_section.dart';
import 'package:tracking_diary/pages/signup.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});
 
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  late AnimationController _animController;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;
 
  static const _olive = Color(0xFF5C5200);
  static const _oliveDark = Color(0xFF4A4200);
  static const _bg = Color(0xFFF5F0E8);
  static const _cardBg = Color(0xFFFAF7F0);
  static const _textMuted = Color(0xFF888070);
  
  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeAnim = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOut,
    );
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOut,
    ));
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnim,
          child: SlideTransition(
            position: _slideAnim,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  const SizedBox(height: 16),
 
                  // ── Hero Section ──────────────────────────────────────
                  HeroSection(),
 
                  const SizedBox(height: 32),
 
                  // ── Login Card ────────────────────────────────────────
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28, vertical: 36),
                    decoration: BoxDecoration(
                      color: _cardBg,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: _olive.withOpacity(0.08),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            AppLocalizations.of(context)?.welcome ?? 'Welcome',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF2C2800),
                              letterSpacing: -0.3,
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),
 
                        // Google Button
                        GoogleButton(),
 
                        const SizedBox(height: 24),
 
                        // Divider
                        Row(
                          children: [
                            Expanded(
                                child: Divider(color: _olive.withOpacity(0.15))),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                AppLocalizations.of(context)?.orUseEmail ?? 'OR USE EMAIL',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: _textMuted,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                            Expanded(
                                child: Divider(color: _olive.withOpacity(0.15))),
                          ],
                        ),
 
                        const SizedBox(height: 24),
 
                        // Email Field
                        Text(
                          AppLocalizations.of(context)?.emailAddress ?? 'Email Address',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: _textMuted,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF2C2800),
                          ),
                          decoration: InputDecoration(
                            hintText: 'lemon@example.com',
                            hintStyle: TextStyle(
                              color: _textMuted.withOpacity(0.6),
                              fontSize: 15,
                            ),
                            filled: true,
                            fillColor: _bg,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide(
                                  color: _olive.withOpacity(0.5), width: 1.5),
                            ),
                          ),
                        ),
 
                        const SizedBox(height: 20),
                        // Password Field
                        Text(
                          AppLocalizations.of(context)?.password ?? 'Password',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: _textMuted,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF2C2800),
                          ),
                          decoration: InputDecoration(
                            hintText: '••••••••',
                            hintStyle: TextStyle(
                              color: _textMuted.withOpacity(0.6),
                              fontSize: 15,
                            ),
                            filled: true,
                            fillColor: _bg,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide(
                                  color: _olive.withOpacity(0.5),
                                  width: 1.5),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: _textMuted,
                                size: 20,
                              ),
                              onPressed: () => setState(() =>
                                  _obscurePassword = !_obscurePassword),
                            ),
                          ),
                        ),
 
                        const SizedBox(height: 20),

                        // Sign In Button
                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO: handle sign in
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _olive,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: Text(
                              AppLocalizations.of(context)?.signIn ?? 'SING IN',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
 
                  const SizedBox(height: 36),
 
                  // ── Footer ────────────────────────────────────────────
                  Text(
                    AppLocalizations.of(context)?.newHere ?? 'New here? Create your studio space in seconds.',
                    style: TextStyle(
                      fontSize: 13,
                      color: _textMuted,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpPage()),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: _oliveDark,
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      AppLocalizations.of(context)?.joinUs ?? 'JOIN US',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.1,
                      ),
                    ),
                  ),
 
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
        ),
      ),
    );
  }
 
}
