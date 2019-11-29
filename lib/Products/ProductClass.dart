class Product
{
  String badgeNumber;
  String productName;
  DateTime expiryDate;
  double weight;
  int price;

  Product(String ProdName , String Batch , DateTime ExpDate , double Weight , int Price){
    badgeNumber=Batch;
    productName=ProdName;
    expiryDate=ExpDate;
    price=Price;
    weight=Weight;
  }
}

