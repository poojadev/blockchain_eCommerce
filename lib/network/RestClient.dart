
import 'package:blockchain_world/accounts/model/AllAccounts/AllAccountsPOJO.dart';
import 'package:blockchain_world/accounts/model/CreateWalletPOJO.dart';
import 'package:blockchain_world/transactions/model/AddTransactionPOJO.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';


import '../transactions/Model/UnConfirmedTransactionsListPOJO.dart';
import '../transactions/model/ReplaceChainPOJO.dart';
import '../util/appconstants/AppConstants.dart';
part 'RestClient.g.dart';

@RestApi(baseUrl: AppConstants.BASE_URL)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;



  @POST(AppConstants.ADD_TRANSACTION)
  Future<String> addTransaction(@Body() AddTransactionPOJO addTransactionPOJO);





  @GET(AppConstants.CREATE_WALLET)
  Future<AllAccountsPOJO>createWallet(@Path() int number);

  //
  //@GET(AppConstants.GET_ALL_ACCOUNTS)
 // Future<AllAccountsPOJO> getAllAccounts();

  @GET(AppConstants.GET_ALL_TRANSACTIONS)
  Future<UnConfirmedTransactionsListPOJO> getAllTransactions();

  @GET(AppConstants.GET_NODE_ACCOUNTS)
  Future<AllAccountsPOJO> getNodeAccounts();

  @GET(AppConstants.GET_USER_ACCOUNT)
  Future<AllAccountsPOJO> getUserAccounts();

  @GET(AppConstants.CLEAR_BLOCKCHAIN)
  Future<String>clearBlockChain();


}



