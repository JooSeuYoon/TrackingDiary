import 'package:flutter/material.dart';
import 'package:tracking_diary/l10n/app_localizations.dart';

class HeroSection extends StatelessWidget {
  static const _olive = Color(0xFF5C5200);
  static const _textMuted = Color(0xFF888070);

  const HeroSection({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Icon circle
        Container(
          width: 72,
          height: 72,
          decoration: const BoxDecoration(
            color: _olive,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.description_rounded,
            color: Colors.white,
            size: 32,
          ),
        ),
        const SizedBox(height: 24),
 
        // Title
        const Text(
          'Track Folio',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w800,
            color: Color(0xFF3C3200),
            letterSpacing: -1.0,
            height: 1.1,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
 
        // Subtitle
        Text(
          AppLocalizations.of(context)?.mainTitle ?? 'Continue your writing journey.',
          style: TextStyle(
            fontSize: 15,
            color: _textMuted,
            height: 1.6,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}