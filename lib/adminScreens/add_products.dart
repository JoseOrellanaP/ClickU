import 'dart:io';

import 'package:clikcus/tools/app_data.dart';
import 'package:clikcus/tools/app_methods.dart';
import 'package:clikcus/tools/app_tools.dart';
import 'package:clikcus/tools/firebase_methods.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddProducts extends StatefulWidget {
  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {

  List<DropdownMenuItem<String>> dropDownMenuColors;
  String selectedColors;
  List<String> colorList = new List();

  List<DropdownMenuItem<String>> dropDownMenuSizes;
  String selectedSizes;
  List<String> sizesList = new List();

  List<DropdownMenuItem<String>> dropDownCategory;
  String selectedCategory;
  List<String> categoryList = new List();

  List<File> imageList;

  TextEditingController productTitleController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productDescController = TextEditingController();

  final scaffolKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    colorList = new List.from(localColors);
    sizesList = new List.from(localSizes);
    categoryList = new List.from(localCategories);
    dropDownMenuColors = buildAndGetDropDownItems(colorList);
    dropDownCategory = buildAndGetDropDownItems(categoryList);
    dropDownMenuSizes = buildAndGetDropDownItems(sizesList);
    selectedColors = dropDownMenuColors[0].value;
    selectedSizes = dropDownMenuSizes[0].value;
    selectedCategory = dropDownCategory[0].value;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffolKey,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
            "Add Products"
        ),
        elevation: 0.0,
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton.icon(
              color: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0)
                )
              ),
              onPressed: () => pickImage(),
              icon: Icon(Icons.add, color: Colors.white,),
              label: Text("Add images",
              style: TextStyle(
                color: Colors.white
              ),),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(height: 10.0,),
            MultiImagePickerList(
              imageList: imageList,
              removeNewImage: (index){
                removeImage(index);
              }
            ),
            SizedBox(height: 10.0,),
            productTextView(textTitle: "Product Title",
                            textHint: "Enter Product Title",
                            controller: productTitleController
                            ),
            productTextView(textTitle: "Product Price",
              textHint: "Enter Product Price",
              textType: TextInputType.number,
              controller: productPriceController
            ),
            SizedBox(height: 10.0,),
            productTextView(textTitle: "Product Description",
              textHint: "Enter Product Description",
              height: 180,
              maxLines: 4,
              controller: productDescController
            ),
            SizedBox(height: 10.0,),
            productDropDown(
                textTitle: "Product Category",
                selectedItem: selectedCategory,
                dropDownCategories: dropDownCategory,
                changedDropDownCategory: changeDropDownCategories
            ),
            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                productDropDown(
                    textTitle: "Color",
                    selectedItem: selectedColors,
                    dropDownCategories: dropDownMenuColors,
                    changedDropDownCategory: changeDropDownColors
                ),
                productDropDown(
                    textTitle: "Size",
                    selectedItem: selectedSizes,
                    dropDownCategories: dropDownMenuSizes,
                    changedDropDownCategory: changeDropDownSizes
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            appButton(
              btnText: "Add Product",
              onBtnClicked: addNewProducts,
              btnPadding: 20.0,
              btnColor: Theme.of(context).primaryColor
            ),

          ],
        ),
      ),
    );
  }

  void changeDropDownColors(String selectedColor){
    setState(() {
      selectedColors = selectedColor;
      print(selectedColors);
    });
  }

  void changeDropDownSizes(String selectedSize){
    setState(() {
      selectedSizes = selectedSize;
      print(selectedSizes);
    });
  }

  void changeDropDownCategories(String selectedCategories){
    setState(() {
      selectedCategory = selectedCategories;
      print(selectedCategory);
    });
  }

  pickImage() async{
    File file = await ImagePicker.pickImage(source: ImageSource.gallery);
    if(file != null){
      List<File> imageFile = new List();
      imageFile.add(file);
      if(imageList == null){
        imageList = List.from(imageFile, growable: true);
      }else{
        for(int s = 0; s< imageFile.length; s++){
          imageList.add(file);
        }
      }
      setState(() {

      });
    }
  }

  removeImage(int index) async{
    imageList.removeAt(index);
    setState(() {

    });
  }

  AppMethods appMethods = new FirebaseMethods();

  addNewProducts() async{
    
    if(imageList == null || imageList.isEmpty){
      showSnackBar("Product Images cannot be empty", scaffolKey);
      return;
    }
    
    if(productTitleController.text == ""){
      showSnackBar("Product title cannot be empty", scaffolKey);
      return;
    }

    if(productPriceController.text == ""){
      showSnackBar("Product price cannot be empty", scaffolKey);
      return;
    }

    if(productDescController.text == ""){
      showSnackBar("Product description cannot be empty", scaffolKey);
      return;
    }

    if(selectedCategory == "Select a Category"){
      showSnackBar("Please select a category", scaffolKey);
      return;
    }

    if(selectedColors == "Select a color"){
      showSnackBar("Please select a color", scaffolKey);
      return;
    }

    if(selectedSizes == "Select a size"){
      showSnackBar("Please select a size", scaffolKey);
      return;
    }

    // show the progress dialog
    displayProgressDialog(context);

    // Get the text from the individual controllers title, price, description
    Map<String, dynamic> newProduct = {
      productTitle: productTitleController.text,
      productPrice: productPriceController.text,
      productDesc: productDescController.text,
      productCat: selectedCategory,
      productColor: selectedColors,
      productSize: selectedSizes,

    };

    // adding the information to firebase
    String productID = await appMethods.addNewProduct(newProduct: newProduct);

    // time to upload images to firebase storage
    List<String> imagesURL = await appMethods.uploadProductImages(
      docID: productID,
      imageList: imageList,
    );

    // check if an error occurred while adding the images
    if(imagesURL.contains(error)){
      closeProgressDialog(context);
      showSnackBar("Image Upload Error", scaffolKey);
      return;
    }

    // update the information after uploading image file to the storage
    bool result = await appMethods.updateProductImages(docID: productID, data: imagesURL);

    if(result != null && result == true){
      closeProgressDialog(context);
      resetEverything();
      showSnackBar("Product Added Successfully", scaffolKey);
    }else{
      closeProgressDialog(context);
      showSnackBar("An Error Occurred", scaffolKey);
    }

  }

  void resetEverything() {

    imageList.clear();
    productTitleController.text = "";
    productPriceController.text = "";
    productDescController.text = "";
    selectedCategory = "Select a Category";
    selectedColors = "Select a color";
    selectedSizes = "Select a size";
    setState(() {

    });

  }

}
