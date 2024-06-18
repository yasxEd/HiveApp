import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SmartLightPage extends StatefulWidget {
  @override
  _SmartLightPageState createState() => _SmartLightPageState();
}

class _SmartLightPageState extends State<SmartLightPage> {
  bool isLightOn = false;
  double lightIntensity = 50.0; // Light intensity, ranges from 0 to 100
  Color selectedColor = Colors.white; // Initial color is white
  Color borderColor = Colors.black; // Border color
  double borderWidth = 3.0; // Border width

  void toggleLight() {
    setState(() {
      isLightOn = !isLightOn;
    });
  }

  void changeLightIntensity(double value) {
    setState(() {
      lightIntensity = value;
    });
  }

  void changeLightColor(Color color) {
    setState(() {
      selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Smart Light",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: toggleLight,
                child: Container(
                  width: 100,
                  height: 100,
                  child: Center(
                    child: SvgPicture.asset(
                      'lib/icons/bulb.svg', // Adjust the path to your SVG file
                      width: 85,
                      height: 85,
                      color: isLightOn ? selectedColor : Colors.grey.shade400,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                isLightOn ? "Light is On" : "Light is Off",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 55),
              GestureDetector(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: lightIntensity,
                  onChange: (value) {
                    // You can capture and display the changing value here if needed
                  },
                  appearance: CircularSliderAppearance(
                    size: 150,
                    startAngle: 180,
                    angleRange: 360, // Make it a full circle
                    customColors: CustomSliderColors(
                      trackColor: Colors.grey.shade400,
                      progressBarColor: selectedColor,
                    ),
                    infoProperties: InfoProperties(
                      bottomLabelText: "Intensity",
                      bottomLabelStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      modifier: (double value) {
                        final roundedValue = value.ceil();
                        return '$roundedValue%'; // Display the value as a percentage
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 55),
              Text(
                "Select Color:",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10.0, // Adjust the spacing between colors as needed
                runSpacing: 10.0, // Adjust the runSpacing as needed
                children: [
                  buildColorButton(Colors.red), // Red
                  buildColorButton(Colors.green), // Green
                  buildColorButton(Colors.blue), // Blue
                  buildColorButton(Colors.yellow), // Yellow
                  buildColorButton(Colors.orange), // Orange
                  buildColorButton(Colors.purple), // Purple
                  buildColorButton(Colors.pink), // Pink
                  buildColorButton(Colors.teal), // Turquoise
                  buildColorButton(Colors.purpleAccent), // Magenta
                  buildColorButton(Colors.cyan), // Cyan
                  buildColorButton(Colors.amber), // Gold
                  buildColorButton(Colors.redAccent), // Ruby
                  buildColorButton(Colors.greenAccent), // Emerald
                  buildColorButton(Colors.blueAccent), // Sapphire
                  buildColorButton(Colors.indigo), // Indigo
                  buildColorButton(Colors.brown), // Brown
                  buildColorButton(Colors.cyanAccent), // Aqua
                  buildColorButton(Color.fromARGB(255, 255, 255, 255)), // Grey
                  // Add more colors here
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildColorButton(Color color) {
    return GestureDetector(
      onTap: () {
        changeLightColor(color);
      },
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: color,
          border: Border.all(
            color: Colors.grey.shade400,
            width: 1,
          ),
        ),
        margin: EdgeInsets.all(5),
      ),
    );
  }
}
