import 'package:emergency_call_project/view/home_page.dart';
import 'package:emergency_call_project/view_model/app_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceList extends StatefulWidget {
  const ServiceList({super.key});

  @override
  State<ServiceList> createState() => _ContactListState();
}

class _ContactListState extends State<ServiceList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewmodel, child) {
      return Scaffold(
        appBar: AppBar(
          elevation: 20,
          backgroundColor: Colors.red,
          title: const Text(
            'Contacts List',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.home),
              tooltip: 'Home',
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage()));
              },
            )
          ],
        ),
        body: ListView.builder(
          itemCount: viewmodel.services.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                trailing: Text(
                  viewmodel.services[index].status ?? "State",
                  style: const TextStyle(fontSize: 15),
                ),
                subtitle: Text(viewmodel.services[index].number),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(viewmodel.services[index].name),
                    Text(viewmodel.services[index].service),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
