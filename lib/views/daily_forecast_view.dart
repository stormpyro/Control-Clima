import 'package:control_clima/models/forecast.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DailyForecastView extends StatelessWidget {
  const DailyForecastView({
    Key key,
    @required this.forecast,
  }) : super(key: key);

  final Forecast forecast;
  String formatTemp(double temp) {
    temp -= 273.15;
    return temp.round().toString();
  }

  String formatDay(DateTime date) {
    return DateFormat('EEE').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            // Text('${formatDay(forecast.city)}'),
            Text('${formatTemp(forecast.daily[0].temp)}')
          ],
        ),
        Image.asset(
          "assets/img/021-cloud.png",
          width: 50,
          height: 50,
        ),
        Column(
          children: [Text("Fri"), Text("21°")],
        ),
        Image.asset(
          "assets/img/021-cloud.png",
          width: 50,
          height: 50,
        ),
        Column(
          children: [Text("Fri"), Text("21°")],
        ),
        Image.asset(
          "assets/img/021-cloud.png",
          width: 50,
          height: 50,
        ),
      ],
    );
  }
}
