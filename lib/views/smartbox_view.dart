import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class SmartBoxView extends StatefulWidget {
  const SmartBoxView({Key? key}) : super(key: key);

  @override
  State<SmartBoxView> createState() => _SmartBoxViewState();
}

class _SmartBoxViewState extends State<SmartBoxView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Akıllı Depolar Nedir ?'),
        backgroundColor: const Color(0xff03045e),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.real_estate_agent_outlined,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        children: const [
          ExpandedImage(image: 'assets/lottie_images/depo2.jpg'),
          ExpandedDescription(),
          ExpandedImage(image: 'assets/lottie_images/depo3.jpg'),
          ExpandedDescription(),
          ExpandedImage(image: 'assets/lottie_images/depo1.webp'),
          ExpandedDescription(),
          SizedBox(height: 100)
        ],
      ),
    );
  }
}

class ExpandedDescription extends StatelessWidget {
  const ExpandedDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
            height: context.height / 5,
            decoration: BoxDecoration(color: const Color(0xff023e8a), borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
              child: Text(
                MyStrings.data,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 17),
              ),
            )),
      ),
    );
  }
}

class ExpandedImage extends StatelessWidget {
  const ExpandedImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 10,
      child: Container(
        height: context.height / 3,
        width: context.width,
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}

class MyStrings {
  static const String data =
      'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium';
}
