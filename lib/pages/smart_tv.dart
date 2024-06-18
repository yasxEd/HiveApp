import 'dart:math';
import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:google_fonts/google_fonts.dart';

class SmartTVPage extends StatefulWidget {
  const SmartTVPage({Key? key}) : super(key: key);

  @override
  _SmartTVPageState createState() => _SmartTVPageState();
}

class _SmartTVPageState extends State<SmartTVPage> {
  bool isTVOn = false;
  int currentChannel = 1;
  int currentVolume = 50;
  bool isStreaming = false;

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  isTVOn = !isTVOn;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: isTVOn ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 100.0,
                height: 40.0,
                padding: const EdgeInsets.all(4.0),
                child: Stack(
                  children: [
                    Positioned(
                      left: isTVOn ? 60.0 : 0.0,
                      child: Transform.rotate(
                        angle: isTVOn ? 0.0 : (-2 * pi),
                        child: Container(
                          width: 25.0,
                          decoration: BoxDecoration(
                            color: isTVOn ? Colors.green : Colors.red,
                            borderRadius: BorderRadius.circular(180),
                          ),
                          child: Center(
                            child: Text(
                              isTVOn ? 'ON' : 'OFF',
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
            SizedBox(height: 80),
            Text(
              'Current Channel: $currentChannel',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            InputQty(
              maxVal: 100,
              minVal: 1,
              initVal: currentChannel.toDouble(),
              onQtyChanged: (val) {
                setState(() {
                  currentChannel = val.toInt();
                });
              },
            ),
            SizedBox(height: 100),
            Text(
              'Volume: $currentVolume%',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            InputQty(
              maxVal: 100,
              minVal: 0,
              initVal: currentVolume.toDouble(),
              onQtyChanged: (val) {
                setState(() {
                  currentVolume = val.toInt();
                });
              },
            ),
            SizedBox(height: 80),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isStreaming = !isStreaming;
                          });
                        },
                        icon: Icon(
                          isStreaming ? Icons.cast_connected : Icons.cast,
                          size: 40,
                          color: isStreaming ? Colors.green : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: 10), // Add some spacing between the icon and text
                Text(
                  isStreaming ? 'Stop Sharing' : 'Start Sharing',
                  style: GoogleFonts.poppins(
                    // Apply Poppins font
                    textStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black, // Set the text color to black
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
