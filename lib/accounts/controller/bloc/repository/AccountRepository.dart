

import 'dart:math';

import 'package:blockchain_world/accounts/model/AllAccounts/AllAccountsPOJO.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../network/RestClient.dart';
import '../../../../util/appconstants/AppConstants.dart';
import '../../../model/CreateWalletPOJO.dart';
var dio = Dio()..options.baseUrl = AppConstants.BASE_URL;
RestClient restApiClient = RestClient(dio);

AllAccountsPOJO? accountsPOJO;
class AccountRepositoryImpl implements AccountRepository {


  @override
  Future<void> updateWalletAmount(String id, int amount) async
  {
    await FirebaseFirestore.instance.collection(AppConstants.Account_Details)
        .doc(id)
        .update({
      AppConstants.Coins: amount
    });
  }

  @override
  Future getNodes() async
  {
    FirebaseFirestore.instance.collection(AppConstants.Account_Details)
        .get()
        .then((value) {
      for (int i = 0; i < value.size; i++) {
        if (i == 0) {
          FirebaseFirestore.instance.collection(AppConstants.Account_Details)
              .doc(value.docs[0].id)
              .update({

            "wallet": "Buyer"
          });
        }
        if (i == 1) {
          FirebaseFirestore.instance.collection(AppConstants.Account_Details)
              .doc(value.docs[1].id)
              .update({

            "wallet": "Seller"
          });
        }
      }
    });
  }


  // @override
  // Future getAllAccounts() async {
  //   // TODO: implement getAllAccounts
  //   return await restApiClient.getAllAccounts().then((value) {
  //     print("restApiClient" + value.accounts.toString());
  //
  //     for (int i = 0; i < value.accounts.length; i++) {
  //
  //           if(value.accounts[i].account_owner.isEmpty) {
  //
  //               FirebaseFirestore.instance.collection(
  //                   AppConstants.Account_Details)
  //                   .doc()
  //                   .set(
  //                   {
  //                     AppConstants.Public_key: value.accounts[i].public_key,
  //                     AppConstants.Private_Key: value.accounts[i].private_key,
  //                     AppConstants.Coins: value.accounts[i].coins,
  //
  //
  //                   });
  //
  //
  //       }
  //     }
  //   });
  // }

  @override
  Future createWallet() {
    // TODO: implement createWallet
   return  restApiClient.getUserAccounts().then((val) {

     print("--" +val.accounts.toString());

    // List< CreateWalletPOJO> createWalletPOJO=[];
    // createWalletPOJO.add(val);
    //
    //
     int walletLength=val.accounts.length;



      for(int i=0;i<val.accounts.length;i++) {
        // String? publicKey=createWalletPOJO[0].publicKey;

        print("{{" + val.accounts.length.toString());

          if (val.accounts[i].account_owner.isEmpty  ) {
            for(int i=0;i<2;i++) {

              FirebaseFirestore.instance.collection(

                AppConstants.Account_Details).get().then((value) {
              if (value.size <2) {
                FirebaseFirestore.instance.collection(
                    AppConstants.Account_Details)
                    .doc(val.accounts[i].public_key)
                    .set(
                    {
                      AppConstants.Public_key: val.accounts[i].public_key,
                      AppConstants.Private_Key: val.accounts[i].private_key,
                      AppConstants.Coins: val.accounts[i].coins,
                      "account_owner": val.accounts[i].account_owner,


                    });
              }
            });
          }
        }
      }
   });
  }

}

abstract class AccountRepository {


 // Future getAllAccounts();
  //Future createWallet();


}