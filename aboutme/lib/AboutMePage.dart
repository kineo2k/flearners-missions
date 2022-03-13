import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({Key? key}) : super(key: key);

  @override
  _AboutMePageState createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  int _imageIndex = 1;

  void _handleChangeImage() {
    setState(() {
      _imageIndex = _imageIndex == 1 ? 2 : 1;
    });
  }

  void _handleEmailTap() {
    _launchURL("mailto:kineo2k@gmail.com");
  }

  void _handleGithubTap() async {
    _launchURL("https://github.com/kineo2k");
  }

  void _handleBlogTap() {
    _launchURL("https://velog.io/@kineo2k");
  }

  void _handleDartTap() {
    _launchURL("https://gump.gitbook.io/a-tour-of-the-dart-language/");
  }

  void _launchURL(String url) async {
    if (!await launch(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AboutMe",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("About Me!"),
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.black87,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _handleChangeImage,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(75),
                  clipBehavior: Clip.antiAlias,
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    // child: Image.asset("images/dog$_imageIndex.jpg"),
                    child: AnimatedCrossFade(
                      duration: const Duration(milliseconds: 300),
                      firstChild: Image.asset("images/dog1.jpg"),
                      secondChild: Image.asset("images/dog2.jpg"),
                      crossFadeState:
                      _imageIndex == 1 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                "Hi! I'm Gump!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontFamily: "cursive",
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 100.0),
              _createButton(
                "kineo2k@gmail.com",
                "email",
                _handleEmailTap,
              ),
              const SizedBox(height: 8.0),
              _createButton(
                "github.com/kineo2k",
                "github",
                _handleGithubTap,
              ),
              const SizedBox(height: 8.0),
              _createButton(
                "velog.io/@kineo2k",
                "blog",
                _handleBlogTap,
              ),
              const SizedBox(height: 8.0),
              _createButton(
                "Gitbook (I'm learning dart 😅)",
                "dart",
                _handleDartTap,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createButton(String label, String iconName, VoidCallback handler) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2),
        child: SizedBox(
          height: 50.0,
          child: ElevatedButton(
            onPressed: handler,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(0),
              side: BorderSide.none,
              elevation: 0,
              shadowColor: Colors.transparent,
              primary: Colors.white,
            ),
            child: Row(
              children: [
                const SizedBox(width: 16),
                Image.asset(
                  "images/$iconName.png",
                  width: 30,
                ),
                const SizedBox(width: 32),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.black87,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
