import 'package:flutter/material.dart';
import 'welcome_screen.dart';

class Starter extends StatefulWidget {
  const Starter({super.key});
      
  @override
  State<Starter> createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  @override
  void initState() {
    super.initState();
    // Deixo a logo aparecer por um segundo antes de ir para a tela principal.
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      // Uso replacement para a pessoa não voltar para o carregamento pelo botão voltar.
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, animation, secondaryAnimation) {
            return const WelcomeScreen();
          },
          // Esse tempo controla a velocidade da transição entre as duas páginas.
          transitionDuration: const Duration(milliseconds: 900),
          reverseTransitionDuration: const Duration(milliseconds: 900),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // fundo escuro atrás do card
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            constraints: const BoxConstraints(maxWidth: 420),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // A mesma tag da welcome faz a logo viajar até a posição final.
                SizedBox(
                  height: 180,
                  child: Hero(
                    tag: 'folks-logo',
                    child: Image.asset(
                      'assets/fotos/logo.png',
                      height: 35,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Text(
                            'ERRO AO CARREGAR LOGO\n$error',
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                  ),
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}