import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SayacController extends GetxController{
   var sayac = 0.obs ;   //observable variable
  // var _liste = [].obs;  elemans of list

//getter method : class members read
//get sayac {
  //_sayac;
//}
// get sayac => _sayac.value;

 //int sayac (){
 //return _sayac.value;
 //}
//----------------------------------------------------------

//setter method : new value assing
//set sayac(yeniDeger){
  //_sayac=yeniDeger!;
//}
// set sayac(yeniDeger) => _sayac.value=yeniDeger;        tek satır kod yazdığım için arrow function  =>

// void YeniSayacDegeriAta(yeniDeger) {
  // _sayac.value = yeniDeger;
 //}

void arttir (){
  sayac++;
  Get.snackbar("meraba", "işlem başarılı",backgroundColor:Colors.teal);
  }

void azalt(){
  sayac--;
  Get.showSnackbar(const GetSnackBar(
    title: "hello",
    message: "process is successfully",
    duration: Duration(seconds: 3),
    isDismissible: true,
    dismissDirection: DismissDirection.startToEnd,
  ),
  );
}
}