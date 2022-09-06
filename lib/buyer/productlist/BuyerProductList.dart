

import 'package:blockchain_world/buyer/productlist/ProdcutDetailsScreen.dart';
import 'package:blockchain_world/buyer/productlist/model/ProductDetailPOJO.dart';
import 'package:blockchain_world/transactions/bloc/transaction_repository/TransactionRepository.dart';
import 'package:blockchain_world/transactions/model/AddTransactionPOJO.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';


import '../../accounts/controller/bloc/repository/AccountRepository.dart';
import '../../network/Node1.dart';
import '../../network/Node2.dart';
import '../../network/RestClient.dart';
import '../../seller/productlist/model/SellerProductArguments.dart';
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


    return Scaffold(


        body: LayoutBuilder(builder: (context, constraints) {
          return OrientationBuilder(
              builder: (context, orientation) {
                SizeConfig().init(constraints, orientation);


                //function retrive specific seller products
                return

                ListView(children: [








                  Container(
                    height:SizeConfig.heightMultiplier*70,


                    child:
                  StreamBuilder(
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

                      padding: EdgeInsets.all(14),
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
                                      padding: const EdgeInsets.all(10),


                                      children: [




                                        Container(
                                        height:SizeConfig.heightMultiplier*16,
                                        width: SizeConfig.widthMultiplier*40,

                                        margin: const EdgeInsets.all(3),
                                        child: FadeInImage.memoryNetwork(
                                            fit: BoxFit.fill,
                                            placeholder: kTransparentImage,
                                            image: documentSnapshot?.get(AppConstants.productImages)[0]),
                                      ),

                                        Container(
                                          margin: const EdgeInsets
                                              .all(5),
                                          child: Text(
                                              documentSnapshot?.get(
                                                  AppConstants.productName),
                                              style: TextStyle(
                                                  fontSize: 16)),
                                          // height: SizeConfig.heightMultiplier*2,
                                        ),


                                      ],)))
                                ,


                                onTap: () {
                                  ProductDetailPOJO productArguments = ProductDetailPOJO(
                                      productId: documentSnapshot!.id



                                  );


                                  print("SellerProductArguments" +
                                      documentSnapshot!.get(
                                          AppConstants.productName));

                                  Navigator.pushNamed(
                                      context, ProductDetails.routeName,
                                      arguments: productArguments);
                                }


                            );
                          }),
                    );
                  },
                )),

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


                ])
                ;
              });
        }));
  }
}