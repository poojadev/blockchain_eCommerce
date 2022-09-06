import 'package:blockchain_world/accounts/model/AllAccounts/AllAccountsPOJO.dart';
import 'package:blockchain_world/transactions/model/AddTransactionPOJO.dart';
import 'package:blockchain_world/transactions/model/CreateWalletPOJO.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';


import '../transactions/Model/UnConfirmedTransactionsListPOJO.dart';
import '../transactions/model/ReplaceChainPOJO.dart';
import '../util/appconstants/AppConstants.dart';
part 'Node2.g.dart';

@RestApi(baseUrl: AppConstants.BASE_URL_NODE2)
abstract class Node2 {
  factory Node2(Dio dio, {String baseUrl}) = _Node2;




  @POST(AppConstants.ADD_TRANSACTION)
  Future<String> addTransaction(@Body() AddTransactionPOJO addTransactionPOJO);



  @GET(AppConstants.CREATE_WALLET)
  Future<AllAccountsPOJO>createWallet(@Path() int number);

  // @GET(AppConstants.GET_CONNECTED_NODES)
  // Future<NodeAddressPOJO> getConnectedNodes();
  @GET(AppConstants.GET_ALL_ACCOUNTS)
  Future<AllAccountsPOJO> getAllAccounts();



  @GET(AppConstants.GET_NODE_ACCOUNTS)
  Future<AllAccountsPOJO> getNodeAccounts();


}



