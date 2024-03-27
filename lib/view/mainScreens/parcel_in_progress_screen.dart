import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../assistant_methods/assistant_methods.dart';
import '../widgets/order_card.dart';
import '../widgets/progress_bar.dart';



class ParcelInProgressScreen extends StatefulWidget
{
  @override
  _ParcelInProgressScreenState createState() => _ParcelInProgressScreenState();
}



class _ParcelInProgressScreenState extends State<ParcelInProgressScreen>
{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "Parcel In Progress",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              letterSpacing: 2,
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("orders")
              .where("status", isEqualTo: "picking")
              .orderBy("orderTime", descending: true)
              .snapshots(),
          builder: (c, snapshot)
          {
            return snapshot.hasData
                ? ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (c, index)
              {
                return FutureBuilder<QuerySnapshot>(
                  future: FirebaseFirestore.instance
                      .collection("items")
                      .where("itemID", whereIn: separateOrderItemIDs((snapshot.data!.docs[index].data()! as Map<String, dynamic>) ["productIDs"]))
                      .where("orderBy", whereIn: (snapshot.data!.docs[index].data()! as Map<String, dynamic>)["uid"])
                      .orderBy("publishedDate", descending: true)
                      .get(),
                  builder: (c, snap)
                  {
                    return snap.hasData
                        ? OrderCard(
                      itemCount: snap.data!.docs.length,
                      data: snap.data!.docs,
                      orderID: snapshot.data!.docs[index].id,
                      seperateQuantitiesList: separateOrderItemQuantities((snapshot.data!.docs[index].data()! as Map<String, dynamic>)["productIDs"]),
                    )
                        : Center(child: circularProgress());
                  },
                );
              },
            )
                : Center(child: circularProgress(),);
          },
        ),
      ),
    );
  }
}
