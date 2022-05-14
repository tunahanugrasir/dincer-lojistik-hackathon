// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';

class HomeScreenBaseView extends StatefulWidget {
  const HomeScreenBaseView({Key? key}) : super(key: key);
  @override
  State<HomeScreenBaseView> createState() => _HomeScreenBaseViewState();
}

class _HomeScreenBaseViewState extends State<HomeScreenBaseView> with TickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isChecked = false;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      children: [
        Container(
          height: context.height / 2,
          decoration: BoxDecoration(color: const Color(0xff023e8a), borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text(
                        'Paketinizi teslim almak için lütfen kodunuzu okutunuz',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle2,
                      )))),
              Expanded(
                flex: 5,
                child: Lottie.asset(
                  'assets/lottie_images/qr.json',
                  controller: _animationController,
                  reverse: false,
                  onLoaded: (composition) {
                    if (_isChecked) {
                      setState(() {
                        _animationController
                          ..duration = composition.duration
                          ..forward();
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            _animationController.animateTo(_isChecked ? 0 : 1);
            setState(() {
              _isChecked = !_isChecked;
            });
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
            backgroundColor: MaterialStateProperty.all(
              const Color(0xff023e8a),
            ),
          ),
          child: _isChecked ? const Text('Kod okundu') : const Text('Kodunuzu okutun'),
        ),
        SizedBox(
          height: context.mediumValue,
        ),
        Text('SERVİSLER', style: GoogleFonts.slabo27px(fontSize: 35)),
        const ServiceCard(
          lottiePath: 'truck_running',
          isReverse: false,
          backgroundColor: Color(0xff023e8a),
          title: 'Kargo Durumunuz',
          description: 'Kargo durumunuz hakkında bilgi almak için dokunun',
        ),
        const ServiceCard(
          lottiePath: 'depo_location',
          isReverse: true,
          backgroundColor: Colors.white,
          title: 'Depo Adreslerimiz',
          description: 'Size en yakın akıllı depolarımızın adreslerini görmek için tıklayın',
        ),
        const ServiceCard(
          lottiePath: 'costumer',
          isReverse: true,
          backgroundColor: Color(0xff023e8a),
          title: 'Destek Ekibimiz',
          description:
              'Sorunlarınıza çözüm bulabileceğiniz ve aklınıza takılan sorularınıza yanıt bulabileceğiniz, 7/24 size yardımcı olmak için buradayız',
        ),
        const ServiceCard(
          lottiePath: 'company',
          isReverse: true,
          backgroundColor: Colors.white,
          title: 'Birazcık da Biz',
          description: 'Hakkımızda merak ettiğiniz her şey burada',
        ),
        SizedBox(
          height: context.height / 9,
        )
      ],
    );
  }
}

class ServiceCard extends StatefulWidget {
  const ServiceCard({
    Key? key,
    required this.isReverse,
    required this.backgroundColor,
    required this.lottiePath,
    required this.title,
    required this.description,
  }) : super(key: key);
  final bool isReverse;
  final Color backgroundColor;
  final String lottiePath;
  final String title;
  final String description;
  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  final String _lottieBasePath = 'assets/lottie_images/';
  bool _textColorIsWhite = true;

  @override
  void initState() {
    _changeTextColor(widget.backgroundColor);
    super.initState();
  }

  void _changeTextColor(Color backgroundColor) {
    if (backgroundColor == Colors.white) {
      _textColorIsWhite = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: context.height / 4,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.roboto(
                      color: _textColorIsWhite ? Colors.white : Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: context.height / 7,
                        width: context.width / 5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Lottie.asset(
                            '$_lottieBasePath${widget.lottiePath}.json',
                            reverse: widget.isReverse,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
                        child: Text(
                          widget.description,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            color: _textColorIsWhite ? Colors.white : Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
