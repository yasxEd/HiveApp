import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmartFanPage extends StatefulWidget {
  @override
  _SmartFanPageState createState() => _SmartFanPageState();
}

class _SmartFanPageState extends State<SmartFanPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isFanOn = false;
  int fanSpeed = 1; // 1 represents low speed, 2 for medium, 3 for high
  List<bool> isSelected = [true, false, false];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggleFan() {
    setState(() {
      if (isFanOn) {
        _animationController.forward(from: 0.5); // Rotate -180° when turned on
      } else {
        _animationController.reverse(); // Rotate -180° when turned off
      }
      isFanOn = !isFanOn;
    });
  }

  String getFanSpeedString() {
    if (fanSpeed == 1) {
      return "Low";
    } else if (fanSpeed == 2) {
      return "Medium";
    } else if (fanSpeed == 3) {
      return "High";
    } else {
      return "";
    }
  }

  void adjustFanSpeed(int speed) {
    setState(() {
      fanSpeed = speed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Smart Fan Control',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Fan Power",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: toggleFan,
              child: RotationTransition(
                turns: Tween(
                  begin: 0.0,
                  end: isFanOn
                      ? -0.5
                      : 0.5, // Rotate -180° when turned off, 180° when turned on
                ).animate(
                  CurvedAnimation(
                    parent: _animationController,
                    curve: Curves.easeInOut,
                  ),
                ),
                child: Image.asset(
                  'lib/icons/fan.png',
                  width: 80,
                  height: 80,
                  color: isFanOn
                      ? Color.fromARGB(255, 17, 213, 89)
                      : Color.fromARGB(255, 233, 30, 30),
                ),
              ),
            ),
            SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Speed: ",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  "${getFanSpeedString()}",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ToggleButtons(
              isSelected: isSelected,
              onPressed: (int newIndex) {
                final isOneSelected =
                    isSelected.where((element) => element).length == 1;
                if (isOneSelected && isSelected[newIndex]) return;

                setState(() {
                  // Loop through the list of booleans
                  for (int index = 0; index < isSelected.length; index++) {
                    // checking for the index value
                    if (index == newIndex) {
                      // toggle between the old index and new index value
                      isSelected[index] = !isSelected[index];
                      // Adjust fan speed based on the selected button
                      adjustFanSpeed(index + 1);
                    } else {
                      isSelected[index] = false;
                    }
                  }
                });
              },
              children: [
                Text(
                  "L",
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  "M",
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  "H",
                  style: TextStyle(fontSize: 14),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
      ),
    );
  }
}
