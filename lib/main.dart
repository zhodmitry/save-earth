import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/rendering.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Save Earth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  VideoPlayerController _controllerTsla;
  VideoPlayerController _controllerOcean;
  VideoPlayerController _controllerCombined;

  @override
  void initState() {
    super.initState();
    _controllerTsla = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/personal-website-1c6ea.appspot.com/o/teslaVideo.mp4?alt=media&token=8915cb4a-dbb9-4913-a223-fe9717c1f21b')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controllerTsla.setVolume(0);
    _controllerTsla.setLooping(true);
    _controllerOcean = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/personal-website-1c6ea.appspot.com/o/saveEarth%2Foc1ed.mp4?alt=media&token=ced031a4-1e0c-4630-9363-6e0171e6452e')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controllerOcean.setVolume(0);
    _controllerOcean.setLooping(true);
    _controllerCombined = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/personal-website-1c6ea.appspot.com/o/lstvideo.mp4?alt=media&token=550cd3b9-f8b0-4168-8d19-277a436509b3')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controllerCombined.setVolume(0);
    _controllerCombined.setLooping(true);
  }

  PageController pageController = PageController();
  bool isEarthNotSpinning = false;
  Duration pageDuration = Duration(milliseconds: 500);
  Curve pageCurve = Curves.easeIn;
  //Walk. Recycle. Talk.

  String intro =
      "This website was created to show the humanity its most life-threatening problems, how the problems are being solved, and what you can do to help save our shared home.";
  String secondPageText =
      "Climate change is shaping what the future will look like and plunging the world into crisis. Cities are adapting to more frequent and intense extreme weather events, like superstorms and heatwaves. People are already battling more destructive wildfires, salvaging flooded homes, or migrating to escape sea level rise." +
          " Policies and economies are also changing as world leaders and businesses try to cut down global greenhouse gas emissions. How energy is produced is shifting, too — from fossil fuels to carbon-free renewable alternatives like solar and wind power.";

  String thirdPageText2 =
      "Tesla was founded in 2003 by a group of engineers who wanted to prove that people didn’t need to compromise to drive electric – that electric vehicles could be better, quicker and more fun to drive than gasoline cars. Today, Tesla build not only all-electric vehicles but also infinitely scalable clean energy generation and storage products. ";
  String thirdPageText1 =
      "The world cannot reduce CO2 emissions without addressing energy generation and consumption. And the world cannot address its energy habits without directly reducing emissions in the transportation and power sectors.";

  String fourthPageText =
      "Norway, the global leader in the transition to electric vehicles, has seen its strongest ever February with over 68% market share for plug-in passenger vehicles. The vast majority of plug-ins were pure electric (BEV), which took 49.7% of the overall market. Pure fossil vehicles continued their decline, to just over 20% market share.";

  String fifthPageText2 =
      "The Ocean Cleanup is developing a passive cleanup method, which uses the natural oceanic forces to rapidly and cost-effectively clean up the plastic already in the oceans. With a full fleet of cleanup systems in the Great Pacific Garbage Patch, they aim to clean up 50% of its plastic every five years.";

  String fifthPageText1 =
      "The majority of the garbage that enters the ocean each year is plastic—and here to stay. That’s because unlike other trash, the single-use grocery bags, water bottles, drinking straws, and yogurt containers, among eight million metric tons of the plastic items we toss (instead of recycle), won’t biodegrade. Instead, they can persist in the environment for a millennium, polluting our beaches, entangling marine life, and getting ingested by fish and seabirds.";

  String sixthPageText1 =
      "As the world seeks to slow the pace of climate change, preserve wildlife, and support billions of people, trees inevitably hold a major part of the answer. Yet the mass destruction of trees—deforestation—continues, sacrificing the long-term benefits of standing trees for short-term gain.";

  String sixthPageText2 =
      "Forests still cover about 30 percent of the world’s land area, but they are disappearing at an alarming rate. Between 1990 and 2016, the world lost 502,000 square miles (1.3 million square kilometers) of forest, according to the World Bank—an area larger than South Africa. Since humans started cutting down forests, 46 percent of trees have been felled, according to a 2015 study in the journal Nature. About 17 percent of the Amazonian rainforest has been destroyed over the past 50 years, and losses recently have been on the rise.";

  _arrowDown(Color color, int page) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () {
          pageController.animateToPage(page,
              duration: pageDuration, curve: pageCurve);
        },
        child: Container(
          width: 50,
          height: 50,
          child: FlareActor(
            "rive/arrow.flr",
            animation: "idle",
            fit: BoxFit.contain,
            color: color,
          ),
        ),
      ),
    );
  }

  _firstPage() {
    return Container(
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Padding(
                  padding: EdgeInsets.only(left: 100),
                  child: Text(
                    intro,
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Center(
                  child: FlareActor("rive/world_spin.flr",
                      animation: "spin", fit: BoxFit.contain),
                ),
              )
            ],
          ),
          _arrowDown(Colors.black, 1)
        ],
      ),
    );
  }

  _secondPage() {
    return Container(
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                            borderRadius: BorderRadius.circular(20),
                            elevation: 8,
                            child: Image.network(
                              "https://firebasestorage.googleapis.com/v0/b/personal-website-1c6ea.appspot.com/o/saveEarth%2F1.jpg?alt=media&token=a33038a5-1079-4789-ac26-ed66ecdb37e8",
                              width: 600,
                              fit: BoxFit.fitWidth,
                            )),
                      ),
                    ),
                    Center(
                      child: Material(
                          borderRadius: BorderRadius.circular(20),
                          elevation: 8,
                          child: Image.network(
                            "https://firebasestorage.googleapis.com/v0/b/personal-website-1c6ea.appspot.com/o/saveEarth%2F2.jpg?alt=media&token=b53b55e5-5420-4e95-a8fa-2cd9468fc3e4",
                            width: 600,
                            fit: BoxFit.fitWidth,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0, right: 20),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Material(
                            borderRadius: BorderRadius.circular(20),
                            elevation: 8,
                            child: Image.network(
                              "https://firebasestorage.googleapis.com/v0/b/personal-website-1c6ea.appspot.com/o/saveEarth%2F4.jpg?alt=media&token=da1e3631-0cb0-4897-93e3-e1aae7276b9e",
                              width: 550,
                              fit: BoxFit.fitWidth,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    secondPageText,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
          _arrowDown(Colors.black, 2)
        ],
      ),
    );
  }

  _thirdPage() {
    return Container(
      child: Stack(
        children: [
          SizedBox.expand(
              child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                      width: _controllerTsla.value.size?.width ?? 0,
                      height: _controllerTsla.value.size?.height ?? 0,
                      child: VideoPlayer(_controllerTsla)))),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(50),
                child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        // border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(thirdPageText1,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold)),
                    )),
              )),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    // border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width / 2,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    thirdPageText2,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          _arrowDown(Colors.white, 3)
        ],
      ),
    );
  }

  _fourthPage() {
    return Container(
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("February 2020 Norway passenger auto registrations",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: AnimatedCircularChart(
                      // chartType: CircularChartType.Pie,
                      percentageValues: true,
                      holeRadius: 150,
                      duration: Duration(milliseconds: 500),
                      size: Size(600, 600),
                      initialChartData: [
                        CircularStackEntry([
                          CircularSegmentEntry(
                            9.7,
                            Colors.orange,
                          ),
                          CircularSegmentEntry(
                            12.2,
                            Colors.red,
                          ),
                          CircularSegmentEntry(
                            11,
                            Colors.blue,
                          ),
                          CircularSegmentEntry(
                            68.1,
                            Colors.green,
                          ),
                        ])
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Text(
                        fourthPageText,
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  _chartExplainers(Colors.green, "EVs (BEV + PHEV), 68.1%"),
                  _chartExplainers(Colors.red, "Diesel, 11.2%"),
                  _chartExplainers(Colors.blue, "Hybrids (not PHEV), 11%"),
                  _chartExplainers(Colors.orange, "Petrol, 9.7%")
                ],
              )
            ],
          ),
          _arrowDown(Colors.black, 4)
        ],
      ),
    );
  }

  _fifthPage() {
    return Container(
      child: Stack(
        children: [
          SizedBox.expand(
              child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                      width: _controllerTsla.value.size?.width ?? 0,
                      height: _controllerTsla.value.size?.height ?? 0,
                      child: VideoPlayer(_controllerOcean)))),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(50),
                      child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(fifthPageText1,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold)),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(50),
                      child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(fifthPageText2,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold)),
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Material(
                        borderRadius: BorderRadius.circular(20),
                        elevation: 8,
                        child: Image.network(
                          "https://firebasestorage.googleapis.com/v0/b/personal-website-1c6ea.appspot.com/o/saveEarth%2Foc13.jpg?alt=media&token=760a7820-068e-4bd9-aaaf-b0af9a89d3d6",
                          width: 650,
                          fit: BoxFit.fitWidth,
                        )),
                    Material(
                        borderRadius: BorderRadius.circular(20),
                        elevation: 8,
                        child: Image.network(
                          "https://firebasestorage.googleapis.com/v0/b/personal-website-1c6ea.appspot.com/o/saveEarth%2Foc1.jpg?alt=media&token=705ae87b-ae22-45b0-a005-71e3325ec15c",
                          width: 650,
                          fit: BoxFit.fitWidth,
                        ))
                  ],
                ),
              ),
            ],
          ),
          _arrowDown(Colors.white, 5)
        ],
      ),
    );
  }

  _sixthPage() {
    return Container(
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                            borderRadius: BorderRadius.circular(20),
                            elevation: 8,
                            child: Image.network(
                              "https://firebasestorage.googleapis.com/v0/b/personal-website-1c6ea.appspot.com/o/saveEarth%2Fdf1.jpg?alt=media&token=efe8df7e-de29-469c-93b5-e4a11f50f87e",
                              width: 600,
                              fit: BoxFit.fitWidth,
                            )),
                      ),
                    ),
                    Center(
                      child: Material(
                          borderRadius: BorderRadius.circular(20),
                          elevation: 8,
                          child: Image.network(
                            "https://firebasestorage.googleapis.com/v0/b/personal-website-1c6ea.appspot.com/o/saveEarth%2Fdf2.jpg?alt=media&token=45d9f7ab-1f77-44c6-9212-1454850c93b3",
                            width: 600,
                            fit: BoxFit.fitWidth,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0, right: 20),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Material(
                            borderRadius: BorderRadius.circular(20),
                            elevation: 8,
                            child: Image.network(
                              "https://firebasestorage.googleapis.com/v0/b/personal-website-1c6ea.appspot.com/o/saveEarth%2Fdf3.jpg?alt=media&token=c289e163-ee37-4895-a503-2b0fed300278",
                              width: 600,
                              fit: BoxFit.fitWidth,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Text(
                        sixthPageText1,
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Text(
                        sixthPageText2,
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          _arrowDown(Colors.black, 6)
        ],
      ),
    );
  }

  _seventhPage() {
    return Container(
        child: Stack(
      children: [
        Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height,
                    child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/personal-website-1c6ea.appspot.com/o/saveEarth%2Frunningpic1.jpg?alt=media&token=fd113d41-b1ee-4e9c-99a0-aa9d81a20596",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.grey.withOpacity(0.35),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text("Walk.",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 80)),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height,
                    child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/personal-website-1c6ea.appspot.com/o/saveEarth%2Frecycle1.jpg?alt=media&token=ac289dad-3108-415b-b401-5a422ebe00dd",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.grey.withOpacity(0.35),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text("Recycle.",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 80))),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height,
                    child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/personal-website-1c6ea.appspot.com/o/saveEarth%2Ftalking1.jpg?alt=media&token=cae8ef55-9b25-426e-92b7-15675a3c7962",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.grey.withOpacity(0.35),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Talk.",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 80),
                      )),
                ],
              ),
            ),
          ],
        ),
      ],
    ));
  }

  _sixAPage() {
    return Container(
      child: Stack(
        children: [
          SizedBox.expand(
              child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                      width: _controllerTsla.value.size?.width ?? 0,
                      height: _controllerTsla.value.size?.height ?? 0,
                      child: VideoPlayer(_controllerCombined)))),
          Container(
            color: Colors.grey.withOpacity(0.35),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "How can YOU help?",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 60),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    "   When you are doing enivronmentally good things, you're doing good for yourself. The thing is, the Earth will do just fine after the extinction of humanity, so all the 'safe the planet' programs are actually targeting safety of the species who live on that planet. The great way to start helping to save our planet is to follow the rule of WRT, that is Walk. Recycle. Talk.",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          _arrowDown(Colors.white, 7)
        ],
      ),
    );
  }

  _chartExplainers(Color color, String text) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(100)),
            ),
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.vertical,
        pageSnapping: false,
        onPageChanged: (r) {
          print(r);
          if (r == 2) {
            _controllerTsla.play();
          } else if (r == 4) {
            _controllerOcean.play();
          } else if (r == 6) {
            _controllerCombined.play();
          }
        },
        children: [
          _firstPage(),
          _secondPage(),
          _thirdPage(),
          _fourthPage(),
          _fifthPage(),
          _sixthPage(),
          _sixAPage(),
          _seventhPage()
        ],
      ),
    );
  }
}
