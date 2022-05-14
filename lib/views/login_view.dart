import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'home_screen.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with TickerProviderStateMixin {
  late AnimationController _controller;
  double _height = 0;
  double _width = 0;
  double _iconSize = 0;
  static const colorizeColors = [
    Color(0xff68C9EC),
    Color(0xff03045e),
    Color(0xffAEE8DE),
    Color(0xff99D7FF),
    Color(0xff7BD7D5),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _updateContainer();
      }
    });
  }

  void _updateContainer() {
    setState(() {
      _height = 175;
      _width = 300;
      _iconSize = 24;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              child: Lottie.asset(
            'assets/lottie_images/login.json',
            fit: BoxFit.cover,
            controller: _controller,
            repeat: false,
            onLoaded: (composition) {
              _controller
                ..duration = composition.duration
                ..forward();
              _controller.isCompleted;
            },
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              future: Future.delayed(const Duration(seconds: 10)),
              builder: (context, snapshot) {
                return AnimatedOpacity(
                  curve: Curves.easeInOutCubicEmphasized,
                  duration: const Duration(seconds: 3),
                  opacity: _controller.value,
                  child: AnimatedTextKit(
                    isRepeatingAnimation: true,
                    repeatForever: true,
                    animatedTexts: [
                      ColorizeAnimatedText(
                        'DEPON',
                        colors: colorizeColors,
                        textStyle: GoogleFonts.aldrich(
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          AnimatedContainer(
            duration: const Duration(seconds: 3),
            height: _height,
            width: _width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'e-mail',
                      prefixIcon: Icon(Icons.mail_outlined, size: _iconSize),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'password',
                      prefixIcon: Icon(Icons.key_outlined, size: _iconSize),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SizedBox.expand(
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xff03045e))),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                          return const HomeScreen();
                        })));
                      },
                      child: const Text('Giriş Yap'),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
