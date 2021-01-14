import 'dart:io';

import 'package:clikcus/tools/progressdialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget appTextField({IconData textIcon, String textHint, bool isPassword,
  double sidePadding, TextEditingController controller,
  TextInputType textType}){

  sidePadding == null ? sidePadding = 0.0: sidePadding;
  textHint == null ? textHint = "": textHint;
  textType == null ? textType = TextInputType.text : textType;

  return Padding(
    padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
    child: Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.0))
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword == null ? false: isPassword, keyboardType: textType,
        decoration: InputDecoration(

          border: InputBorder.none,
          hintText: textHint,
          prefixIcon: textIcon == null ? Container() : Icon(textIcon),
        ),
      ),
    ),
  );
}

Widget productDropDown({String textTitle,
                        String selectedItem,
                        List<DropdownMenuItem<String>> dropDownCategories,
                        ValueChanged<String> changedDropDownCategory}){

  textTitle == null ? textTitle = "Enter a Title" : textTitle;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          textTitle,
          style: TextStyle(fontWeight: FontWeight.w700,
                            color: Colors.white),
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Container(
          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15.0))
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: new DropdownButtonHideUnderline(
              child: DropdownButton(
                value: selectedItem,
                items: dropDownCategories,
                onChanged: changedDropDownCategory,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

showSnackBar(String message, final scaffoldKey){
  scaffoldKey.currentState.showSnackBar(new SnackBar(
    backgroundColor: Colors.red[600],
    content: Text(
      message,
      style: TextStyle(
        color: Colors.white
      ),
    ),
  ));
}

Widget appButton({String btnText, double btnPadding, Color btnColor, VoidCallback onBtnClicked}){

  btnText == null ? btnText == "App Button": btnText;
  btnPadding == null ? btnPadding = 0.0 : btnPadding;
  btnColor == null ? btnColor = Colors.black : btnColor;


  return Padding(
    padding: EdgeInsets.all(btnPadding),
    child: RaisedButton(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0)
        )
      ),
      onPressed: onBtnClicked,
      child: Container(
        height: 50.0,
        child: Center(
          child: Text(
            btnText,
            style: TextStyle(
              color: btnColor,
              fontSize: 18.0
            ),
          ),
        ),
      ),
    ),
  );
}

Widget productTextView({String textTitle, String textHint, double height,
                        TextEditingController controller,
                        TextInputType textType, int maxLines}){

  textTitle == null ? textTitle = "Enter Title" : textTitle;
  textHint == null ? textHint = "Enter Hint" : textHint;
  height == null ? height = 50.0 : height;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          textTitle,
          style: TextStyle(fontWeight: FontWeight.w700,
          color: Colors.white),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Container(
          height: height,
          decoration: new BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius:
              BorderRadius.all(Radius.circular(4.0))
          ),
          child: TextField(
            controller: controller,
            keyboardType: textType == null ? TextInputType.text : textType,
            maxLines: maxLines == null ? null : maxLines,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: textHint,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget MultiImagePickerList({List<File> imageList,
                            VoidCallback removeNewImage(int position)}){
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: imageList == null || imageList.length == 0
      ? new Container()
      : new SizedBox(
        height: 150.0,
        child: ListView.builder(
          itemCount: imageList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.only(left: 3.0, right: 3.0),
              child: Stack(
                children: [
                  Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(100),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0)
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(imageList[index])
                      )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.red[600],
                      child: IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: Colors.white,
                        ),
                        onPressed: (){
                          removeNewImage(index);
                        },
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      )
      ,
    );
  }

List<DropdownMenuItem<String>> buildAndGetDropDownItems(List size){
  List<DropdownMenuItem<String>> items = new List();
  for (String size in size){
    items.add(new DropdownMenuItem(value: size, child: Text(size),));
  }
  return items;
}

closeProgressDialog(BuildContext context){
  Navigator.of(context).pop();
}

displayProgressDialog(BuildContext context){
  Navigator.of(context).push(PageRouteBuilder(
    opaque: false,
    pageBuilder: (BuildContext context, _, __){
      return ProgressDialog();
    }
  ));
}

writeDataLocally({String key, String value}) async{
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.setString(key, value);
}

writeBoolLocally({String key, bool value}) async{
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.setBool(key, value);
}

getStringDataLocally({String key}) async{
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.getString(key);
}

getBoolDataLocally({String key}) async{
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.getBool(key) == null ? false : localData.getBool(key);
}

clearDataLocally() async{
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.clear();
}