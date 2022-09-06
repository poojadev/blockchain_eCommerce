
import 'package:blockchain_world/accounts/model/CreateWalletPOJO.dart';
import 'package:blockchain_world/transactions/model/AddTransactionPOJO.dart';
import 'package:blockchain_world/transactions/model/ReplaceChainPOJO.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';




import '../accounts/model/AllAccounts/AllAccountsPOJO.dart';
import '../transactions/Model/UnConfirmedTransactionsListPOJO.dart';
import '../util/appconstants/AppConstants.dart';
part 'Node1.g.dart';

@RestApi(baseUrl: AppConstants.BASE_URL_NODE1)
abstract class Node1 {
  factory Node1(Dio dio, {String baseUrl}) = _Node1;




  @POST(AppConstants.ADD_TRANSACTION)
  Future<String> addTransaction(@Body() AddTransactionPOJO addTransactionPOJO);




  @GET(AppConstants.CREATE_WALLET)
  Future<CreateWalletPOJO>createWallet(@Path() int number);



}



