import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnBoarding(),
    );
  }
}

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}
const bodyStyle = TextStyle(fontSize: 19.0, color: Color(0xFFEEF2F5));
const titleStyle = TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, color: Color(0xFF3DF2F2));
PageDecoration pageDecoration =  PageDecoration(
  titleTextStyle: titleStyle,
  bodyTextStyle: bodyStyle,
  descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
  contentMargin: EdgeInsets.only(bottom: 60),
  bodyAlignment: Alignment.bottomLeft,
  boxDecoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        HexColor("#945CCC"),
        HexColor("#683B94")
      ]
    )
  ),
);
class _OnBoardingState extends State<OnBoarding> {
  final introKey = GlobalKey<IntroductionScreenState>();
  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => MyHomePage()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Color(0xFF683B94),
      pages: [
        PageViewModel(
          title: "Anuncie grátis o seu imóvel",
          bodyWidget: Text(
            "Crie o seu anúncio no app da Livima e ele aparece para milhares de pessoas na OLX, Mercado Livre, Imovelweb, Chaves na Mão, Moving e, claro, no nosso site.", 
            style: bodyStyle, 
            textAlign: TextAlign.left,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Negocie diretamente com os interessados",
          bodyWidget:
            Text(
              "Tenha o contato dos interessados na palma da sua mão. Use o app para falar por email, telefone ou WhatsApp.",
              style: bodyStyle, 
              textAlign: TextAlign.left,
            ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Contratos, documentos e financiamento imobiliário.",
          bodyWidget:
            Text(
              "Quando achar o cliente ideal, contrate a nossa assessoria. Fique tranquilo, nós vamos te ajudar com toda burocracia!",
              style: bodyStyle, 
              textAlign: TextAlign.left,
            ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Economize muito mais",
          bodyWidget:
            Text(
              "Esqueça os 6% de comissão. Na Livima você pode anunciar mais barato e vender mais rápido. O proprietário ganha mais e o comprador paga menos!",
              style: bodyStyle, 
              textAlign: TextAlign.left,
            ),
          footer: Container(
            width: double.infinity,
            height: 60,
            color: Colors.blue,
          ),
          //SizedBox(
          //  width: double.infinity,
          //  height: 60,
          //  child: ElevatedButton(
          //    child: const Text(
          //      'Let\s go right away!',
          //      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          //    ),
          //    onPressed: () => _onIntroEnd(context),
          //  ),
          //),
          decoration: pageDecoration,
        )
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      showDoneButton: false,
      showNextButton: false,
      skipFlex: 0,
      nextFlex: 0,
      rtl: false, // Display as right-to-left
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      //controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        activeColor: Color(0xFFFFFFFF),
        color: Color(0xFFBD95E6),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Onboarding"),
      ),
      body: Container(child: Text("home"),)
    );
  }
}
