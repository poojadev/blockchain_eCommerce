import 'package:blockchain_world/accounts/view/CreateAccounts.dart';

import 'package:blockchain_world/transactions/Screen/TransactionList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../util/ui/sizeConfig.dart';

class SellerHomeScreen extends StatefulWidget {
  @override
  _SellerHomeScreenState createState() => _SellerHomeScreenState();
}

class _SellerHomeScreenState extends State<SellerHomeScreen>
    with SingleTickerProviderStateMixin {
  static const String routeName = "/SellerHomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        //NodeRepositoryImpl().createNode();

        SizeConfig().init(constraints, orientation);

        return SingleChildScrollView(
            child: Container(
                height: SizeConfig.heightMultiplier * 60,
                width: SizeConfig.widthMultiplier*90,

                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // give the tab bar a height [can change hheight to preferred height]
                      SizedBox(height: 20,),


                      Container(
                          height: SizeConfig.heightMultiplier * 10,
                          width: SizeConfig.widthMultiplier*40,
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          margin: EdgeInsets.all(5),


                          //width: SizeConfig.widthMultiplier * 90,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  elevation: 6,
                                  // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              child: const Text(
                                'Seller Wallet',
                                textScaleFactor: 1.5,
                                style: TextStyle(  color: Colors.white),
                              ),
                              onPressed: () async {


                                Navigator.pushNamed(context,
                                    "/SellerWalletDetails"
                                );


                              })


                      ),








                      Container(
                          height: SizeConfig.heightMultiplier * 10,
                          width: SizeConfig.widthMultiplier*40,
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          margin: EdgeInsets.all(5),


                          //width: SizeConfig.widthMultiplier * 90,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  elevation: 6,
                                  // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              child: const Text(
                                'Product List',
                                textScaleFactor: 1.5,
                                style: TextStyle(  color: Colors.white),
                              ),
                              onPressed: () async {


                                Navigator.pushNamed(context,
                                    "/ProductList"
                                );


                              })


                      ),






                      Container(
                          height: SizeConfig.heightMultiplier * 10,
                          width: SizeConfig.widthMultiplier*40,
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          margin: EdgeInsets.all(5),


                          //width: SizeConfig.widthMultiplier * 90,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  elevation: 6,
                                  // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              child: const Text(
                                'Orders',
                                textScaleFactor: 1.5,
                                style: TextStyle(  color: Colors.white),
                              ),
                              onPressed: () async {

                                Navigator.pushNamed(context,
                                    "/OrderList"
                                );





                              })


                      ),


                      Container(
                          height: SizeConfig.heightMultiplier * 10,
                          width: SizeConfig.widthMultiplier*40,
                          padding: EdgeInsets.only(top: 5,bottom: 5),
                          margin: EdgeInsets.all(5),


                          //width: SizeConfig.widthMultiplier * 90,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  elevation: 6,
                                  // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              child: const Text(
                                'Show Transactions',
                                textScaleFactor: 1.5,
                                style: TextStyle(  color: Colors.white),
                              ),
                              onPressed: () async {


                                Navigator.pushNamed(context,
                                    "/SellerTransactionList"
                                );


                              })


                      ),






                      Container(
                          padding: const EdgeInsets.all(26),

                          //width: SizeConfig.widthMultiplier*45,
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
                      




                    ],
                  ),




                  // setState(() {
                  //
                  // });



                )));
      });
    }));
  }
}
