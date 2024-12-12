import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Map<String, dynamic>> devices = [
    {'name': 'SmartPhone', 'icon': Icons.phone, 'isActive': false},
    {'name': 'Smart Light', 'icon': Icons.lightbulb, 'isActive': false},
    {'name': 'Smart TV', 'icon': Icons.tv, 'isActive': false},
    {'name': 'Smart Speaker', 'icon': Icons.speaker, 'isActive': false},
  ];

  void toggleDeviceStatus(int index) {
    setState(() {
      devices[index]['isActive'] = !devices[index]['isActive'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'FutureTech',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Home',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Control Your Space',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
            Divider(
              color: Colors.black54,
              thickness: 1,
              height: 30,
              endIndent: 40,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: devices.length,
                itemBuilder: (context, index) {
                  bool isActive = devices[index]['isActive'];

                  return Container(
                    decoration: BoxDecoration(
                      color: isActive ? Colors.green[200] : Colors.red[200],
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(devices[index]['icon'], size: 50, color: isActive ? Colors.green : Colors.purple),
                        SizedBox(height: 10),
                        Text(
                          devices[index]['name'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () => toggleDeviceStatus(index),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isActive ? Colors.green[600] : Colors.red[600],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            isActive ? 'Turn Off' : 'Turn On',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
