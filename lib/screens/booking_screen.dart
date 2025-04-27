import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class ServiceBookingScreen extends StatefulWidget {
  const ServiceBookingScreen({
    super.key,
   
    required this.buttonText, required this.title,
  });

  final String title;
  final String buttonText;

  @override
  State<ServiceBookingScreen> createState() => _ServiceBookingScreenState();
}

class _ServiceBookingScreenState extends State<ServiceBookingScreen> {
  // Variables for tracking selected date and time
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  String? _selectedTimeSlot;

  // Demo booked slot (May 1st, 10-11 AM)
  final DateTime _bookedDate = DateTime(2025, 5, 1);
  final String _bookedTimeSlot = "10:00 AM - 11:00 AM";

  // Generate time slots from 10 AM to 8 PM (last slot starts at 7 PM)
  List<String> _getTimeSlots() {
    List<String> slots = [];
    for (int i = 10; i < 20; i++) {
      final startHour = i < 12 ? "$i:00 AM" : "${i == 12 ? 12 : i - 12}:00 PM";
      final endHour =
          i + 1 < 12
              ? "${i + 1}:00 AM"
              : "${i + 1 == 12 ? 12 : i + 1 - 12}:00 PM";
      slots.add("$startHour - $endHour");
    }
    return slots;
  }

  // Check if a time slot is already booked
  bool _isSlotBooked(DateTime date, String timeSlot) {
    return date.year == _bookedDate.year &&
        date.month == _bookedDate.month &&
        date.day == _bookedDate.day &&
        timeSlot == _bookedTimeSlot;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 234, 231),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.black87,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
        Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Calendar section
              Card(
                color: Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                        child: Text(
                          "Select Date",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TableCalendar(
                        firstDay: DateTime.now(),
                        lastDay: DateTime.now().add(const Duration(days: 60)),
                        focusedDay: _focusedDay,
                        calendarFormat: CalendarFormat.twoWeeks,
                        selectedDayPredicate: (day) {
                          return isSameDay(_selectedDay, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay;
                            _selectedTimeSlot =
                                null; // Clear selected time slot when date changes
                          });
                        },
                        headerStyle: const HeaderStyle(
                          titleCentered: true,
                          formatButtonVisible: false,
                          titleTextStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        calendarStyle: CalendarStyle(
                          outsideDaysVisible: false,
                          selectedDecoration: BoxDecoration(
                            color: Colors.redAccent.withValues(alpha: 0.8),
                            shape: BoxShape.circle,
                          ),
                          todayDecoration: BoxDecoration(
                            color: Colors.redAccent.withValues(alpha: 0.3),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Time slots section
              Text(
                "Select Time Slot for ${DateFormat('EEEE, MMMM d').format(_selectedDay)}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              // Time slot grid
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: _getTimeSlots().length,
                  itemBuilder: (context, index) {
                    final timeSlot = _getTimeSlots()[index];
                    final isBooked = _isSlotBooked(_selectedDay, timeSlot);
                    final isSelected = timeSlot == _selectedTimeSlot;

                    return GestureDetector(
                      onTap:
                          isBooked
                              ? null
                              : () {
                                setState(() {
                                  _selectedTimeSlot = timeSlot;
                                });
                              },
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              isBooked
                                  ? Colors.orange.withValues(alpha: 0.1)
                                  : isSelected
                                  ? Colors.redAccent.withValues(alpha: 0.2)
                                  : Colors.grey.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color:
                                isBooked
                                    ? Colors.orange
                                    : isSelected
                                    ? Colors.redAccent
                                    : Colors.transparent,
                            width: 1.5,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            isBooked
                                ? const Icon(
                                  Icons.block,
                                  size: 16,
                                  color: Colors.orange,
                                )
                                : isSelected
                                ? Icon(
                                  Icons.check_circle,
                                  size: 16,
                                  color: Colors.redAccent,
                                )
                                : const Icon(
                                  Icons.access_time,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                            const SizedBox(width: 8),
                            Text(
                              timeSlot,
                              style: TextStyle(
                                color: isBooked ? Colors.red : Colors.black87,
                                fontWeight:
                                    isSelected || isBooked
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Book button
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  onPressed:
                      _selectedTimeSlot != null
                          ? () {
                            // Handle booking submission
                            final snackBar = SnackBar(
                              content: Text(
                                'Car Service booked for ${DateFormat('MMMM d').format(_selectedDay)} at $_selectedTimeSlot',
                                style: const TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.redAccent.withValues(
                                alpha: 0.9,
                              ),
                            );
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(snackBar);
                          }
                          : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    widget.buttonText,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
