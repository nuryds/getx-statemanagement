import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_manager_example/controllers/sayac_controller.dart';
import 'package:getx_state_manager_example/second_page.dart';
import 'package:getx_state_manager_example/translation.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    translations: Messages(), // your translations
    locale: Get.deviceLocale, // translations will be displayed in that locale
    fallbackLocale:const Locale('en', 'UK'), // specify the fallback locale in case an invalid locale is selected.
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple.shade50),
        useMaterial3: true,
      ),
      home:MyHomePage(),
    );
  }

}

class MyHomePage extends StatelessWidget {


  MyHomePage({super.key});

  //controller example(instance)
  final SayacController _controller = Get.put(SayacController());

  //ikinci bir sayfada SayacController sınıfını tanımlarken de
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("hello ".tr, style:const TextStyle(fontSize: 32),),
            //helloyu translate et
            Text("button text ".tr, style:const TextStyle(fontSize: 32),),
            Obx(
                    () => Text(_controller.sayac!.toString() ,style:const TextStyle(fontSize: 32),),
            ),
          ],
        ),
      ),
      //obx yerine getx de kullanılabilir ama builder bekler ve controller verir (_controller2)
      //hangisinın kullanılacağına ise ,eğer yukarda put veya find ile, ilgili controller sınıfı tanımlanmışsa Obx değilse Getx
      //yukarda put veya get ile tanımlanmamış durumda Getx kullanırken de SayacController türündeki veriyi burada enjekte ederiz GetX<SayacController>(builder: .......
      // GetX(builder:(controller2) => Text(_controller.sayac!.toString() ,style:const TextStyle(fontSize: 32),) ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 1,
            onPressed: () {
              _controller.arttir();
            },
            child:const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: 2,
            onPressed: () {
              _controller.azalt();
            },
            child:const Icon(Icons.remove),
          ),
          FloatingActionButton(
            heroTag: 3,
            onPressed: () {
              Get.changeTheme(ThemeData.dark());
            },
            child:const Icon(Icons.change_circle),
          ),
          FloatingActionButton(
            heroTag: 4,
            onPressed: () {
              Get.to( SecondPage());
            },
            child:const Icon(Icons.forward),
          ),
          FloatingActionButton(
            heroTag: 5,
            onPressed: () {
              Get.updateLocale(
                  Get.locale ==const Locale('tr', 'TR')
                      ? const Locale('en', 'US')
                      :const Locale('tr', 'TR')
              );
            },
            child:const Icon(Icons.forward),
          ),
        ],
      ),
    );
  }
}
