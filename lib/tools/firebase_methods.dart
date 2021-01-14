import 'package:clikcus/tools/app_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'app_data.dart';
import 'app_tools.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class FirebaseMethods implements AppMethods{

  //Firestore firestore = Firestore.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<String> createUserAccount({String fullName, String phone, String email, String password}) async{
    // TODO: implement createUserAccount
    UserCredential user;
    try{
      user = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password);

      if(user != null){

        await firestore
            .collection(usersData)
            .doc(user.user.uid)
            .set({

          userID: user.user.uid,
          fullNameL: fullName,
          userEmail: email,
          userPassword: password,
          phoneNumber: phone

        });

        writeDataLocally(key: userID, value: user.user.uid);
        writeDataLocally(key: fullName, value: fullName);
        writeDataLocally(key: userEmail, value: userEmail);
        writeDataLocally(key: userPassword, value: password);

      }

    } //on PlatformException catch (e) {
    on FirebaseAuthException catch (e){
      return errorMSG(e.toString());
    }

    return user == null ? errorMSG("Error") : successfulMSG();

  }

  @override
  Future<String> logginUser({String email, String password}) async{
    // TODO: implement logginUser
    UserCredential user;
    try{
      user = await auth.signInWithEmailAndPassword(
          email: email,
          password: password);


      if(user != null){
        DocumentSnapshot userInfo = await getUserInfo(user.user.uid);
        await writeDataLocally(key: userID, value: userInfo[userID]);
        await writeDataLocally(key: fullNameL, value: userInfo[fullNameL]);
        await writeDataLocally(key: userEmail, value: userInfo[userEmail]);
        await writeDataLocally(key: phoneNumber, value: userInfo[phoneNumber]);
        //writeDataLocally(key: photoURL, value: userInfo[photoURL]);
        await writeBoolLocally(key: loggedIn, value: true);
      }


    } //on PlatformException catch (e) {
    on FirebaseAuthException catch (e){
      return errorMSG(e.toString());
    }

    return user == null ? errorMSG("Error") : successfulMSG();

  }

  Future<bool> complete() async{
    return true;
  }

  Future<bool> notComplete() async{
    return false;
  }

  Future<String> successfulMSG() async{
    return successful;
  }

  Future<String> errorMSG(String e) async{
    return e;
  }

  @override
  Future<bool> LoggOutUser() async{
    // TODO: implement LoggOutUser
    await auth.signOut();
    await clearDataLocally();
    return complete();

    throw UnimplementedError();
  }

  @override
  Future<DocumentSnapshot> getUserInfo(String userID) async{
    // TODO: implement getUserInfo

    return await firestore.collection(usersData).doc(userID).get();

    throw UnimplementedError();
  }

  @override
  Future<String> addNewProduct({Map newProduct}) async{
    // TODO: implement addNewProduct

    String documentID;

    await firestore.collection(appProducts).add(newProduct).then((documentRef){
      documentID = documentRef.id;

    });

    return documentID;

  }

  @override
  Future<List<String>> uploadProductImages({List<File> imageList, String docID}) async{
    // TODO: implement uploadProductImages

    List<String> imageURL = List();

    try{
      for(int s = 0; s < imageList.length; s++){

        firebase_storage.Reference storageReference = firebase_storage.FirebaseStorage.instance
            .ref()
            .child(appProducts)
            .child(docID)
            .child(docID + "$s.jpg");

        await storageReference.putFile(imageList[s]);
        var Url = await storageReference.getDownloadURL();
        imageURL.add(Url);
        

      }
    }on PlatformException catch (e){
      imageURL.add(error);
      print(e.details);
    }
    return imageURL;
  }

  @override
  Future<bool> updateProductImages({String docID, List<String> data}) async{

    bool msg;
    await firestore.collection(appProducts)
    .doc(docID)
    .update({productImages: data}).whenComplete(() => msg = true);

    return msg;
  }
}