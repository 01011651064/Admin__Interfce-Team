import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<List<orderHistory>> fetchorderHistory() async {
  final response = await http.get(Uri.parse('http://localhost:3000/getOrders'));

  if (response.statusCode == 200) {
    return orderHistory.toList(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

// ignore: camel_case_types
class orderHistory {
  final int orderId;
  final String dateOfOrder;
  final int deliveryStatus;
  final int deliveryManId;

  const orderHistory({
    required this.orderId,
    required this.dateOfOrder,
    required this.deliveryStatus,
    required this.deliveryManId,
  });

  static toList(List<dynamic> data) {
    List<orderHistory> card = [];
    for (int i = 0; i < data.length; i++) {
      try {
        card.add(orderHistory(
          orderId: data[i]['orderId'],
          dateOfOrder: data[i]['dateOfOrder'],
          deliveryStatus: data[i]['deliveryStatus'],
          deliveryManId: data[i]['deliveryManId'],
        ));
      } catch (err) {
        print(err);
      }
    }

    return card;
  }
}
///////////////

Future<List<deliveryMenStatus>> fetchdeliveryMenStatus() async {
  final response = await http.get(Uri.parse('http://localhost:3000/getDeliveryMen'));

  if (response.statusCode == 200) {
    return deliveryMenStatus.toList(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

// ignore: camel_case_types
class deliveryMenStatus {
  final int deliveryManId;
  final String dateOfJoining;
  final int rating;
  final int numberOfOrders;

  const deliveryMenStatus({
    required this.deliveryManId,
    required this.dateOfJoining,
    required this.rating,
    required this.numberOfOrders,
  });

  static toList(List<dynamic> data) {
    List<deliveryMenStatus> card = [];
    for (int i = 0; i < data.length; i++) {
      try {
        card.add(deliveryMenStatus(
          deliveryManId: data[i]['deliveryManId'],
          dateOfJoining: data[i]['dateOfJoining'],
          rating: data[i]['rating'],
          numberOfOrders: data[i]['numberOfOrders'],
        ));
      } catch (err) {
        print(err);
      }
    }

    return card;
  }
}
/////////////////////


Future<List<booking>> fetchbooking() async {
  final response = await http.get(Uri.parse('http://localhost:3000/getBookings'));

  if (response.statusCode == 200) {
    return booking.toList(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

// ignore: camel_case_types
class booking {
  final int bookingId;
  final String startTime;
  final String endDate;
  final int numberOfPeople;
  final int tableNumber;

  const booking({
    required this.bookingId,
    required this.startTime,
    required this.endDate,
    required this.numberOfPeople,
    required this.tableNumber,
  });

  static toList(List<dynamic> data) {
    List<booking> card = [];
    for (int i = 0; i < data.length; i++) {
      try {
        card.add(booking(
          bookingId: data[i]['bookingId'],
          startTime: data[i]['startTime'],
          endDate: data[i]['endDate'],
          numberOfPeople: data[i]['numberOfPeople'],
          tableNumber: data[i]['tableNumber'],
        ));
      } catch (err) {
        print(err);
      }
    }

    return card;
  }
}
