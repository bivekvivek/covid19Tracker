import 'package:flutter/material.dart';

class WorldwidePanel extends StatelessWidget {
  final Map worldData;

  const WorldwidePanel({Key key, this.worldData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
        ),
        children: [
          StatusPanel(
            title: "CONFIRMED",
            panelColor: Colors.red[100],
            count: worldData['cases'].toString(),
            textColor: Colors.red,
          ),
          StatusPanel(
              title: "ACTIVE",
              panelColor: Colors.blue[100],
              count: worldData['active'].toString(),
              textColor: Colors.blue),
          StatusPanel(
              title: "RECOVERED",
              panelColor: Colors.green[100],
              count: worldData['recovered'].toString(),
              textColor: Colors.green),
          StatusPanel(
              title: "DEATH",
              panelColor: Colors.grey[300],
              count: worldData['deaths'].toString(),
              textColor: Colors.grey[900]),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;
  const StatusPanel(
      {Key key, this.panelColor, this.textColor, this.title, this.count})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      color: panelColor,
      height: 80,
      width: width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
          ),
          Text(count,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16, color: textColor))
        ],
      ),
    );
  }
}
