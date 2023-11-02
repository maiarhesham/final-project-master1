import 'package:emergency_call_project/view/bottomsheet/add_service_bottom_sheet_view.dart';
import 'package:emergency_call_project/view_model/app_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var ambulanceNumber = '123';
  var policeNumber = '122';
  var fireNumber = '112';
  var ncHRNumber = '15508';
  var ncWRNumber = '15115';
  var ncMChNumber = '16000';

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viemodel, child) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            actions: [
              IconButton(
                icon: const Icon(Icons.import_contacts_sharp),
                onPressed: () {},
              )
            ],
            title: const Text(
              'Emergency calls',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
          ),
          body: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(5),
              children: [
                InkWell(
                  onTap: () {
                    viemodel.callTheService(ambulanceNumber);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                    ),
                    child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                              image: AssetImage('assets/images/ambulance.png'),
                              height: 70),
                          Text(
                            'ambulance',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ]),
                  ),
                ),
                InkWell(
                  onTap: () {
                    viemodel.callTheService(policeNumber);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.yellow,
                    ),
                    child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: AssetImage('assets/images/police car.png'),
                            height: 90,
                          ),
                          Text(
                            'Police',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )
                        ]),
                  ),
                ),
                InkWell(
                  onTap: () {
                    viemodel.callTheService(fireNumber);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green,
                    ),
                    child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: AssetImage('assets/images/rescue hand.png'),
                            height: 100,
                          ),
                          Text(
                            'Fire',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )
                        ]),
                  ),
                ),
                InkWell(
                  onTap: () {
                    viemodel.callTheService(ncHRNumber);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                    child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image:
                                AssetImage('assets/images/clipart2064029.png'),
                            height: 100,
                          ),
                          Text('Human Rights',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25)),
                        ]),
                  ),
                ),
                InkWell(
                  onTap: () {
                    viemodel.callTheService(ncWRNumber);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.purpleAccent,
                    ),
                    child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image:
                                AssetImage('assets/images/clipart2195539.png'),
                            height: 100,
                          ),
                          Text(
                            'Woman Rights',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )
                        ]),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddServiceView()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueAccent,
                    ),
                    child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.add,
                            size: 100,
                          ),
                          Text('Request Call',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25)),
                        ]),
                  ),
                )
              ]));
    });
  }
}
