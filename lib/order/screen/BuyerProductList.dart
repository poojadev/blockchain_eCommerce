

import 'package:blockchain_world/transactions/bloc/transaction_repository/TransactionRepository.dart';
import 'package:blockchain_world/transactions/model/AddTransactionPOJO.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../UploadProduct/Model/SellerProductArguments.dart';
import '../../UploadProduct/screens/SellerProductDetails.dart';
import '../../UploadProduct/screens/UploadProduct.dart';
import '../../accounts/controller/bloc/repository/AccountRepository.dart';
import '../../network/Node1.dart';
import '../../network/Node2.dart';
import '../../network/RestClient.dart';
import '../../ui/sizeConfig.dart';
import '../../util/appconstants/AppConstants.dart';





// class ProductList extends StatelessWidget {
//   static const String routeName= "/ProductDetails";

//   late SellerProductArguments  productDetailArguments ;
//
//   ProductList({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ProductListState(
// //        id: genresId,
// //        genresName: genresName,
// //        pageDirection: pageDirection,
//         key: key, productDetailsArguments: productDetailArguments,
//       ),
//     );
//   }
// }
class BuyerListState extends StatefulWidget {
  static const String routeName= "/BuyerListState";

//   const ProductListState(
//       {Key? key,  required this.productDetailsArguments})
//       : super(key: key);
//
//
// //  final int id;
// //  final String genresName;
// //  final int pageDirection;
//   final SellerProductArguments productDetailsArguments;

  @override
  _BuyerListStateState createState() => _BuyerListStateState();
}



late SellerProductArguments  productDetailArguments ;
var dio = Dio()..options.baseUrl = AppConstants.BASE_URL;

RestClient restApiClient = RestClient(dio);


var dio1 = Dio()..options.baseUrl = AppConstants.BASE_URL_NODE1;
Node1 node1 = Node1(dio1);


var dio2 = Dio()..options.baseUrl = AppConstants.BASE_URL_NODE2;
Node2 node2 = Node2(dio2);
class _BuyerListStateState extends State<BuyerListState> {

  TextEditingController ProductName = new TextEditingController();
  TextEditingController ProductDescription = new TextEditingController();
  TextEditingController ProductQuantity = new TextEditingController();
  TextEditingController ProductPrice = new TextEditingController();
  TextEditingController ProductLocation = new TextEditingController();

  List<String> imageUrls = <String>[];

  List<String>category = <String>[];
  late String sellerId = "";

  @override
  void initState() {
    super.initState();
    //  imgRef = FirebaseFirestore.instance.collection('imageURLs');
    category = <String>[];
    category.add("Graphics Card");
    category.add("Motherboard");
    category.add("Cabinet");
    category.add("Mouse");
    category.add("RAM");
    category.add("Headsets");
    category.add("Keyboard");
    category.add("Chair");
    category.add("Processors");
    category.add("Graphics Card");
    category.add("Gaming Eyewear");
    category.add("Mice & Accessories");
   // FirebaseFirestore.instance.collection(AppConstants.Account_Details).get().then((value) {

      //if(value.size<2) {
        AccountRepositoryImpl().createWallet();
      //}
  //  });

    //
    // for(int i=0;i<category.length;i++)
    //   {
    //     FirebaseFirestore.instance
    //         .collection('category')
    //         .doc()
    //         .set({
    //       'categoryName': category[i],
    //     }).then((_) {
    //
    //     });
    //
    //   }

  }


  @override
  Widget build(BuildContext context) {
    print("seller Id" + sellerId);

    AccountRepositoryImpl().getNodes();

    return Scaffold(


        body: LayoutBuilder(builder: (context, constraints) {
          return OrientationBuilder(
              builder: (context, orientation) {
                SizeConfig().init(constraints, orientation);


                //function retrive specific seller products
                return StreamBuilder(
                  stream: FirebaseFirestore.instance.collection(
                      AppConstants.sellerProductTable).where(
                      AppConstants.sellerId, isEqualTo: sellerId).
                  snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    return !snapshot.hasData
                        ? Center(
                      child: CircularProgressIndicator(),
                    )
                        : Container(

                      padding: EdgeInsets.all(4),
                      child: GridView.builder(
                          itemCount: snapshot.data?.docs.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            QueryDocumentSnapshot<
                                Object?>? documentSnapshot = snapshot.data
                                ?.docs[index];


                            return GestureDetector(
                                child:

                                Card(child:

                                Container(
                                    height: SizeConfig.heightMultiplier * 30,


                                    child: ListView(


                                      children: [

                                        FloatingActionButton(
                                          child: Icon(Icons.add),
                                          foregroundColor: Colors.black,
                                          onPressed: () async{





int productPrice;
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

                                                      productPrice= int
                                                          .parse(
                                                      documentSnapshot!.get(AppConstants
                                                          .productPrice)
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
                                                    .then((value) {
                                                      print(value);

                                                      FirebaseFirestore.instance.collection("seller_order_table").doc().set({

                                                        AppConstants.productPrice:productPrice,
                                                        AppConstants.productName:documentSnapshot.get(AppConstants.productName),
                                                        "order_status":false,
                                                        "buyer":   buyerPublicKey
                                                      });
                                                      FirebaseFirestore.instance.collection("cust_order_table").doc().set({

                                                        AppConstants.productPrice:productPrice,
                                                        AppConstants.productName:documentSnapshot.get(AppConstants.productName),
                                                        "order_status":false,
                                                        "seller":   sellerPublicKey
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



                                          },
                                        ),


                                        Container(
                                        height:SizeConfig.heightMultiplier*16,
                                        width: SizeConfig.widthMultiplier*40,

                                        margin: EdgeInsets.all(3),
                                        child: FadeInImage.memoryNetwork(
                                            fit: BoxFit.fill,
                                            placeholder: kTransparentImage,
                                            image: documentSnapshot?.get(AppConstants.productImages)[0]),
                                      ),


                                        Container(
                                            margin: const EdgeInsets.all(3),
                                            child: Text(documentSnapshot?.get(
                                                AppConstants.productName))),


                                      ],)))
                                ,


                                onTap: () {
                                  SellerProductArguments productArguments = SellerProductArguments(
                                      sellerId: documentSnapshot!.get(
                                          AppConstants.sellerId),
                                      productName: documentSnapshot!.get(
                                          AppConstants.productName),
                                      productImages: documentSnapshot.get(
                                          AppConstants.productImages),
                                      productDescription: documentSnapshot!.get(
                                          AppConstants.productDescription),
                                      productPrice: documentSnapshot!.get(
                                          AppConstants.productPrice),
                                      productDeliverInfo: documentSnapshot!.get(
                                          AppConstants.productDeliveryInfo),
                                      productQunatity: documentSnapshot.get(
                                          AppConstants.productQuantity),
                                      categoryId: "",
                                      id: documentSnapshot!.id,
                                      productBrand: documentSnapshot!.get(
                                          AppConstants.productBrand)


                                  );


                                  print("SellerProductArguments" +
                                      documentSnapshot!.get(
                                          AppConstants.productName));

                                  Navigator.pushNamed(
                                      context, SellerProductDetails.routeName,
                                      arguments: productArguments);
                                }


                            );
                          }),
                    );
                  },
                )
                ;
              });
        }));
  }
}