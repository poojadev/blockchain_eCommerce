import 'dart:async';
import 'package:blockchain_world/transactions/model/AddTransactionPOJO.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

import 'package:expandable_text/expandable_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../network/Node1.dart';
import '../../network/Node2.dart';
import '../../network/RestClient.dart';
import '../../ui/AppTheme.dart';
import '../../ui/sizeConfig.dart';
import '../../util/appconstants/AppConstants.dart';
import '../../util/localstorage/UserAuthSharedPreferences.dart';
import 'model/ProductDetailPOJO.dart';


//List<GameStores> storeDetailsList;

// ignore: must_be_immutable
class ProductDetails extends StatelessWidget {
  static const String routeName= "/ProductDetails";

  late ProductDetailPOJO  productPOJO ;

  ProductDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDetailsState(
//        id: genresId,
//        genresName: genresName,
//        pageDirection: pageDirection,
         key: key, productPOJO: productPOJO,
      ),
    );
  }
}


class ProductDetailsState extends StatefulWidget {


  const ProductDetailsState(
      {Key? key,  required this.productPOJO})
      : super(key: key);


//  final int id;
//  final String genresName;
//  final int pageDirection;
  final ProductDetailPOJO productPOJO;

  @override
  _CreatorDetailsState createState() => _CreatorDetailsState();
}
var dio = Dio()..options.baseUrl = AppConstants.BASE_URL;

RestClient restApiClient = RestClient(dio);


var dio1 = Dio()..options.baseUrl = AppConstants.BASE_URL_NODE1;
Node1 node1 = Node1(dio1);


var dio2 = Dio()..options.baseUrl = AppConstants.BASE_URL_NODE2;
Node2 node2 = Node2(dio2);
class _CreatorDetailsState extends State<ProductDetailsState> {
   late FirebaseMessaging? firebaseMessaging;
  String token = '';

  void getToken() async {
    token = (await firebaseMessaging?.getToken())!;
   await firebaseMessaging?.getToken().then((value){
      print("Token" +value.toString());
      token=value!;

    });
  }
   late PageController _pageController;

