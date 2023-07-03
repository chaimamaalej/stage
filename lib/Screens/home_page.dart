import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';
import 'RegisterPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/background_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
            options: const ParticleOptions(
              spawnMaxRadius: 100,
              spawnMinSpeed: 2.00,
              particleCount: 10,
              spawnMaxSpeed: 10,
              minOpacity: 0.4,
              spawnOpacity: 0.4,
              baseColor: Color.fromARGB(255, 163, 32, 69),
              image: Image(image: AssetImage('assets/Images/square.png')),
            ),
          ),
          vsync: this,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome To The Focus Racer!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  ),
                  child: Text(
                    '  Log In  ',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
