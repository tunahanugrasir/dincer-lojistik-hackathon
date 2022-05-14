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
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('DEPON NEDİR ?'),
        backgroundColor: const Color(0xff03045e),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        children: const [
          ExpandedImage(image: 'assets/lottie_images/depo2.jpg'),
          ExpandedDescription(data: MyStrings.data1),
          ExpandedImage(image: 'assets/lottie_images/depo3.jpg'),
          ExpandedDescription(data: MyStrings.data2),
          ExpandedImage(image: 'assets/lottie_images/depo1.webp'),
          ExpandedDescription(data: MyStrings.data3),
          SizedBox(height: 100)
        ],
      ),
    );
  }
}

class ExpandedDescription extends StatelessWidget {
  const ExpandedDescription({
    Key? key,
    required this.data,
  }) : super(key: key);
  final String data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
            height: context.height / 4,
            decoration: BoxDecoration(color: const Color(0xff023e8a), borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
              child: Center(
                child: Text(
                  data,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                ),
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
  static const data1 =
      'DEPON kısaca anlaştığımız bütün perakende firmalarının dağıtım ve iade süreçlerinin tek bir çatı altında toplanmasıdır. Sipariş ettiğiniz ürünleri alabileceğiniz aynı zamanda hiç zorlanmadan ve herhangi bir bekleme olmadan anında ürünlerinizi iade edebileceğiniz bir hizmet sunuyoruz.';
  static const data2 =
      'Dünya genelinde artan çevrimiçi satışların yanında iadeler de aynı oranda artmış durumda. Bu durumun beraberinde getirdiği beş 5 milyar ton çöp sahası atığı ve 3 milyon araba ile aynı miktarda CO2 emisyonu üretmesi çevresel sorunlardan bazılarıdır. ';
  static const data3 =
      'Müşteri ve satıcılar arasındaki en büyük sorunlardan biri ise stok sorunudur. DEPON sayesinde iade edilen ürün çok hızlı bir şekilde yeniden raflara veya doğrudan sıradaki mutlu müşteriye teslim edilir.';
}
