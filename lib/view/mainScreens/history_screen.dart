import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../assistant_methods/assistant_methods.dart';
import '../../global/global_var.dart';
import '../widgets/order_card.dart';
import '../widgets/progress_bar.dart';



class HistoryScreen extends StatefulWidget
{
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}



class _HistoryScreenState extends State<HistoryScreen>
{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.black38,
                  ],
                  begin:  FractionalOffset(0.0, 0.0),
                  end:  FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                )
            ),
          ),
          title: const Text(
            "History",
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
              fontFamily: "Signatra",
              letterSpacing: 2,

            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("orders")
              .where("riderUID", isEqualTo: sharedPreferences!.getString("uid"))
              .where("status", isEqualTo: "ended")
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