  @override
  void initState() {
    firebaseMessaging = FirebaseMessaging.instance;
    _pageController = PageController(viewportFraction: 0.8);

    getToken();

    firebaseMessaging?.requestPermission(
       // const IosNotificationSettings(
            alert: true,
            badge: true,
            provisional: true,
            sound: true
       // )
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print(event.notification!.body);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
    });
    getUserId().whenComplete(() {
      setState(() {});
    });
    super.initState();

  }
   String userId = "";

   Future<String> getUserId() async {
     await UserAuthSharedPreferences.instance.getStringValue("id").then((value) {
       userId = value;
     });
     return userId;
   }






  TextEditingController productQty =TextEditingController();
  TextEditingController productDescription= TextEditingController();
  TextEditingController productNames= TextEditingController();
  TextEditingController productPrice=TextEditingController();



  @override
  Widget build(BuildContext context) {
    //  print("url"+widget.clip);


    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print(event.notification!.body);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Notification"),
              content: Text(event.notification!.body!),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });


    int activePage = 1;


    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return Scaffold(
                backgroundColor: Colors.white38,

                body: CustomScrollView(slivers: <Widget>[
                  SliverList(
                      delegate: SliverChildListDelegate([



                      SizedBox(
                      height: SizeConfig.heightMultiplier*100,
                      width: SizeConfig.widthMultiplier*90,
                      child:

                        StreamBuilder<DocumentSnapshot<Object?>>(

                        stream:


                FirebaseFirestore.instance.collection(AppConstants.sellerProductTable).doc(widget.productPOJO.productId).snapshots(),

              builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                          print(widget.productPOJO.productId);

                          if(snapshot.hasData) {
                            productQty.text = "Product Quantity Available  :" + " " +snapshot.data!
                                .get(AppConstants.productQuantity).toString();

                            productNames.text=  snapshot.data!.get(AppConstants.productName);


                            productPrice.text=  snapshot.data!.get(AppConstants.productPrice).toString() + " " + "PDCoins";
                          }


                List<dynamic>img=[];
                          if(snapshot.hasData) {
                            img.addAll(
                                snapshot.data?.get(AppConstants.productImages));
                          }





                              return



                                snapshot.hasData?        Card(
                                              elevation: 10,

                                              child:
                                                  Container(

                                                    width: SizeConfig.widthMultiplier*100,
                                                    height: SizeConfig.heightMultiplier*70,
                                                    padding: const EdgeInsets.all(10),

                                                    child:
                                                  Column(children: <Widget>[


                                                    SizedBox(height: 34,),

                                                    Container(



                                                        height: SizeConfig.heightMultiplier*45,
                                                      width: SizeConfig.widthMultiplier*100,



                                                        child:
                                              PageView.builder(

                                              itemCount: img.length,
                                                  pageSnapping: true,
                                                  controller: _pageController,
                                                  onPageChanged: (page) {
                                                    setState(() {
                                                      activePage = page;
                                                    });
                                                  },
                                                  itemBuilder: (context, pagePosition) {
                                                    return Container(


                                                      child:


                                                      Image.network(img[pagePosition],width: SizeConfig.widthMultiplier*100,
                                                          height: SizeConfig.heightMultiplier*40,fit: BoxFit.cover),
                                                    );
                                                  }),



                                                    ),

//




                                                    SizedBox(
                                                      height: 5,
                                                    ),

                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.circular(30),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                blurRadius: 10,
                                                                spreadRadius: 7,
                                                                offset: Offset(1, 1),
                                                                color: Colors.grey.withOpacity(0.2))
                                                          ]),
                                                      child: TextField(

                                                        controller: productNames,
                                                        enabled: false,
                                                        decoration: InputDecoration(
                                                          hintText: "Name",
                                                          prefixIcon: Icon(
                                                            Icons.price_change,
                                                            color: Colors.black26,
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(30),
                                                            borderSide: BorderSide(
                                                              color: Colors.black,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          enabledBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(30),
                                                            borderSide: const BorderSide(
                                                              color: Colors.black,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          border: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(30)),
                                                        ),
                                                      ),
                                                    ),

                                                    //

                                                    SizedBox(
                                                      height: 5,
                                                    ),


                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.circular(30),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                blurRadius: 10,
                                                                spreadRadius: 7,
                                                                offset: Offset(1, 1),
                                                                color: Colors.grey.withOpacity(0.2))
                                                          ]),
                                                      child: TextField(

                                                        controller: productPrice,
                                                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                                        keyboardType: TextInputType.number,
                                                        enabled: false,
                                                        decoration: InputDecoration(
                                                          hintText: "Price",
                                                          prefixIcon: Icon(
                                                            Icons.price_change,
                                                            color: Colors.black26,
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(30),
                                                            borderSide: BorderSide(
                                                              color: Colors.black,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          enabledBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(30),
                                                            borderSide: const BorderSide(
                                                              color: Colors.black,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          border: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(30)),
                                                        ),
                                                      ),
                                                    ),

                                                   Expanded(

                                                     child:
                                                         Container(
                                                           padding: EdgeInsets.all(5),

                                                           child:

                                                     ExpandableText(

                                                        expandText: 'show more',
                                                        collapseText: 'show less',
                                                        snapshot.data!.get(AppConstants.productDescription),


                                                      ),
                                                    )),




                                                    SizedBox(
                                                      height: 5,
                                                    ),


                                          Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius: BorderRadius.circular(30),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  blurRadius: 10,
                                                                  spreadRadius: 7,
                                                                  offset: Offset(1, 1),
                                                                  color: Colors.grey.withOpacity(0.2))
                                                            ]),
                                                        child: TextField(

                                                          controller: productQty,
                                                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                                          keyboardType: TextInputType.number,
                                                          enabled: false,
                                                          decoration: InputDecoration(
                                                            hintText: "Quantity",
                                                            prefixIcon: Icon(
                                                              Icons.production_quantity_limits,
                                                              color: Colors.black26,
                                                            ),
                                                            focusedBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(30),
                                                              borderSide: BorderSide(
                                                                color: Colors.black,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            enabledBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(30),
                                                              borderSide: const BorderSide(
                                                                color: Colors.black,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(30)),
                                                          ),
                                                        ),
                                                      ),











                                                    SizedBox(
                                                      height: 10,
                                                    ),



                                          Row(children: [

                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                                // height: SizeConfig.heightMultiplier*7,
                                                // width: SizeConfig.widthMultiplier*25,


                                                child:
                                                OutlinedButton(

                                                    style: OutlinedButton.styleFrom(
                                                        elevation: 6,
                                                        // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                                        padding: const EdgeInsets.all(05),

                                                        backgroundColor: Colors.black,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10))),
                                                    child: const Text(
                                                      'Cancel',
                                                      style: TextStyle(fontSize: 15,color: Colors.white),
                                                    ),
                                                    onPressed: () async {


                                                      Navigator.pushNamed(context, "/HomeView",arguments: null);



                                                      print("token" +token);


                                                        //  print("Value" + userId.toString());







                                                    }
                                                )


                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                                // width: SizeConfig.widthMultiplier*25,
                                                // height: SizeConfig.heightMultiplier*7,


                                                child:
                                                OutlinedButton(

                                                    style: OutlinedButton.styleFrom(
                                                        elevation: 6,
                                                        // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                                        padding: const EdgeInsets.all(05),

                                                        backgroundColor: Colors.black,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10))),
                                                    child: const Text(
                                                      'Buy this Product',
                                                      style: TextStyle(fontSize: 15,color: Colors.white),
                                                    ),
                                                    onPressed: () async {

                                                      Navigator.pushNamed(context, "/CustomerOrderList",arguments: null);


                                                      FirebaseFirestore.instance.collection(AppConstants.Account_Details).get().then((value) {


                                                        // for(int i=0;i<value.size;i++)
                                                        //   {
                                                        int buyerBalance=int.parse(value.docs[0].get(AppConstants.Coins).toString());
                                                        int sellerBalance=int.parse(value.docs[1].get(AppConstants.Coins).toString());
                                                        String buyerWalletId=value.docs[0].id;
                                                        String sellerWalletId=value.docs[1].id;

                                                        //
                                                        // FirebaseFirestore.instance.collection(AppConstants.sellerProductTable).get().then((value) {
                                                        //
                                                        //
                                                        //
                                                        //   for(int i=0;i<value.size;i++) {

                                                      int  productPrice= int
                                                            .parse(
                                                            snapshot.data!.get(AppConstants.productPrice)
                                                                .toString());
                                                        if (buyerBalance < productPrice) {

                                                          print("buyerBalance cant cna r" +buyerBalance.toString());
                                                          print(productPrice.toString());

                                                        }
                                                        else {

                                                          AddTransactionPOJO addTransactionPOJO = AddTransactionPOJO(
                                                              value.docs[0].get(
                                                                  AppConstants
                                                                      .Public_key),
                                                              value.docs[1].get(
                                                                  AppConstants
                                                                      .Public_key),
                                                              productPrice ,
                                                              value.docs[0].get(
                                                                  AppConstants
                                                                      .Private_Key));

                                                          String buyerPublicKey= value.docs[0].get(
                                                              AppConstants
                                                                  .Public_key);
                                                          String sellerPublicKey= value.docs[1].get(
                                                              AppConstants
                                                                  .Public_key);


                                                          restApiClient
                                                              .addTransaction(
                                                              addTransactionPOJO)
                                                              .then((val) {

                                                            FirebaseFirestore.instance.collection("seller_order_table").doc().set({

                                                              AppConstants.productPrice:productPrice,
                                                              AppConstants.productName: snapshot.data!.get(AppConstants.productName),
                                                              "order_status":false,
                                                              "buyer":   buyerPublicKey,
                                                              AppConstants.productQuantity:1
                                                            });
                                                            FirebaseFirestore.instance.collection("cust_order_table").doc().set({

                                                              AppConstants.productPrice:productPrice,
                                                              AppConstants.productName: snapshot.data!.get(AppConstants.productName),
                                                              "order_status":false,
                                                              "seller":   sellerPublicKey,
                                                              AppConstants.productQuantity:1

                                                            });


                                                            FirebaseFirestore.instance.collection("buyerTransactions").doc().set({

                                                              AppConstants.productPrice:productPrice,
                                                              AppConstants.productName: snapshot.data!.get(AppConstants.productName),
                                                              "txt_status":false,
                                                              "seller":   sellerPublicKey,
                                                              "txt_sign": "",
                                                              "buyer":buyerPublicKey


                                                            });
                                                            FirebaseFirestore.instance.collection("sellerTransactions").doc().set({

                                                              AppConstants.productPrice:productPrice,
                                                              AppConstants.productName: snapshot.data!.get(AppConstants.productName),
                                                              "txt_status":false,
                                                              "buyer":   sellerPublicKey,
                                                              "txt_sign": "",
                                                              "buyer":buyerPublicKey



                                                            });



                                                          });


                                                          node1.addTransaction(
                                                              addTransactionPOJO)
                                                              .then((value) {


                                                          });

                                                          node2.addTransaction(
                                                              addTransactionPOJO)
                                                              .then((value) {


                                                          });

                                                        }
                                                        // }});













                                                      });





                                                      //  print("Value" + userId.toString());



                                                      })





                                            ),


                                            SizedBox(
                                              width: 10,
                                            ),




                                          ],)




                                                  ]),



                                                    //Center(child: Text("Token : $token")),







                                                  ),




                                      ):CircularProgressIndicator();






                        /*
                            Product details
                         */



                        //  filtersWidget(),

//                    ],
//                  )
//

                        // ),
                }))]))]));

            // ]));
          });
    });
  }
}
