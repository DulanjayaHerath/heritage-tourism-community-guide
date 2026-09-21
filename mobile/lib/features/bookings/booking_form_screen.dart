import 'package:flutter/material.dart';

import '../../app/theme/app_theme.dart';
import '../../models/community_experience.dart';
import '../../models/experience_booking.dart';
import '../../data/repositories/booking_repository.dart';

class BookingFormScreen extends StatefulWidget {
  final CommunityExperience experience;

  const BookingFormScreen({
    super.key,
    required this.experience,
  });

  @override
  State<BookingFormScreen> createState() =>
      _BookingFormScreenState();
}

class _BookingFormScreenState extends State<BookingFormScreen> {
  DateTime? selectedDate;

  int participants = 1;

  double get totalPrice {
    return widget.experience.price * participants;
  }

  Future<void> selectDate() async {
    final today = DateUtils.dateOnly(DateTime.now());

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? today,
      firstDate: today,
      lastDate: today.add(
        const Duration(days: 365),
      ),
    );

    if (pickedDate != null && mounted) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void confirmBooking() {
    if (selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a booking date'),
        ),
      );

      return;
    }

    final booking = ExperienceBooking(
      id: DateTime.now().microsecondsSinceEpoch,
      experience: widget.experience,
      bookingDate: selectedDate!,
      participants: participants,
      totalPrice: totalPrice,
    );

    bookingRepository.addBooking(booking);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Booking created successfully!'),
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Experience'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              widget.experience.title,

              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              widget.experience.location,

              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 32),

            const Text(
              'Select Booking Date',

              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

            OutlinedButton.icon(
              onPressed: selectDate,

              icon: const Icon(
                Icons.calendar_month,
              ),

              label: Text(
                selectedDate == null
                    ? 'Choose a date'
                    : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
              ),
            ),

            const SizedBox(height: 32),

            const Text(
              'Number of Participants',

              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

            Row(
              children: [
                IconButton.filledTonal(
                  onPressed: participants > 1
                      ? () {
                          setState(() {
                            participants--;
                          });
                        }
                      : null,

                  icon: const Icon(
                    Icons.remove,
                  ),
                ),

                const SizedBox(width: 24),

                Text(
                  '$participants',

                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(width: 24),

                IconButton.filledTonal(
                  onPressed: participants < 20
                      ? () {
                          setState(() {
                            participants++;
                          });
                        }
                      : null,

                  icon: const Icon(
                    Icons.add,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 36),

            const Divider(),

            const SizedBox(height: 20),

            const Text(
              'Booking Summary',

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            _summaryRow(
              'Price per person',
              'LKR ${widget.experience.price.toStringAsFixed(0)}',
            ),

            const SizedBox(height: 14),

            _summaryRow(
              'Participants',
              '$participants',
            ),

            const SizedBox(height: 20),

            const Divider(),

            const SizedBox(height: 14),

            _summaryRow(
              'Total Price',
              'LKR ${totalPrice.toStringAsFixed(0)}',
              isTotal: true,
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: SizedBox(
            height: 54,

            child: ElevatedButton(
              onPressed: confirmBooking,

              child: const Text(
                'Confirm Booking',

                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _summaryRow(
    String label,
    String value, {
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(
          label,

          style: TextStyle(
            fontSize: isTotal ? 18 : 15,
            fontWeight: isTotal
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),

        Text(
          value,

          style: TextStyle(
            fontSize: isTotal ? 19 : 15,
            fontWeight: FontWeight.bold,

            color: isTotal
                ? AppTheme.primaryGreen
                : AppTheme.textDark,
          ),
        ),
      ],
    );
  }
}