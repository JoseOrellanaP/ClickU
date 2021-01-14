import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AppMethods{
  Future<String> logginUser({String email, String password});
  Future<String> createUserAccount({String fullName, String phone,
                                  String email, String password});
  Future<bool> LoggOutUser();

  Future<DocumentSnapshot> getUserInfo(String userID);

  Future<String> addNewProduct({Map newProduct});

  Future<List<String>> uploadProductImages({List<File> imageList, String docID});

  Future<bool> updateProductImages({
  String docID,
  List<String> data,
  });

}