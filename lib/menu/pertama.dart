import 'package:flutter/material.dart';
import 'dart:developer';

class PertamaPage extends StatefulWidget {
  const PertamaPage({super.key});

  @override
  State<PertamaPage> createState() => _PertamaPageState();
}

class _PertamaPageState extends State<PertamaPage> {
  DateTime? dateTimeNow = DateTime.now(), dateTimeTommorrow, picked_date;
  var year, month, day;
  TimeOfDay? picked_time, selectedTime = TimeOfDay.now();

  Future<Null> getDate(BuildContext context) async {
    picked_date = await showDatePicker(
        context: context,
        initialDate: dateTimeNow!,
        firstDate: DateTime(dateTimeNow!.year - 1),
        lastDate: DateTime(dateTimeNow!.year + 1));

    if (picked_date != null && picked_date != dateTimeNow) {
      setState(() {
        dateTimeNow = picked_date;
      });
    }
  }

  Future<Null> getTime(BuildContext context) async {
    picked_time =
        await showTimePicker(context: context, initialTime: selectedTime!);

    if (picked_time != null && picked_time != selectedTime) {
      setState(() {
        selectedTime = picked_time;
        log("test" + picked_time.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          MaterialButton(
            onPressed: () {
              getDate(context);
            },
            child: Text("Test DatePicker"),
            color: Colors.blue.shade300,
          ),
          MaterialButton(
            onPressed: () {
              getTime(context);
            },
            child: Text("Test TimePicker"),
            color: Colors.blueGrey.shade300,
          ),
          Text("${dateTimeNow.toString().substring(0, 10)}"),
          Text("${selectedTime.toString().substring(10, 15)}"),
        ],
      ),
    );
  }
}
