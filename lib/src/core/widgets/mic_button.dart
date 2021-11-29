import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class MicButton extends StatelessWidget {
  const MicButton({Key? key, required this.onTab, required this.isListening}) : super(key: key);

  final Function() onTab;
  final bool isListening;

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      animate: isListening,
      // show animation if listening
      glowColor: Theme.of(context).primaryColor,
      endRadius: 75.0,
      duration: const Duration(milliseconds: 2000),
      repeatPauseDuration: const Duration(milliseconds: 100),
      repeat: true,
      child: ElevatedButton(
        onPressed: onTab,
        child: Icon( isListening ? Icons.mic : Icons.mic_none, color: Colors.white),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
          primary:  isListening ? Theme.of(context).primaryColorDark : Theme.of(context).primaryColor, // <-- Button color
          onPrimary:
          Theme.of(context).primaryColorDark, // <-- Splash color
        ),
      ),
    );
  }
}