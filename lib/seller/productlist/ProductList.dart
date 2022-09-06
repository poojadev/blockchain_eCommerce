

import 'package:blockchain_world/seller/productlist/upload_products/SellerProductDetails.dart';
import 'package:blockchain_world/seller/productlist/upload_products/UploadProduct.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../accounts/controller/bloc/repository/AccountRepository.dart';
import '../../ui/sizeConfig.dart';
import '../../util/appconstants/AppConstants.dart';
import 'model/SellerProductArguments.dart';




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
class ProductListState extends StatefulWidget {
  static const String routeName= "/ProductList";

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
  _ProductListStateState createState() => _ProductListStateState();
}



late SellerProductArguments  productDetailArguments ;

class _ProductListStateState extends State<ProductListState> {

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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.of(context)
                .push(
                MaterialPageRoute(builder: (context) => UploadProducts()));
          },
        ),

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

                      padding: EdgeInsets.all(20),

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
                                      


                                      children: [     Container(
                                        height:SizeConfig.heightMultiplier*16,
                                        width: SizeConfig.widthMultiplier*40,

                                        margin: EdgeInsets.all(3),
                                        child: FadeInImage.memoryNetwork(
                                            fit: BoxFit.cover,
                                            placeholder: kTransparentImage,
                                            image: documentSnapshot?.get(AppConstants.productImages)[0]),
                                      ),


                                        Container(
                                            padding: const EdgeInsets.all(7),
                                            child: Text(documentSnapshot?.get(
                                                AppConstants.productName),style: TextStyle(fontSize: 16),)),


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