
class OrderPOJO
{

  late final   String id;
  late final   List<String> productName;
  late List<String> image;
  late String productDescription;
  late bool productAvailable;
  late String productLocation;
  late String productPrice;
  late String productQty;
  late String productCoverImage;

  OrderPOJO( {required this.id, required this.productName,
    required this.productDescription,required this.productAvailable,required this.productLocation,
    required this.productPrice,
    required this.productCoverImage,required this.productQty

  });


//  SearchProductFiltersPOJO(String id,String FilterName,String image )
// {
//   id=this.id;
//   FilterName=this.FilterName;
//   image=this.image;
//
// }







}