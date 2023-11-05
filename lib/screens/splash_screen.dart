import 'package:flutter/material.dart';
import 'package:plantapp/const/constants.dart';
import 'package:plantapp/screens/root.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 10,
      width: isActive ? 20 : 8,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Constants.themeColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 20),
            child: InkWell(
              onTap: () {},
              child: const Text(
                "رد کردن",
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'iransans',
                  fontSize: 15,
                ),
              ),
            ),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: const <Widget>[
              CreatePage(
                image: './Assets/images/plant-one.png',
                title: "Constants.titleOne",
                description: "Constants.descriptionOne",
              ),
              CreatePage(
                image: './Assets/images/plant-two.png',
                title: "eqeqweeqweqweqweqw",
                description: "Constants.descriptionOne",
              ),
              CreatePage(
                image: './Assets/images/plant-three.png',
                title: "eqeqweeqweqweqweqw",
                description: "Constants.descriptionOne",
              ),
            ],
          ),
          Positioned(
            bottom: 40,
            left: 30,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Constants.themeColor,
              ),
              child: IconButton(
                icon: const Icon(Icons.chevron_right_rounded),
                onPressed: () {
                  setState(
                    () {
                      if (currentIndex < 2) {
                        currentIndex++;
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn);
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const RootPage();
                            },
                          ),
                        );
                      }
                    },
                  );
                },
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CreatePage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const CreatePage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 50,
        right: 50,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            child: Image.asset(image),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'iransans',
              color: Constants.themeColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'iransans',
              color: Colors.grey,
              
            ),
          )
        ],
      ),
    );
  }
}

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Text("Scaffold"),
//     );
//   }
// }
