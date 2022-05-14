import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';

class ReturnView extends StatefulWidget {
  const ReturnView({Key? key}) : super(key: key);

  @override
  State<ReturnView> createState() => _ReturnViewState();
}

class _ReturnViewState extends State<ReturnView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      children: [
        Container(
          height: context.height * 0.75,
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
                          child: Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: Text(
                          'Ürünü iade edeceğinize üzüldük..\nEn azından sizin için bu işlemi en kolay hale getirelim',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      )))),
              Expanded(
                flex: 5,
                child: Lottie.asset(
                  'assets/lottie_images/2men.json',
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 30.0, right: 10),
                  child: Center(
                    child: Text(
                      'Lütfen aşağıya sipariş kodunuzu girdikten sonra Onayla butonuna basın',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: TextFormField(
            decoration: InputDecoration(
              fillColor: Colors.white,
              iconColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.white, style: BorderStyle.solid)),
              labelText: 'Sipariş kodu',
              prefixIcon: const Icon(Icons.qr_code_2_outlined),
            ),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color(0xff023e8a),
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
          child: const Text('Onayla'),
          onPressed: () {
            showDialog(
                builder: (context) {
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return AlertDialog(
                        title: Text('Siparişinizi değiştirmek mi, iade etmek mi istersiniz?',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(fontSize: 19, fontWeight: FontWeight.bold)),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(const Color(0xff03045e)),
                                ),
                                child: const Text('Değişim istiyorum'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('İade istiyorum', style: TextStyle(color: Color(0xff03045e))),
                              )
                            ],
                          )
                        ],
                      );
                    },
                  );
                },
                context: context);
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            height: context.height / 12,
          ),
        )
      ],
    );
  }
}
