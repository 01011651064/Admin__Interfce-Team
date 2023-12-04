// ignore: file_names
import 'package:admin_interface/API.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  int selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              'Overview',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            const Text('_______________________________'),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: CustomSegmentedControl(
                    selectedColor: Colors.green,
                    unselectedColor: Colors.white,
                    borderColor: Colors.black,
                    buttonRadius: 20,
                    onValueChanged: (value) {
                      updateSelectedButton(value ?? 0);
                    },
                    selectedIndex: selectedButtonIndex,
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
            selectedButtonIndex == 0
                ? const OrdersContent()
                : selectedButtonIndex == 1
                    ? const DeliveryContent()
                    : const BookingsContent(),
          ],
        ),
      ),
    );
  }

  void updateSelectedButton(int index) {
    setState(() {
      selectedButtonIndex = index;
    });
  }
}

class CustomSegmentedControl extends StatelessWidget {
  final Color selectedColor;
  final Color unselectedColor;
  final Color borderColor;
  final double buttonRadius;
  final ValueChanged<int> onValueChanged;
  final int selectedIndex;

  const CustomSegmentedControl({
    super.key,
    required this.selectedColor,
    required this.unselectedColor,
    required this.borderColor,
    required this.buttonRadius,
    required this.onValueChanged,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
          color: unselectedColor,
          borderRadius: BorderRadius.circular(buttonRadius),
          border: Border.all(
            color: borderColor,
            width: 1.0,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => onValueChanged(0),
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedIndex == 0 ? selectedColor : unselectedColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(buttonRadius),
                      bottomLeft: Radius.circular(buttonRadius),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (selectedIndex == 0)
                        const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 20,
                        ),
                      const SizedBox(width: 10),
                      const Text(
                        'Orders',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => onValueChanged(1),
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedIndex == 1 ? selectedColor : unselectedColor,
                    border: Border(
                      left: BorderSide(
                        color: borderColor,
                        width: 1.0,
                      ),
                      right: BorderSide(
                        color: borderColor,
                        width: 1.0,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (selectedIndex == 1)
                        const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 20,
                        ),
                      const SizedBox(width: 5),
                      const Text(
                        'Delivery',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => onValueChanged(2),
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedIndex == 2 ? selectedColor : unselectedColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(buttonRadius),
                      bottomRight: Radius.circular(buttonRadius),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (selectedIndex == 2)
                        const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 20,
                        ),
                      const SizedBox(width: 5),
                      const Text(
                        'Bookings',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrdersContent extends StatefulWidget {
  const OrdersContent({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OrdersContentState createState() => _OrdersContentState();
}

class _OrdersContentState extends State<OrdersContent> {
  late Future<List<orderHistory>> futureOrders;

  @override
  void initState() {
    super.initState();
    futureOrders = fetchorderHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 220, 219, 219),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        width: MediaQuery.of(context).size.width * 0.93,
        height: MediaQuery.of(context).size.height * 0.64,
        // padding: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                ' Order History ',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                '___________________________________________',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
              FutureBuilder<List<orderHistory>>(
                future: futureOrders,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<orderHistory> orders = snapshot.data!;

                    return Expanded(
                        child: ListView.builder(
                            itemCount: orders.length,
                            itemBuilder: (context, index) {
                              // ignore: non_constant_identifier_names
                              final OrderList = orders[index];
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 2),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'orderId: ${OrderList.orderId}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        'deliveryManId: ${OrderList.deliveryManId}',
                                        style: const TextStyle(
                                            color: Colors.green, fontSize: 20),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                              'deliveryStatus: ${OrderList.deliveryStatus}',
                                              style: const TextStyle(
                                                  fontSize: 20)),
                                          Text(
                                              'dateOfOrder: ${OrderList.dateOfOrder}',
                                              style: const TextStyle(
                                                  fontSize: 20)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }));
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              )
            ]));
  }
}

/////////////////////////

class DeliveryContent extends StatefulWidget {
  const DeliveryContent({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DeliveryContentState createState() => _DeliveryContentState();
}

class _DeliveryContentState extends State<DeliveryContent> {
  late Future<List<deliveryMenStatus>> futuredeliveryMenStatus;

  @override
  void initState() {
    super.initState();
    futuredeliveryMenStatus = fetchdeliveryMenStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 220, 219, 219),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        width: MediaQuery.of(context).size.width * 0.93,
        height: MediaQuery.of(context).size.height * 0.64,
        // padding: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                ' Delivery Men Status ',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                '___________________________________________',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
              FutureBuilder<List<deliveryMenStatus>>(
                future: futuredeliveryMenStatus,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<deliveryMenStatus> delivery = snapshot.data!;

                    return Expanded(
                        child: ListView.builder(
                            itemCount: delivery.length,
                            itemBuilder: (context, index) {
                              // ignore: non_constant_identifier_names
                              final deliveryList = delivery[index];
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 2),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'deliveryManId: ${deliveryList.deliveryManId}',
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          const SizedBox(
                                            width: 430,
                                          ),
                                          Text(
                                            'dateOfJoining: ${deliveryList.dateOfJoining}',
                                            style: const TextStyle(
                                                color: Colors.green,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            'rating: ${deliveryList.rating}',
                                            style: const TextStyle(
                                                color: Colors.orange,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            'numberOfOrders: ${deliveryList.numberOfOrders}',
                                            style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 20),
                                          ),

                                          // const SizedBox(width: 100),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }));
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              )
            ]));
  }
}
/////////////////////////

class BookingsContent extends StatefulWidget {
  const BookingsContent({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BookingsContentState createState() => _BookingsContentState();
}

class _BookingsContentState extends State<BookingsContent> {
  late Future<List<booking>> futurebooking;

  @override
  void initState() {
    super.initState();
    futurebooking = fetchbooking();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 220, 219, 219),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        width: MediaQuery.of(context).size.width * 0.93,
        height: MediaQuery.of(context).size.height * 0.64,
        // padding: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                ' Bookings ',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                '___________________________________________',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
              FutureBuilder<List<booking>>(
                future: futurebooking,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<booking> bookings = snapshot.data!;

                    return Expanded(
                        child: ListView.builder(
                            itemCount: bookings.length,
                            itemBuilder: (context, index) {
                              // ignore: non_constant_identifier_names
                              final bookingList = bookings[index];
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 2),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'bookingId: ${bookingList.bookingId}',
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          const SizedBox(
                                            width: 430,
                                          ),
                                          Text(
                                            'tableNumber: ${bookingList.tableNumber}',
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            'numberOfPeople: ${bookingList.numberOfPeople}',
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            'startTime: ${bookingList.startTime}',
                                            style: const TextStyle(
                                                color: Colors.green,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            'endDate: ${bookingList.endDate}',
                                            style: const TextStyle(
                                                color: Colors.red,
                                                fontSize: 20),
                                          ),
                                          // const SizedBox(width: 100),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }));
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              )
            ]));
  }
}
