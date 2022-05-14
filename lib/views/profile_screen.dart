import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreenView extends StatefulWidget {
  const ProfileScreenView({Key? key}) : super(key: key);
  @override
  State<ProfileScreenView> createState() => _ProfileScreenViewState();
}

class _ProfileScreenViewState extends State<ProfileScreenView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(color: const Color(0xff03045e), borderRadius: BorderRadius.circular(20)),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 28),
                  child: Text(
                    'Profil',
                    style: GoogleFonts.merriweather(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/lottie_images/profile_1.jpg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Mustafa Dinçer',
                    style: GoogleFonts.merriweather(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                Text(
                  'mustafa.dincer@gmail.com',
                  style: GoogleFonts.merriweather(
                      fontSize: 14, fontWeight: FontWeight.bold, color: const Color.fromARGB(181, 255, 255, 255)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(10),
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xff03045e),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )),
                    onPressed: () {},
                    icon: const Icon(Icons.edit_outlined),
                    label: const Text('Profili Düzenle'),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: SizedBox(
                height: 500,
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8),
                      child: SizedBox(
                        width: 200,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.delivery_dining_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 150,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Kargolarım',
                                    style: GoogleFonts.merriweather(color: Colors.white),
                                  ),
                                  const Opacity(opacity: 0, child: Icon(Icons.add))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SizedBox(
                        width: 200,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.credit_card_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 150,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Kayıtlı Kartlarım',
                                    style: GoogleFonts.merriweather(color: Colors.white),
                                  ),
                                  const Opacity(opacity: 0, child: Icon(Icons.add))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SizedBox(
                        width: 200,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.settings_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 150,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Ayarlar',
                                    style: GoogleFonts.merriweather(color: Colors.white),
                                  ),
                                  const Opacity(opacity: 0, child: Icon(Icons.add))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
