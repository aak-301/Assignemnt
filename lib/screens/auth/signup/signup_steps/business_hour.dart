import 'package:flutter/material.dart';

import '../../../../shared/constants.dart';

class BusinessHours extends StatelessWidget {
  final Map<String, bool> selectedDay;
  final Map<String, bool> selectedTime;
  final Function setSelectedDayTime;
  final List<String> days;
  final List<String> time;

  const BusinessHours({
    super.key,
    required this.selectedDay,
    required this.selectedTime,
    required this.days,
    required this.time,
    required this.setSelectedDayTime,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Business Hours',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 30),
        const Text(
          "Choose the hours your farm is open for pickups. This will allow customers to order deliveries.",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: ThemeColors.grey2),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: days.map((e) {
            return GestureDetector(
              onTap: () {
                setSelectedDayTime("day", e);
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: selectedDay[e] == true
                      ? ThemeColors.inputColor
                      : Colors.white,
                  border: Border.all(
                      color: selectedDay[e] == true
                          ? Colors.transparent
                          : ThemeColors.grey2),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Center(
                    child: Text(
                  e.substring(0, 1),
                  style: TextStyle(
                    color: selectedDay[e] == true
                        ? ThemeColors.black
                        : ThemeColors.grey2,
                  ),
                )),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 30),
        GridView.count(
          shrinkWrap: true,
          crossAxisSpacing: 20,
          mainAxisSpacing: 15,
          crossAxisCount: 2,
          childAspectRatio: 3,
          children: time
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    setSelectedDayTime("time", e);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: selectedTime[e] == true
                          ? ThemeColors.yellow
                          : ThemeColors.inputColor,
                    ),
                    height: 50,
                    width: 50,
                    child: Center(child: Text(e)),
                  ),
                ),
              )
              .toList(),
        ),
        
      ],
    );
  }
}
