import 'package:accademic_chatbot/features/counsellors/data_list.dart';
import 'package:flutter/material.dart';


class DevelopersPage extends StatefulWidget {
  const DevelopersPage({Key? key}) : super(key: key);

  @override
  _DevelopersPageState createState() => _DevelopersPageState();
}

class _DevelopersPageState extends State<DevelopersPage> {
  var itemList = data;
  var listScrollController = FixedExtentScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counsellors Page"),
      ),
      body: Container(
        child: Center(
          child: Container(
            height: 1050,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ListWheelScrollView(
              controller: listScrollController,
              itemExtent: 400,
              diameterRatio: 4,
              children: data.map<Widget>((Map<String, dynamic> item) {
                return Container(
                  width: 300,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 118, 206, 247),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 118, 206, 247).withOpacity(0.6),
                        offset: const Offset(-6, 4),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(item["image"]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16)),
                      Text(
                        item["title"],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        item["title1"],
                        style: const TextStyle(
                          color: Color.fromARGB(255, 94, 92, 92),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildIcon(Icons.mail, item["gmail"]),
                          // buildIcon(Icons.link, item["github"]),
                          // buildLinkedinIcon(item["linkedin"]),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIcon(IconData icon, String? link) {
    if (link != null && link.isNotEmpty) {
      return GestureDetector(
        onTap: () {
          // Add logic to open the link
          print("Opening link: $link");
        },
        child: Icon(
          icon,
          size: 40,
          color: Colors.white,
        ),
      );
    } else {
      // Return an empty container if the link is not available
      return Container();
    }
  }

  Widget buildLinkedinIcon(String? link) {
    if (link != null && link.isNotEmpty) {
      return GestureDetector(
        onTap: () {},
        child: Image.asset(
          'assets/linkedin.png', // Replace with the actual path to your LinkedIn image
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        ),
      );
    } else {
      // Return an empty container if the link is not available
      return Container();
    }
  }
}
