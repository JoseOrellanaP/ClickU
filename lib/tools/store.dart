import 'package:flutter/material.dart';

class Store{
  String itemName;
  double itemPrice;
  String itemImage;
  double itemRating;

  Store.items({
    this.itemPrice,
    this.itemName,
    this.itemImage,
    this.itemRating
  });
}

List<Store> storeItems = [
  Store.items(
      itemName: "Pink Can",
      itemPrice: 2500.00,
      itemImage: "https://images-na.ssl-images-amazon.com/images/I/81OyDqVoEaL._AC_SL1500_.jpg",
      itemRating: 0.0
  ),

  Store.items(
      itemName: "Black Strip White",
      itemPrice: 2499.00,
      itemImage: "https://images-na.ssl-images-amazon.com/images/I/41YF1YD80eL._AC_SX466_.jpg",
      itemRating: 0.0
  ),

  Store.items(
      itemName: "Pink Can",
      itemPrice: 2500.00,
      itemImage: "https://img.gkbcdn.com/p/2018-08-10/xiaomi-mi-gaming-laptop-i7-8750h-gtx1050-ti-8gb-256gb-1tb-deep-gray-1574132653532._w500_.jpg",
      itemRating: 0.0
  ),

  Store.items(
      itemName: "Black Strip White",
      itemPrice: 2499.00,
      itemImage: "https://xiaomiplanet.sk/wp-content/uploads/2020/08/xiaomi-mi-gaming-laptop-2019-xiaomiplanet-cover.jpg",
      itemRating: 0.0
  ),

  Store.items(
      itemName: "Pink Can",
      itemPrice: 2500.00,
      itemImage: "https://www.nextbuying.com/media/catalog/product/cache/20c6953b0706163297cf478a9d7d460d/i/0/i000649-01.jpg",
      itemRating: 0.0
  ),

  Store.items(
      itemName: "Black Strip White",
      itemPrice: 2499.00,
      itemImage: "https://www.digitalstorm.com/img/products/avon/2020-overview-1-b.jpg",
      itemRating: 0.0
  ),

  Store.items(
      itemName: "Pink Can",
      itemPrice: 2500.00,
      itemImage: "https://brain-images-ssl.cdn.dixons.com/2/0/10206002/u_10206002.jpg",
      itemRating: 0.0
  ),

  Store.items(
      itemName: "Black Strip White",
      itemPrice: 2499.00,
      itemImage: "https://sc01.alicdn.com/kf/HTB1hYSYCv5TBuNjSspm761DRVXad.png_350x350.png",
      itemRating: 0.0
  ),

  Store.items(
      itemName: "Pink Can",
      itemPrice: 2500.00,
      itemImage: "https://microless.com/cdn/products/604fa9b470e5672540e462121d157bdd-hi.jpg",
      itemRating: 0.0
  ),

  Store.items(
      itemName: "Black Strip White",
      itemPrice: 2499.00,
      itemImage: "https://target.scene7.com/is/image/Target/GUEST_3f0d9af1-ffe4-4086-ba74-ed1e6b8619d2?wid=488&hei=488&fmt=pjpeg",
      itemRating: 0.0
  ),

  Store.items(
      itemName: "Pink Can",
      itemPrice: 2500.00,
      itemImage: "https://www.patchesoft.com/uploads/lenovo-ideapad-l340-gaming-laptop-review.jpg",
      itemRating: 0.0
  )
];