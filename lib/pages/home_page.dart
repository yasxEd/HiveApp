import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/util/smart_device_box.dart';
import 'smart_ac_details.dart';
import 'smart_tv.dart';
import 'smart_light.dart';
import 'smart_fan.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:icons_plus/icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double horizontalPadding = 40;
  final double verticalPadding = 25;
  int _currentIndex = 0;

  List<String> connectedDevices = [
    "Smart Light",
    "Smart AC",
    "Smart TV",
    "Smart Fan"
  ];

  void addNewDevice() {
    setState(() {
      connectedDevices.add(
          "New Device"); // You can replace "New Device" with the actual device name.
    });
  }

  void deleteDevice(int index) {
    setState(() {
      connectedDevices.removeAt(index);
    });
  }

  void logout() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  bool isSearching = false;

  void searchForNewDevices() {
    setState(() {
      isSearching = true;
      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          connectedDevices.add("Kitchen Light");
          connectedDevices.add("Bedroom AC");
          isSearching = false;
        });
      });
    });
  }

  List mySmartDevices = [
    ["Smart Light", "lib/icons/light-bulb.png", true],
    ["Smart AC", "lib/icons/air-conditioner.png", false],
    ["Smart TV", "lib/icons/smart-tv.png", false],
    ["Smart Fan", "lib/icons/fan.png", false],
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  // Function to navigate to SmartACDetailsPage
  void navigateToSmartACDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SmartACDetailsPage(), // Navigate to SmartACDetailsPage
      ),
    );
  }

  // Function to Navigate to SmartTVPage
  void navigateToSmartTVPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SmartTVPage(), // Navigate to SmartTVPage
      ),
    );
  }

  // Function to Navigate to SmartLightPage
  void navigateToSmartLightPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SmartLightPage(), // Navigate to SmartLightPage
      ),
    );
  }

  // Function to Navigate to SmartFanPage
  void navigateToSmartFanPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SmartFanPage(), // Navigate to SmartFanPage
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 241, 241),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 67, 37, 37),
        elevation: 0,
        title: Text(
          "Hive",
          style: GoogleFonts.bebasNeue(fontSize: 30, color: Colors.black),
        ),
      ),
      body: Container(
        child: IndexedStack(
          index: _currentIndex,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Welcome,",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ),
                          // Add your logo here
                          // You can replace the Placeholder with your logo widget
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Text(
                    'Maison Yasser',
                    style: GoogleFonts.bebasNeue(fontSize: 45),
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  //child: Divider(
                  // thickness: 0,
                  // color: Color.fromARGB(255, 204, 204, 204),
                  //),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Text(
                    "Smart Devices",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 0),
                Expanded(
                  child: GridView.builder(
                    itemCount: 4,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                    ),
                    itemBuilder: (context, index) {
                      return SmartDeviceBox(
                        smartDeviceName: mySmartDevices[index][0],
                        iconPath: mySmartDevices[index][1],
                        powerOn: mySmartDevices[index][2],
                        onChanged: (value) => powerSwitchChanged(value, index),
                      );
                    },
                  ),
                )
              ],
            ),
            // Account Tab
            SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    Text(
                      "Connected Devices:",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: connectedDevices.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            if (connectedDevices[index] == "Smart AC") {
                              navigateToSmartACDetails();
                            } else if (connectedDevices[index] == "Smart TV") {
                              navigateToSmartTVPage();
                            } else if (connectedDevices[index] ==
                                "Smart Light") {
                              navigateToSmartLightPage();
                            } else if (connectedDevices[index] == "Smart Fan") {
                              navigateToSmartFanPage();
                            }
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeOut,
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: ListTile(
                              title: Text(connectedDevices[index]),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () => deleteDevice(index),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: isSearching ? null : searchForNewDevices,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSearching
                              ? Colors.grey
                              : Color.fromARGB(255, 48, 48, 48),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Center(
                          child: isSearching
                              ? CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                )
                              : Icon(
                                  Icons.add,
                                  size: 40,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: OutlinedButton(
                        onPressed: logout,
                        style: OutlinedButton.styleFrom(
                          primary: Color.fromARGB(255, 5, 5, 5),
                          side: BorderSide(
                            color: Color.fromARGB(255, 33, 33, 33),
                            width: 2.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        child: Text(
                          "Log Out",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        color: Color.fromARGB(255, 29, 29, 29),
        buttonBackgroundColor: Color.fromARGB(255, 29, 29, 29),
        height: 50,
        items: <Widget>[
          Icon(Icons.home,
              size: 30, color: Colors.white), // Standard Flutter icon
          Icon(Icons.account_circle,
              size: 30, color: Colors.white), // Standard Flutter icon
        ],
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
