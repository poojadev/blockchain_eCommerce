
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../ui/sizeConfig.dart';
import '../../../util/appconstants/AppConstants.dart';



class CustomerTransactionList extends StatefulWidget {
  static const String routeName= "/CustomerTransactionList";

  const CustomerTransactionList({Key? key}) : super(key: key);

  @override
  _CustomerTransactionListState createState() => _CustomerTransactionListState();
}




















class _CustomerTransactionListState extends State<CustomerTransactionList> {

  String userId="";



  @override
  void initState() {
    super.initState();

  }




  Widget confirmOrderList() {

    print("userI" +userId);
    return                 Container(
        color: Colors.white,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("buyerTransactions")

              .snapshots(),
          builder:
              (context, AsyncSnapshot<QuerySnapshot> snapshot) {

            return !snapshot.hasData
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : SizedBox(
              height: SizeConfig.heightMultiplier*80,
              width: SizeConfig.widthMultiplier*93,
              child: ListView.builder(
                  itemCount: snapshot.data?.size,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    // QueryDocumentSnapshot<Object?>?
                    // documentSnapshot =
                    // snapshot.data?;



                    //myString = myString.replaceAll(" GBP ", " "); // myString is "s t r"
                    // print("PRR" +splitted[0]);
                    // double Price= double.parse( splitted[0]);

                    // int qty = int.parse(snapshot
                    //     .data?.docs[index]
                    //     .get("qty"));
                    //



                    // print("OKKK" + to.toString());


                    return GestureDetector(
                        child: Container(
                            width:
                            SizeConfig.widthMultiplier *
                                90,

                            padding: const EdgeInsets.all(10),
                            child: Card(
                                elevation: 8,
                                color: Colors.white,
                                child: Column(
                                    children: [

                                      Container(
                                        margin: const EdgeInsets
                                            .all(3),
                                        child: Text(
                                            "Seller Public Key",
                                            style: TextStyle(
                                                fontSize: 14,color: Colors.black45)),
                                      ),


                                      Container(
                                        margin: const EdgeInsets
                                            .all(3),
                                        child: Text(
                                            snapshot?.data!.docs[index].get(
                                                "seller"),
                                            style: TextStyle(
                                                fontSize: 16)),
                                      ),

                                      Container(
                                        margin: const EdgeInsets
                                            .all(3),
                                        child: Text(
                                            "Transaction Sign",
                                            style: TextStyle(
                                                fontSize: 14,color: Colors.black45)),
                                      ),
                                      Container(
                                        margin: const EdgeInsets
                                            .all(3),
                                        child: Text(
                                            snapshot?.data!.docs[index].get(
                                               "txt_sign"),
                                            style: TextStyle(
                                                fontSize: 16)),
                                      ),


                                      Container(
                                        margin: const EdgeInsets
                                            .all(3),
                                        child: Text(
                                            "Transaction Status",
                                            style: TextStyle(
                                                fontSize: 14,color: Colors.black45)),
                                      ),

                                      Container(
                                        margin: const EdgeInsets
                                            .all(13),
                                        child: Text(
                                            snapshot.data!.docs[index].get(
                                                "txt_status")==true?"Confirmed" :"Not Confirmed",
                                            style: TextStyle(
                                                fontSize: 16)),
                                        // height: SizeConfig.heightMultiplier*2,
                                      ),






                                      SizedBox(height: 10,)


                                    ]))),
                        // setState(() {



                        //
                        // Container(
                        //   height: 90,
                        //   width: 200,
                        //   margin: EdgeInsets.all(3),
                        //   child: FadeInImage.memoryNetwork(
                        //       fit: BoxFit.cover,
                        //       placeholder: kTransparentImage,
                        //       image: documentSnapshot?.get(AppConstants.productImages)),

                        onTap: () {
                          // String pr=documentSnapshot!.get(AppConstants.cartPrice.replaceAll(" GBP", "")) ;


                          Navigator.pushNamed(context, "/HomeView",arguments: null);
                        });
                  }),
            );
          },
        )

    );
  }

  @override
  Widget build(BuildContext context) {
    //getUserId();



    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {


        SizeConfig().init(constraints, orientation);


        return Scaffold(
            backgroundColor: Colors.white,

            body: CustomScrollView(slivers: <Widget>[
              SliverList(
                  delegate: SliverChildListDelegate([




                    Container(
                        height: SizeConfig.heightMultiplier*90,
                        width: SizeConfig.widthMultiplier*90,


                        child: Column(children: [
                          confirmOrderList(),

                          Container(
                              // width: SizeConfig.widthMultiplier*45,
                              // height: SizeConfig.heightMultiplier*9,


                              child:    OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      elevation: 6,
                                      // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                      padding: const EdgeInsets.all(6),

                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10))),
                                  onPressed: () async{
                                    Navigator.pushNamed(context, "/HomeView",arguments: null);

                                  },
                                  child: const Text(
                                    'Back',
                                    style: TextStyle(fontSize: 15,color: Colors.white),
                                  ))),




                        ],)







                    ),])

                //  filtersWidget(),

//                    ],
//                  )
//

                // ),
              )]));

        // ]));
      });
    });
  }
}
