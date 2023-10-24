import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/sayac_controller.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key});

   final SayacController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Obx(() => Text(_controller.sayac.value.toString(),style:const TextStyle(fontSize: 72,fontWeight: FontWeight.bold),)),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              onPressed: (){
            _controller.arttir();
          },
              child:const Text("increment counter",style:TextStyle(color: Colors.redAccent),),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              onPressed: (){
            _controller.azalt();
          },
              child:const Text("decrement counter",style:TextStyle(color: Colors.redAccent),),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
            ),
            onPressed:(){
            Get.back();
            // Get.off(SecondPage());  secondpage i aç ama bu sayfayıda stateden çıkar
          },
              child:const Text("Back",style:TextStyle(color: Colors.redAccent),),
          ),
        ],
      ),
    );
  }
}
