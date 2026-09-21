import 'package:flutter/material.dart';

import '../../app/theme/app_theme.dart';
import '../../data/repositories/booking_repository.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: bookingRepository,

      builder: (context, child) {
        final bookings = bookingRepository.bookings;

        return Scaffold(
          appBar: AppBar(
            title: const Text('My Bookings'),
          ),

          body: bookings.isEmpty
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(28),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          size: 70,
                          color: AppTheme.primaryGreen,
                        ),

                        SizedBox(height: 20),

                        Text(
                          'No bookings yet',

                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 12),

                        Text(
                          'Explore community experiences '
                          'and book your next cultural adventure.',

                          textAlign: TextAlign.center,

                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                )

              : ListView.builder(
                  padding: const EdgeInsets.all(20),

                  itemCount: bookings.length,

                  itemBuilder: (context, index) {
                    final booking = bookings[index];

                    return Card(
                      margin: const EdgeInsets.only(
                        bottom: 16,
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(18),

                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [
                            Text(
                              booking.experience.title,

                              style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 14),

                            Text(
                              'Date: '
                              '${booking.bookingDate.day}/'
                              '${booking.bookingDate.month}/'
                              '${booking.bookingDate.year}',
                            ),

                            const SizedBox(height: 8),

                            Text(
                              'Participants: ${booking.participants}',
                            ),

                            const SizedBox(height: 8),

                            Text(
                              'Total: LKR '
                              '${booking.totalPrice.toStringAsFixed(0)}',

                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppTheme.primaryGreen,
                              ),
                            ),

                            const SizedBox(height: 14),

                            Align(
                              alignment: Alignment.centerRight,

                              child: TextButton.icon(
                                onPressed: () async {
                                  final shouldCancel =
                                      await showDialog<bool>(
                                    context: context,

                                    builder: (dialogContext) {
                                      return AlertDialog(
                                        title: const Text(
                                          'Cancel Booking?',
                                        ),

                                        content: const Text(
                                          'Are you sure you want '
                                          'to cancel this booking?',
                                        ),

                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(
                                                dialogContext,
                                                false,
                                              );
                                            },

                                            child: const Text(
                                              'Keep Booking',
                                            ),
                                          ),

                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(
                                                dialogContext,
                                                true,
                                              );
                                            },

                                            child: const Text(
                                              'Cancel Booking',
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );

                                  if (shouldCancel == true) {
                                    bookingRepository.cancelBooking(
                                      booking.id,
                                    );
                                  }
                                },

                                icon: const Icon(
                                  Icons.cancel_outlined,
                                ),

                                label: const Text(
                                  'Cancel Booking',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}