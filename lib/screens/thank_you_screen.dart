import 'package:flutter/material.dart';
import 'package:ginkhaoyang/backend/Queue.dart';
import 'package:ginkhaoyang/backend/User.dart';
import 'package:ginkhaoyang/screens/order_history.dart';

void showThankYouDialog(
    BuildContext context, String foodName, int qid, User currentuser) {
  Queue findq = Queue();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Thank You!'),
        content: FutureBuilder<int>(
          future: findq.searchByOrderId(qid), // Fetch queue number
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While waiting for the future to resolve, show a loading indicator
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Handle any errors that occur during the fetch
              return const Text(
                'Error retrieving your queue information.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              );
            } else if (snapshot.hasData) {
              // Successfully retrieved the queue number
              int queueNumber = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Thank you for your order!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'You have purchased: $foodName',
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  if (queueNumber != -1)
                    Text(
                      'Your order queue is: $queueNumber || order id => $qid',
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    )
                  else
                    const Text(
                      'Your order queue information is not available.',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  const SizedBox(height: 20),
                  const Text(
                    'We will notify you shortly after your order is ready.',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            } else {
              // Fallback in case there's no data and no error
              return const Text(
                'No queue information available.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              );
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); 
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => OrderHistoryScreen(user: currentuser),
                ),
              );
            },
            child: const Text('Go to order history'),
          ),
        ],
      );
    },
  );
}
