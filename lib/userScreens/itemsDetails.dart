import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart.dart';

class itemDetail extends StatefulWidget {

  String itemName;
  String itemImage;
  String itemSubname;
  String itemDescription;
  List itemImages;
  String itemPrice;
  double itemRating;

  itemDetail({
    this.itemSubname,
    this.itemPrice,
    this.itemDescription,
    this.itemImages,
    this.itemName,
    this.itemImage,
    this.itemRating
  });

  @override
  _itemDetailState createState() => _itemDetailState();
}

class _itemDetailState extends State<itemDetail> {
  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Item Details"
        ),
        centerTitle: false,
        iconTheme: IconThemeData(
            color: Colors.white
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            height: 300.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        widget.itemImage
                    ),
                    fit: BoxFit.fitHeight
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(120.0),
                  bottomLeft: Radius.circular(120.0),
                )
            ),
          ),
          Container(
            height: 300.0,
            decoration: BoxDecoration(
                color: Colors.grey.withAlpha(50),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(120.0),
                  bottomLeft: Radius.circular(120.0),
                )
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Card(
                  child: Container(
                    width: screenSize.width,
                    margin: EdgeInsets.only(left: 20.0,  right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          widget.itemName,
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          widget.itemSubname,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: Colors.blue,
                                  size: 20.0,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "${widget.itemRating}",
                                  style: TextStyle(
                                      color: Colors.black
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "${widget.itemPrice}",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.red[500],
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: screenSize.width,
                    height: 150.0,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.itemImages.length,
                        //itemCount: widget.itemImages.length,
                        itemBuilder: (context, index){
                          return Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 5.0, right: 5.0),
                                height: 140.0,
                                width: 100.0,
                                child: //Image.network(widget.itemImage),
                                Image.network(widget.itemImages[index])
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5.0, right: 5.0),
                                height: 140.0,
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withAlpha(50),
                                ),
                              )
                            ],
                          );
                        }
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: screenSize.width,
                    margin: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                          widget.itemDescription,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                        SizedBox(height: 10.0,),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: screenSize.width,
                    margin: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Colors",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        SizedBox(
                          height: 50.0,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ChoiceChip(
                                    label: Text(
                                        "Color $index"
                                    ),
                                    selected: false,
                                  ),
                                );
                              }
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Sizes",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: 50.0,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ChoiceChip(
                                    label: Text("Size $index"),
                                    selected: false,
                                  ),
                                );
                              }
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Sizes",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CircleAvatar(
                              child: Icon(Icons.remove),
                            ),
                            Text("0"),
                            CircleAvatar(
                              child: Icon(Icons.add),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 50.0,
                        )

                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          FloatingActionButton(
            onPressed: (){
              Navigator.of(context).push(
                  CupertinoPageRoute(
                      builder: (BuildContext context){
                        return ClickUCart();
                      }
                  )
              );
            },
            child: Icon(Icons.shopping_cart),
          ),
          CircleAvatar(
            radius: 10.0,
            backgroundColor: Colors.red,
            child: Text(
              "0",
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        elevation: 00.0,
        shape: CircularNotchedRectangle(),
        notchMargin: 5.0,
        child: Container(
          height: 50.0,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: (screenSize.width - 20) / 2,
                child: Text(
                  "Add to favorites",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ),
              Container(
                width: (screenSize.width-20) / 2,
                child: Text(
                  "Order now",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
