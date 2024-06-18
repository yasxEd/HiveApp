import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:google_fonts/google_fonts.dart';

class SmartACDetailsPage extends StatefulWidget {
  const SmartACDetailsPage({Key? key}) : super(key: key);

  @override
  _SmartACDetailsPageState createState() => _SmartACDetailsPageState();
}

class _SmartACDetailsPageState extends State<SmartACDetailsPage> {
  double temperature = 24.0;
  double humidity = 50.0;
  bool isCooling = false;
  bool isAirWaveEnabled = false;

  // Function to increase humidity
  void increaseHumidity() {
    setState(() {
      humidity += 1.0;
      // You can add a check here to ensure humidity doesn't go over a maximum value.
    });
  }

  // Function to decrease humidity
  void decreaseHumidity() {
    setState(() {
      humidity -= 1.0;
      // You can add a check here to ensure humidity doesn't go below a minimum value.
    });
  }

  // Function to toggle Cooling
  void toggleCooling() {
    setState(() {
      isCooling = !isCooling;
    });
  }

  // Function to toggle AirWave
  void toggleAirWave() {
    setState(() {
      isAirWaveEnabled = !isAirWaveEnabled;
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
            'Smart TV Control',
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
      body: Padding(
        padding: EdgeInsets.all(14),
        child: Center(
          // Center the slider and its value
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Humidity Value
              Text(
                "Humidity %",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey.shade800,
                ),
              ),
              const SizedBox(height: 10),
              InputQty(
                maxVal: 100, // Maximum value for humidity
                minVal: 0, // Minimum value for humidity
                initVal: humidity.toDouble(),
                onQtyChanged: (val) {
                  setState(() {
                    humidity = val.toDouble();
                  });
                },
              ),
              const SizedBox(height: 40),

              // Cooling Status
              Text(
                "Cooling",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey.shade800,
                ),
              ),
              const SizedBox(height: 6),
              GestureDetector(
                onTap: () {
                  // Toggle Cooling
                  toggleCooling();
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: isCooling ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 100.0,
                  height: 40.0,
                  padding: const EdgeInsets.all(4.0),
                  child: Stack(
                    children: [
                      Positioned(
                        left: isCooling ? 60.0 : 0.0,
                        child: Transform.rotate(
                          angle: isCooling ? 0.0 : (-2 * pi),
                          child: Container(
                            width: 25.0,
                            decoration: BoxDecoration(
                              color: isCooling ? Colors.green : Colors.red,
                              borderRadius: BorderRadius.circular(180),
                            ),
                            child: Center(
                              child: Text(
                                isCooling ? 'On' : 'Off',
                                style: TextStyle(
                                  height: 2.2,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // AirWave Status
              Text(
                "AirWave",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey.shade800,
                ),
              ),
              const SizedBox(height: 6),
              GestureDetector(
                onTap: () {
                  // Toggle AirWave
                  toggleAirWave();
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: isAirWaveEnabled ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 100.0,
                  height: 40.0,
                  padding: const EdgeInsets.all(4.0),
                  child: Stack(
                    children: [
                      Positioned(
                        left: isAirWaveEnabled ? 60.0 : 0.0,
                        child: Transform.rotate(
                          angle: isAirWaveEnabled ? 0.0 : (-2 * pi),
                          child: Container(
                            width: 25.0,
                            decoration: BoxDecoration(
                              color:
                                  isAirWaveEnabled ? Colors.green : Colors.red,
                              borderRadius: BorderRadius.circular(180),
                            ),
                            child: Center(
                              child: Text(
                                isAirWaveEnabled ? 'On' : 'Off',
                                style: TextStyle(
                                  height: 2.2,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Temperature Value
              Text(
                "Temperature",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey.shade800,
                ),
              ),
              const SizedBox(height: 6),

              // Temperature Value Positioned Manually
              Align(
                alignment: Alignment.center, // Adjust alignment as needed
                child: Padding(
                  padding: EdgeInsets.only(top: 0), // Adjust padding as needed
                  child: Text(
                    '${temperature.toStringAsFixed(1)}°C',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 26),

              // Temp Slider
              SleekCircularSlider(
                initialValue: 14.0,
                max: 28.0,
                min: 14.0,
                appearance: CircularSliderAppearance(
                  startAngle: 150, // Adjust the start angle as needed
                  angleRange: 240, // Adjust the angle range as needed
                  animationEnabled: true,
                  size: 200,
                  customWidths: CustomSliderWidths(
                    progressBarWidth: 20,
                    trackWidth: 20,
                    shadowWidth: 25,
                  ),
                  customColors: CustomSliderColors(
                    progressBarColors: [
                      Colors.green, // Start color (near 14)
                      Colors.red, // End color (closer to 28)
                    ],
                    trackColor: Colors.grey,
                    shadowColor: Colors.transparent,
                    dotColor: Colors.red,
                  ),

                  infoProperties: InfoProperties(
                    modifier: (double value) {
                      return '${value.toStringAsFixed(1)}°C';
                    },
                    mainLabelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                onChangeEnd: (double value) {
                  setState(() {
                    temperature = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getTemperatureColor(double temp) {
    if (temp <= 14) {
      return Colors.green;
    } else if (temp >= 28) {
      return Colors.red;
    } else {
      // Calculate a color between green and red based on the temperature value
      double fraction =
          (temp - 14) / (28 - 14); // Calculate a fraction between 0 and 1
      int red = (255 * fraction).round();
      int green = 255 - red;
      return Color.fromARGB(255, red, green, 0);
    }
  }
}
