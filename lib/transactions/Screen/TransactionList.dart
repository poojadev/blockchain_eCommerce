// import 'dart:io';
//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
//
// import 'package:dio/dio.dart' hide Headers;
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../network/RestClient.dart';
// import '../../../util/appconstants/AppConstants.dart';
// import '../../../util/ui/sizeConfig.dart';
//
// import '../../blocks/bloc/block_repository/BlockRepository.dart';
// import '../Model/AddTransactionPOJO.dart';
// import '../Model/WalletArgumentsPOJO.dart';
// import '../bloc/states/TransactionStates.dart';
// import '../bloc/transaction_bloc/TransactionBloc.dart';
// import '../bloc/transaction_repository/TransactionRepository.dart';
//
//
//
// class TransactionList extends StatelessWidget {
//   static const String routeName = "/AddTransactions";
//
//   late WalletArguments walletArguments;
//
//   TransactionList({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AddTransactionsState(
// //        id: genresId,
// //        genresName: genresName,
// //        pageDirection: pageDirection,
//         key: key
//       ),
//     );
//   }
// }
//
// class AddTransactionsState extends StatefulWidget {
//   const AddTransactionsState({Key? key})
//       : super(key: key);
//
// //  final int id;
// //  final String genresName;
// //  final int pageDirection;
//
//   @override
//   _AddTransactionsState createState() => _AddTransactionsState();
// }
//
//
//
//
//
//
//
//
//
//
//
//
// var dio = Dio()..options.baseUrl = AppConstants.BASE_URL;
// RestClient restApiClient = RestClient(dio);
// class _AddTransactionsState extends State<AddTransactionsState> {
//
//   var senderController = TextEditingController();
//   var receiverController = TextEditingController();
//   var amountController=TextEditingController();
//   bool _obscured = false;
//   final textFieldFocusNode = FocusNode();
//  late  int mined_by;
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return
//       Scaffold(
//
//
//
//           body:   LayoutBuilder(builder: (context, constraints) {
//             return OrientationBuilder(
//                 builder: (context, orientation) {
//                   SizeConfig().init(constraints, orientation);
//
//                   final bool isLandscape = orientation == Orientation.landscape;
//                   Orientation currentOrientation = MediaQuery.of(context).orientation;
//
//                   return  SingleChildScrollView(
//
//                     child:  Container(
//                         width:  MediaQuery.of(context).size.width,
//
//                         height:  MediaQuery.of(context).size.height,
//                       // width: SizeConfig.widthMultiplier*90,
//                       padding: const EdgeInsets.all(10),
//
//                       child:
//
//
//
//
//
//                       BlocBuilder<TransactionBloc, TransactionState>(
//                         builder: (context, state) {
//
//
//                           return  Container(
//
//
//                            //ss height:SizeConfig.heightMultiplier*90,
//
//                             child:
//
//
//                             Row(children: [
//
//                               Column(children: [
//                                 Container(
//                                   alignment: Alignment.topLeft,
//                                   padding: EdgeInsets.all(5.0),
//                                   child: Text("Confrimed",
//
//                                     textScaleFactor: 1.1,
//                                     style: const TextStyle(color: Colors.black),
//
//                                     //  textAlign: TextAlign.center,
//                                   ),
//                                 ),
//
//                                 Container(
//                                   width: MediaQuery.of(context).size.width* 0.47,
//                                   height:  MediaQuery.of(context).size.height*0.75,
//
//
//                                   child:    StreamBuilder(
//                                       stream: TransactionRepositoryImpl().getTransactions(),
//
//
//                                       builder: (BuildContext context,
//                                           AsyncSnapshot  snapshot) {
//
//
//
//
//                                         return
//                                           snapshot.data!=null? Container(
//
//                                             //
//                                             // SizeConfig.widthMultiplier*90,
//
//                                               child:
//
//                                               snapshot.data?.docs.length!=0?     ListView.builder(
//
//                                                   scrollDirection: Axis.vertical,
//                                                   shrinkWrap: true,
//                                                   itemCount: snapshot.data?.docs.length,
//                                                   itemBuilder: (context, index) {
//                                                     //  print("INSIDE itemBuilder in ");
//
//                                                     return GestureDetector(
//                                                       onTap: () async{
//
//
//
//
//                                                       },
//                                                       child:
//
//
//
//
//                                                       Container(
//                                                         // width: 300,
//                                                         // height: 400,
//
//
//
//
//                                                           child:  snapshot.data?.docs[index].get(AppConstants.Transaction_Status_Flag)==2?   Container(
//
//                                                               padding: EdgeInsets.all(10.0),
//
//                                                               width: MediaQuery.of(context).size.width* 0.45,
//
//
//                                                               child: Card(
//                                                                 elevation: 14,
//
//                                                                 child: Column(children: [
//
//
//
//                                                                   // Container(
//                                                                   //   alignment: Alignment.topLeft,
//                                                                   //   padding: EdgeInsets.all(5.0),
//                                                                   //   child: Text("Transaction Id",
//                                                                   //
//                                                                   //     textScaleFactor: 1.1,
//                                                                   //     style: const TextStyle(color: Colors.black54),
//                                                                   //
//                                                                   //     //  textAlign: TextAlign.center,
//                                                                   //   ),
//                                                                   // ),
//                                                                   //
//                                                                   //
//                                                                   // Container(
//                                                                   //   alignment: Alignment.topLeft,
//                                                                   //   padding: EdgeInsets.all(5.0),
//                                                                   //   child: Text(
//                                                                   //     snapshot.data?.docs[index].get(AppConstants.Transaction_Hash)?? 'No data ',
//                                                                   //
//                                                                   //     textScaleFactor: 1.1,
//                                                                   //     style: const TextStyle(color: Colors.black),
//                                                                   //
//                                                                   //     //  textAlign: TextAlign.center,
//                                                                   //   ),
//                                                                   // ),
//
//                                                                   Container(
//                                                                     alignment: Alignment.topLeft,
//                                                                     padding: EdgeInsets.all(5.0),
//                                                                     child: Text("Sender",
//
//                                                                       textScaleFactor: 1.1,
//                                                                       style: const TextStyle(color: Colors.black54),
//
//                                                                       //  textAlign: TextAlign.center,
//                                                                     ),
//                                                                   ),
//
//                                                                   Container(
//                                                                     alignment: Alignment.topLeft,
//                                                                     padding: EdgeInsets.all(5.0),
//                                                                     child: Text(
//                                                                       snapshot.data?.docs[index].get(AppConstants.Transaction_From)?? 'No timestamp ',
//
//                                                                       textScaleFactor: 1.1,
//                                                                       style: const TextStyle(color: Colors.black),
//
//                                                                       //  textAlign: TextAlign.center,
//                                                                     ),
//                                                                   ),
//                                                                   Container(
//                                                                     alignment: Alignment.topLeft,
//                                                                     padding: EdgeInsets.all(5.0),
//                                                                     child: const Text("Receiver",
//
//                                                                       textScaleFactor: 1.1,
//                                                                       style: TextStyle(color: Colors.black54),
//
//                                                                       //  textAlign: TextAlign.center,
//                                                                     ),
//                                                                   ),
//
//                                                                   Container(
//                                                                     alignment: Alignment.topLeft,
//                                                                     padding: EdgeInsets.all(5.0),
//                                                                     child: Text(
//                                                                       snapshot.data?.docs[index].get(AppConstants.Transaction_To)?? 'No timestamp ',
//
//                                                                       textScaleFactor: 1.1,
//                                                                       style: const TextStyle(color: Colors.black),
//
//                                                                       //  textAlign: TextAlign.center,
//                                                                     ),
//                                                                   ),
//
//
//
//                                                                   //
//                                                                   Container(
//                                                                     alignment: Alignment.topLeft,
//                                                                     padding: EdgeInsets.all(5.0),
//                                                                     child: const Text("Transaction status",
//
//                                                                       textScaleFactor: 1.1,
//                                                                       style: TextStyle(color: Colors.black54),
//
//                                                                       //  textAlign: TextAlign.center,
//                                                                     ),
//                                                                   ),
//
//                                                                   Container(
//                                                                     alignment: Alignment.topLeft,
//                                                                     padding: EdgeInsets.all(5.0),
//                                                                     child:   Text( snapshot.data?.docs[index].get(AppConstants.Transaction_Status_Flag)==1?
//                                                                     'Unconfirmed':"confirmed",
//
//                                                                       textScaleFactor: 1.1,
//                                                                       style: const TextStyle(color: Colors.red),
//
//                                                                       //  textAlign: TextAlign.center,
//                                                                     ),
//                                                                   ),
//
//
//                                                                 ]),
//
//                                                               )
//                                                           ) :Container()),
//
//
//
//
//
//                                                     );
//                                                   }): Container(
//                                                 height: 200,
//
//                                                 alignment: Alignment.center,
//                                                 padding: EdgeInsets.all(5.0),
//                                                 child: Text("No Un-Confirmed Transactions",
//
//                                                   textScaleFactor: 2,
//                                                   style: const TextStyle(color: Colors.black),
//
//                                                   //  textAlign: TextAlign.center,
//                                                 ),
//                                               )
//
//
//
//                                           ):     Container(
//                                             height: 200,
//                                             alignment: Alignment.center,
//                                             padding: EdgeInsets.all(5.0),
//                                             child: Text("No Un-Confirmed Transactions",
//
//                                               textScaleFactor: 2,
//                                               style: const TextStyle(color: Colors.black),
//
//                                               //  textAlign: TextAlign.center,
//                                             ),
//                                           );
//
//                                       }),
//                                 ),
//
//
//                               ],),
//
//
//
//
//                           Column(children: [
//                           Container(
//                           alignment: Alignment.topLeft,
//                           padding: EdgeInsets.all(5.0),
//                           child: Text("Un-Confrimed",
//
//                           textScaleFactor: 1.1,
//                           style: const TextStyle(color: Colors.black),
//
//                           //  textAlign: TextAlign.center,
//                           ),
//                           ),
//
//                           Container(
//                           width: MediaQuery.of(context).size.width* 0.47,
//                           height:  MediaQuery.of(context).size.height*0.75,
//
//
//                           child:    StreamBuilder(
//                                     stream: TransactionRepositoryImpl().getTransactions(),
//
//
//                                     builder: (BuildContext context,
//                                         AsyncSnapshot  snapshot) {
//
//
//
//
//                                       return
//                                         snapshot.data!=null? Container(
//
//                                           //
//                                           // SizeConfig.widthMultiplier*90,
//
//                                             child:
//
//                                             snapshot.data?.docs.length!=0?     ListView.builder(
//
//                                                 scrollDirection: Axis.vertical,
//                                                 shrinkWrap: true,
//                                                 itemCount: snapshot.data?.docs.length,
//                                                 itemBuilder: (context, index) {
//                                                   //  print("INSIDE itemBuilder in ");
//
//                                                   return GestureDetector(
//                                                     onTap: () async{
//
//
//
//
//                                                     },
//                                                     child:
//
//
//
//
//                                                     Container(
//                                                       // width: 300,
//                                                       // height: 400,
//
//
//                                                         width: MediaQuery.of(context).size.width* 0.45,
//
//
//                                                         child:  snapshot.data?.docs[index].get(AppConstants.Transaction_Status_Flag)==1?   Container(
//
//                                                             padding: EdgeInsets.all(10.0),
//
//
//
//                                                             child: Card(
//                                                               elevation: 14,
//
//                                                               child: Column(children: [
//
//
//
//                                                                 Container(
//                                                                   alignment: Alignment.topLeft,
//                                                                   padding: EdgeInsets.all(5.0),
//                                                                   child: Text("Transaction Id",
//
//                                                                     textScaleFactor: 1.1,
//                                                                     style: const TextStyle(color: Colors.black54),
//
//                                                                     //  textAlign: TextAlign.center,
//                                                                   ),
//                                                                 ),
//
//
//                                                                 Container(
//                                                                   alignment: Alignment.topLeft,
//                                                                   padding: EdgeInsets.all(5.0),
//                                                                   child: Text(
//                                                                     snapshot.data?.docs[index].get(AppConstants.Transaction_Hash)?? 'No data ',
//
//                                                                     textScaleFactor: 1.1,
//                                                                     style: const TextStyle(color: Colors.black),
//
//                                                                     //  textAlign: TextAlign.center,
//                                                                   ),
//                                                                 ),
//
//                                                                 Container(
//                                                                   alignment: Alignment.topLeft,
//                                                                   padding: EdgeInsets.all(5.0),
//                                                                   child: Text("Sender",
//
//                                                                     textScaleFactor: 1.1,
//                                                                     style: const TextStyle(color: Colors.black54),
//
//                                                                     //  textAlign: TextAlign.center,
//                                                                   ),
//                                                                 ),
//
//                                                                 Container(
//                                                                   alignment: Alignment.topLeft,
//                                                                   padding: EdgeInsets.all(5.0),
//                                                                   child: Text(
//                                                                     snapshot.data?.docs[index].get(AppConstants.Transaction_From)?? 'No timestamp ',
//
//                                                                     textScaleFactor: 1.1,
//                                                                     style: const TextStyle(color: Colors.black),
//
//                                                                     //  textAlign: TextAlign.center,
//                                                                   ),
//                                                                 ),
//                                                                 Container(
//                                                                   alignment: Alignment.topLeft,
//                                                                   padding: EdgeInsets.all(5.0),
//                                                                   child: Text("Receiver",
//
//                                                                     textScaleFactor: 1.1,
//                                                                     style: const TextStyle(color: Colors.black54),
//
//                                                                     //  textAlign: TextAlign.center,
//                                                                   ),
//                                                                 ),
//
//                                                                 Container(
//                                                                   alignment: Alignment.topLeft,
//                                                                   padding: EdgeInsets.all(5.0),
//                                                                   child: Text(
//                                                                     snapshot.data?.docs[index].get(AppConstants.Transaction_To)?? 'No timestamp ',
//
//                                                                     textScaleFactor: 1.1,
//                                                                     style: const TextStyle(color: Colors.black),
//
//                                                                     //  textAlign: TextAlign.center,
//                                                                   ),
//                                                                 ),
//
//
//
//                                                                 //
//                                                                 Container(
//                                                                   alignment: Alignment.topLeft,
//                                                                   padding: EdgeInsets.all(5.0),
//                                                                   child: Text("Transaction status",
//
//                                                                     textScaleFactor: 1.1,
//                                                                     style: const TextStyle(color: Colors.black54),
//
//                                                                     //  textAlign: TextAlign.center,
//                                                                   ),
//                                                                 ),
//
//                                                                 Container(
//                                                                   alignment: Alignment.topLeft,
//                                                                   padding: EdgeInsets.all(5.0),
//                                                                   child:   Text( snapshot.data?.docs[index].get(AppConstants.Transaction_Status_Flag)==1?
//                                                                   'Unconfirmed':"confirmed",
//
//                                                                     textScaleFactor: 1.1,
//                                                                     style: const TextStyle(color: Colors.red),
//
//                                                                     //  textAlign: TextAlign.center,
//                                                                   ),
//                                                                 ),
//
//                                                                 Wrap(children: [
//                                                                   Container(
//                                                                       padding: EdgeInsets.all(10),
//                                                                       child: OutlinedButton(
//                                                                           style: OutlinedButton.styleFrom(
//                                                                               elevation: 6,
//                                                                               // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
//                                                                               padding: const EdgeInsets.all(15),
//                                                                               backgroundColor: Colors.black,
//                                                                               shape: RoundedRectangleBorder(
//                                                                                   borderRadius: BorderRadius.circular(30))),
//                                                                           child: const Text(
//                                                                             'Mine Block Peer 5000',
//                                                                             style: TextStyle(fontSize: 10, color: Colors.white),
//                                                                           ),
//                                                                           onPressed: () async {
//                                                                             BlockRepositoryImpl().mineBlockNodeOne(snapshot.data?.docs[index].get(AppConstants.Node_Number)).then((value) {
//                                                                               BlockRepositoryImpl().replaceNodeTwoChain().then((value) {
//                                                                                 FirebaseFirestore.instance.collection(AppConstants.Node_Deatils).doc(AppConstants.Node_Number).
//                                                                                 update({
//                                                                                   AppConstants.Node_Name:"Node 5001"
//                                                                                 });
//                                                                                 print("Inside replace chain");
//                                                                               });
//
//
//                                                                             });
//
//                                                                           }
//                                                                       )),
//
//
//
//                                                                   Container(
//                                                                       padding: EdgeInsets.all(10),
//                                                                       child: OutlinedButton(
//                                                                           style: OutlinedButton.styleFrom(
//                                                                               elevation: 6,
//                                                                               // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
//                                                                               padding: const EdgeInsets.all(15),
//                                                                               backgroundColor: Colors.black,
//                                                                               shape: RoundedRectangleBorder(
//                                                                                   borderRadius: BorderRadius.circular(30))),
//                                                                           child: const Text(
//                                                                             'Mine Block Peer 5001',
//                                                                             style: TextStyle(fontSize: 10, color: Colors.white),
//                                                                           ),
//                                                                           onPressed: () async {
//                                                                             BlockRepositoryImpl().mineBlockNodeTwo().then((value) async{
//
//
//
//
//
//
//
//
//
//
//
//
//
//                                                                               BlockRepositoryImpl().replaceNodeOneChain().then((value) {
//
//                                                                                 print("Inside replace chain");
//                                                                               });
//
//                                                                             });
//
//                                                                           }
//                                                                       )),
//
//
//
//
//                                                                 ],),
//
//
//
//                                                               ]),
//
//                                                             )
//                                                         ) :Container()),
//
//
//
//
//
//                                                   );
//                                                 }): Container(
//                                               height: 200,
//
//                                               alignment: Alignment.center,
//                                               padding: EdgeInsets.all(5.0),
//                                               child: Text("No Un-Confirmed Transactions",
//
//                                                 textScaleFactor: 2,
//                                                 style: const TextStyle(color: Colors.black),
//
//                                                 //  textAlign: TextAlign.center,
//                                               ),
//                                             )
//
//
//
//                                         ):     Container(
//                                           height: 200,
//                                           alignment: Alignment.center,
//                                           padding: EdgeInsets.all(5.0),
//                                           child: Text("No Un-Confirmed Transactions",
//
//                                             textScaleFactor: 2,
//                                             style: const TextStyle(color: Colors.black),
//
//                                             //  textAlign: TextAlign.center,
//                                           ),
//                                         );
//
//                                     }) )]),
//
//
//
//
//
//                             ],),
//
//                           );
//
//                           // } else {
//                           //   return const Center(child: CircularProgressIndicator());
//                           // }
//                         },
//
//                       )
//
//
//
//
//
//
//
//                     ),
//
//
//                     // ],
//                     // ),
//                     //   ),
//                     // ),
//                   );
//                 });
//           }));
//
//   }
// }
