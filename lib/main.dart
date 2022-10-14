import 'package:flutter/material.dart';
import 'NavBar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
    theme: ThemeData(
      textTheme: const TextTheme(
        headline2: TextStyle(
          fontSize: 42,
          fontWeight: FontWeight.bold,
        ),
        bodyText1: TextStyle(
          fontWeight: FontWeight.w500,
        ),
        caption: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    ),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      drawer: const NavBar(),
      body: Builder(builder: (context) {
        return SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => Scaffold.of(context).openDrawer(),
                        icon: const Icon(Icons.filter_list),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Find',
                        style: textTheme.bodyText1,
                      ),
                      Text('Inspiration', style: textTheme.headline2),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black12,
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Whate are you looking for?',
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              color: Colors.black,
                            ),
                          ),
                          cursorColor: Colors.black12,
                          cursorHeight: 30,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'promo',
                    style: textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: screenSize.height * .32,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        Card(
                          screenSize: screenSize,
                          caption: 'Best Design',
                          img: 'assets/poster.png',
                        ),
                        Card(
                          screenSize: screenSize,
                          caption: 'Best Design',
                          img: 'assets/icy.jpg',
                        ),
                        Card(
                          screenSize: screenSize,
                          caption: 'Best Design',
                          img: 'assets/kk.png',
                        ),
                        Card(
                          screenSize: screenSize,
                          caption: 'Best Design',
                          img: 'assets/lamp.jpg',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black38,
                            image: const DecorationImage(
                              image: AssetImage('assets/kk.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: screenSize.height * .30,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    Key? key,
    required this.screenSize,
    required this.caption,
    required this.img,
  }) : super(key: key);

  final Size screenSize;
  final String caption;
  final String img;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: [
          Container(
            height: screenSize.height * .32,
            width: screenSize.width * .4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            height: screenSize.height * .32,
            width: screenSize.width * .4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(colors: [
                  Colors.transparent,
                  Colors.black54,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(caption, style: textTheme.caption),
            ),
          ),
        ],
      ),
    );
  }
}
