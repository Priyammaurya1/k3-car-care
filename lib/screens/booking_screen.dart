import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class ServiceBookingScreen extends StatefulWidget {
  const ServiceBookingScreen({
    super.key,
    required this.buttonText,
    required this.title,
    required this.aboveButtonText,
    required this.confirmDialougeTitle,
   
  });

  final String title;
  final String buttonText;
  final String aboveButtonText;
  final String confirmDialougeTitle;
  

  @override
  State<ServiceBookingScreen> createState() => _ServiceBookingScreenState();
}

class _ServiceBookingScreenState extends State<ServiceBookingScreen>
    with SingleTickerProviderStateMixin {
  // Variables for tracking selected date and time
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  String? _selectedTimeSlot;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  // Demo booked slot (May 1st, 10-11 AM)
  final DateTime _bookedDate = DateTime(2025, 5, 1);
  final String _bookedTimeSlot = "10:00 AM - 11:00 AM";

  // Generate time slots from 8 AM to 8 PM
  List<String> _getTimeSlots() {
    List<String> slots = [];
    for (int i = 8; i < 20; i++) {
      final startHour = i < 12 ? "$i:00 AM" : "${i == 12 ? 12 : i - 12}:00 PM";
      final endHour =
          i + 1 < 12
              ? "${i + 1}:00 AM"
              : "${i + 1 == 12 ? 12 : i + 1 - 12}:00 PM";
      slots.add("$startHour - $endHour");
    }
    return slots;
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Check if a time slot is already booked
  bool _isSlotBooked(DateTime date, String timeSlot) {
    return date.year == _bookedDate.year &&
        date.month == _bookedDate.month &&
        date.day == _bookedDate.day &&
        timeSlot == _bookedTimeSlot;
  }

  // Colors
  final Color _primaryColor = const Color(0xFFD32F2F); // Red 700
  final Color _primaryDarkColor = const Color(0xFFB71C1C); // Red 900
  final Color _primaryLightColor = const Color(0xFFFFCDD2); // Red 100
  final Color _accentColor = const Color(0xFF1976D2); // Blue 700
  final Color _textDarkColor = const Color(0xFF212121); // Grey 900
  final Color _textLightColor = const Color(0xFF757575); // Grey 600
  final Color _backgroundColor = const Color(0xFFFAFAFA); // Grey 50
  final Color _surfaceColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.light(
          primary: _primaryColor,
          secondary: _accentColor,
          surface: _surfaceColor,
          background: _backgroundColor,
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: _backgroundColor,
          appBar: AppBar(
            backgroundColor: _primaryColor,
            foregroundColor: Colors.white,
            elevation: 0,
            scrolledUnderElevation: 0,
            title: Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                letterSpacing: 0.15,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded, size: 24),
              onPressed: () => Navigator.of(context).pop(),
              tooltip: 'Back',
            ),
          ),
          body: Column(
            children: [
              // Header wave decoration
              SizedBox(
                height: 20,
                child: ClipPath(
                  clipper: WaveClipper(),
                  child: Container(color: _primaryColor),
                ),
              ),
              // Main content
              Expanded(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      // Introduction section
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  _primaryColor.withOpacity(0.8),
                                  _primaryColor,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: _primaryColor.withOpacity(0.25),
                                  offset: const Offset(0, 4),
                                  blurRadius: 12,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.car_repair,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Premium Car Service",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.2,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "Book your appointment in a few simple steps",
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.85),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Date selection section
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 4,
                                  bottom: 12,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.event_rounded,
                                      size: 18,
                                      color: _primaryColor,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "SELECT THE DATE",
                                      style: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: 1.2,
                                        fontWeight: FontWeight.w600,
                                        color: _textDarkColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Card(
                                elevation: 6,
                                shadowColor: Colors.black12,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.grey.shade100,
                                      width: 1,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      // Calendar header with month navigation
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 16,
                                          horizontal: 16,
                                        ),
                                        decoration: BoxDecoration(
                                          color: _surfaceColor,
                                          borderRadius:
                                              const BorderRadius.vertical(
                                                top: Radius.circular(20),
                                              ),
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.grey.shade200,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              icon: Icon(
                                                Icons.chevron_left_rounded,
                                                color: _textLightColor,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _focusedDay = DateTime(
                                                    _focusedDay.year,
                                                    _focusedDay.month - 1,
                                                  );
                                                });
                                              },
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  DateFormat(
                                                    'MMMM yyyy',
                                                  ).format(_focusedDay),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: _textDarkColor,
                                                    letterSpacing: 0.5,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Icons.chevron_right_rounded,
                                                color: _textLightColor,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _focusedDay = DateTime(
                                                    _focusedDay.year,
                                                    _focusedDay.month + 1,
                                                  );
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Calendar
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TableCalendar(
                                          firstDay: DateTime.now(),
                                          lastDay: DateTime.now().add(
                                            const Duration(days: 90),
                                          ),
                                          focusedDay: _focusedDay,
                                          calendarFormat: CalendarFormat.month,
                                          availableCalendarFormats: const {
                                            CalendarFormat.month: 'Month',
                                          },
                                          selectedDayPredicate:
                                              (day) =>
                                                  isSameDay(_selectedDay, day),
                                          onDaySelected: (
                                            selectedDay,
                                            focusedDay,
                                          ) {
                                            setState(() {
                                              _selectedDay = selectedDay;
                                              _focusedDay = focusedDay;
                                              _selectedTimeSlot = null;

                                              // Reset animation and play
                                              _animationController.reset();
                                              _animationController.forward();
                                            });
                                          },
                                          headerVisible: false,
                                          calendarStyle: CalendarStyle(
                                            outsideDaysVisible: false,
                                            weekendTextStyle: TextStyle(
                                              color: _textDarkColor,
                                            ),
                                            holidayTextStyle: TextStyle(
                                              color: _primaryColor,
                                            ),
                                            selectedDecoration: BoxDecoration(
                                              color: _primaryColor,
                                              shape: BoxShape.circle,
                                            ),
                                            todayDecoration: BoxDecoration(
                                              color: _primaryLightColor,
                                              shape: BoxShape.circle,
                                            ),
                                            todayTextStyle: TextStyle(
                                              color: _primaryDarkColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            selectedTextStyle: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            markerDecoration: BoxDecoration(
                                              color: _accentColor,
                                              shape: BoxShape.circle,
                                            ),
                                            markersMaxCount: 3,
                                            cellMargin: const EdgeInsets.all(6),
                                            tableBorder: TableBorder.all(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          daysOfWeekStyle: DaysOfWeekStyle(
                                            weekdayStyle: TextStyle(
                                              color: _textDarkColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                            weekendStyle: TextStyle(
                                              color: _textDarkColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                            dowTextFormatter: (date, locale) {
                                              return DateFormat(
                                                'E',
                                                locale,
                                              ).format(date).toUpperCase();
                                            },
                                          ),
                                        ),
                                      ),
                                      // Date selection summary
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 16,
                                        ),
                                        decoration: BoxDecoration(
                                          color: _primaryColor.withOpacity(
                                            0.07,
                                          ),
                                          borderRadius:
                                              const BorderRadius.vertical(
                                                bottom: Radius.circular(20),
                                              ),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: _primaryColor
                                                    .withOpacity(0.1),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.calendar_today_rounded,
                                                color: _primaryColor,
                                                size: 18,
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Selected Date",
                                                  style: TextStyle(
                                                    color: _textLightColor,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                const SizedBox(height: 2),
                                                Text(
                                                  DateFormat(
                                                    'EEEE, MMMM d, yyyy',
                                                  ).format(_selectedDay),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: _textDarkColor,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Time slots section
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                          child: Row(
                            children: [
                              Icon(
                                Icons.schedule_rounded,
                                size: 18,
                                color: _primaryColor,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "SELECT TIME SLOT",
                                style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.w600,
                                  color: _textDarkColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Time slot indicators
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildLegendItem(
                                Colors.green.shade100,
                                "Available",
                              ),
                              const SizedBox(width: 24),
                              _buildLegendItem(Colors.grey.shade300, "Booked"),
                              const SizedBox(width: 24),
                              _buildLegendItem(_primaryLightColor, "Selected"),
                            ],
                          ),
                        ),
                      ),

                      // Time slots grid
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                        sliver: SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 2.2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                              ),
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            final timeSlot = _getTimeSlots()[index];
                            final isBooked = _isSlotBooked(
                              _selectedDay,
                              timeSlot,
                            );
                            final isSelected = timeSlot == _selectedTimeSlot;

                            return Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap:
                                    isBooked
                                        ? null
                                        : () {
                                          setState(() {
                                            _selectedTimeSlot = timeSlot;
                                          });
                                        },
                                borderRadius: BorderRadius.circular(16),
                                splashColor: _primaryColor.withOpacity(0.1),
                                highlightColor: _primaryColor.withOpacity(0.05),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  decoration: BoxDecoration(
                                    color:
                                        isBooked
                                            ? Colors.grey.shade300
                                            : isSelected
                                            ? _primaryLightColor
                                            : Colors.green.shade100,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow:
                                        isSelected
                                            ? [
                                              BoxShadow(
                                                color: _primaryColor
                                                    .withOpacity(0.3),
                                                blurRadius: 8,
                                                offset: const Offset(0, 2),
                                              ),
                                            ]
                                            : [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.05,
                                                ),
                                                blurRadius: 4,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                  ),
                                  child: Stack(
                                    children: [
                                      if (isBooked)
                                        Positioned(
                                          top: 8,
                                          right: 8,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade500,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: const Text(
                                              "BOOKED",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            isBooked
                                                ? Icon(
                                                  Icons.block_rounded,
                                                  size: 18,
                                                  color: Colors.grey.shade700,
                                                )
                                                : isSelected
                                                ? Icon(
                                                  Icons.check_circle_rounded,
                                                  size: 18,
                                                  color: _primaryDarkColor,
                                                )
                                                : Icon(
                                                  Icons.access_time_rounded,
                                                  size: 18,
                                                  color: Colors.green.shade800,
                                                ),
                                            const SizedBox(width: 8),
                                            Text(
                                              timeSlot,
                                              style: TextStyle(
                                                color:
                                                    isBooked
                                                        ? Colors.grey.shade700
                                                        : isSelected
                                                        ? _primaryDarkColor
                                                        : Colors.green.shade800,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }, childCount: _getTimeSlots().length),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Bottom booking panel with floating effect
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _selectedTimeSlot != null ? 190 : 100,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 16,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Booking summary
                if (_selectedTimeSlot != null)
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _primaryColor.withOpacity(0.07),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: _primaryColor.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: _primaryColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.auto_awesome,
                            color: _primaryColor,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.aboveButtonText,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: _textDarkColor,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "${DateFormat('EEE, MMM d').format(_selectedDay)} • $_selectedTimeSlot",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: _textLightColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.close,
                            color: _primaryColor,
                            size: 22,
                          ),
                          onPressed: () {
                            setState(() {
                              _selectedTimeSlot = null;
                            });
                          },
                          tooltip: 'Change selection',
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                  ),

                // Book button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed:
                        _selectedTimeSlot != null
                            ? () {
                              // Show confirmation dialog
                              showDialog(
                                context: context,
                                builder:
                                    (context) =>
                                        _buildConfirmationDialog(context),
                              );
                            }
                            : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _primaryColor,
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: Colors.grey.shade300,
                      disabledForegroundColor: Colors.grey.shade500,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      widget.buttonText,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Legend item for time slot statuses
  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 6),
        Text(label, style: TextStyle(fontSize: 12, color: _textLightColor)),
      ],
    );
  }

  // Confirmation dialog
  Widget _buildConfirmationDialog(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle_outline_rounded,
                color: _primaryColor,
                size: 48,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              widget.confirmDialougeTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _textDarkColor,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "You're about to reschedule your appointment to ${DateFormat('EEEE, MMMM d').format(_selectedDay)} at $_selectedTimeSlot. Would you like to proceed?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _textLightColor,
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: _textDarkColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: _textLightColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Cancel"),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Handle booking confirmation
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              const Icon(
                                Icons.check_circle_rounded,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Booking Confirmed!",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      'Car Service on ${DateFormat('MMM d').format(_selectedDay)} at $_selectedTimeSlot',
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          backgroundColor: Colors.green.shade800,
                          duration: const Duration(seconds: 4),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.all(16),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text("Confirm"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Custom wave clipper for the decorative wave effect
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);

    // Create a wave pattern
    final firstControlPoint = Offset(size.width / 4, size.height / 2);
    final firstEndPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    final secondControlPoint = Offset(size.width * 3 / 4, size.height * 1.5);
    final secondEndPoint = Offset(size.width, 0);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
