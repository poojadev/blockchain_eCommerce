

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../util/appconstants/AppConstants.dart';
import '../../../network/Node1.dart';
import '../../../network/Node2.dart';
import '../../../network/RestClient.dart';
import '../../Model/AddTransactionPOJO.dart';
import 'package:crypto/crypto.dart';

import '../../Model/UnConfirmedTransactionsListPOJO.dart';


var dio = Dio()..options.baseUrl = AppConstants.BASE_URL;

RestClient restApiClient = RestClient(dio);


var dio1 = Dio()..options.baseUrl = AppConstants.BASE_URL_NODE1;
Node1 node1 = Node1(dio1);


var dio2 = Dio()..options.baseUrl = AppConstants.BASE_URL_NODE2;
Node2 node2 = Node2(dio2);
AddTransactionPOJO? addTransactionPOJO;

class TransactionRepositoryImpl implements TransactionRepository {

  @override
  Future<AddTransactionPOJO>addTransactionToBlockNode1(addTransactionPOJO)async
  {
    return  restApiClient
        .addTransaction(addTransactionPOJO!).then((value){
      print("Transaction addd in bloack 1");
      return addTransactionPOJO;


    });

  }

  @override
  Future<AddTransactionPOJO>addTransactionToBlockNode2(addTransactionPOJO)async
  {
    return  node1
        .addTransaction(addTransactionPOJO!).then((value){
      print("Transaction addd in bloack 2");

      return addTransactionPOJO;


    });

  }

  @override
  Future<AddTransactionPOJO>addTransactionToBlockNode3(addTransactionPOJO)async
  {
    return  node2
        .addTransaction(addTransactionPOJO!).then((value){
      print("Transaction addd in bloack 3");

      return addTransactionPOJO;


    });

  }





  @override
  Future<UnConfirmedTransactionsListPOJO> getTransactionList() {
    // TODO: implement getTransactionList
    return restApiClient.getAllTransactions();
  }



  @override
  Future<void>addTransactionToFirebase(String senderId,String receiverId,int amount,String node_id)
  async {



    // var bytes1 = utf8.encode(senderId+receiverId);         // data being hashed
    // var digest1 = sha256.convert(bytes1);
    String documentId =
        DateTime
            .now()
            .millisecondsSinceEpoch
            .toString();
    var output = sha256.convert(utf8.encode(senderId+receiverId+documentId)).toString();

    await  FirebaseFirestore.instance.collection(AppConstants.Transactions)
        .doc(documentId)
        .set({
      AppConstants.Transaction_Amount:amount,
      AppConstants.Transaction_From:senderId,
      AppConstants.Transaction_To:receiverId,
      AppConstants.Transaction_Status_Flag:1,
      AppConstants.Transaction_DateTime: DateTime
          .now(),
    AppConstants.Node_Number:node_id,
    AppConstants.Transaction_Hash:output,
      AppConstants.Block_Reward:0



    });
           print("Transaction nserting...");

  }
  @override
  Stream getTransactions() {

    return FirebaseFirestore.instance.collection(AppConstants.Transactions).snapshots();
  }
  @override
  Stream getNodeTransactions( String nodePublicKey) {

    return FirebaseFirestore.instance.collection(AppConstants.Transactions).where(AppConstants.Transaction_From,isEqualTo: nodePublicKey).snapshots();
  }




}
abstract class TransactionRepository {
  Future<void>addTransactionToFirebase(String senderId,String receiverId,int amount,String node_number);
  Stream getTransactions();
  Stream getNodeTransactions(String nodePublicKey);

  Future<AddTransactionPOJO>addTransactionToBlockNode1(addTransactionPOJO);
  Future<AddTransactionPOJO>addTransactionToBlockNode2(addTransactionPOJO);
  Future<AddTransactionPOJO>addTransactionToBlockNode3(addTransactionPOJO);

  Future<UnConfirmedTransactionsListPOJO>getTransactionList();




}
