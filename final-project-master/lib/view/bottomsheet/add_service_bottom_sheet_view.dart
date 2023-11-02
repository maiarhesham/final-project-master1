import 'package:emergency_call_project/model/service_model.dart';
import 'package:emergency_call_project/view/service_list.dart';
import 'package:emergency_call_project/view_model/app_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddServiceView extends StatefulWidget {
  const AddServiceView({super.key});
  @override
  State<AddServiceView> createState() => _AddServiceBottomSheetViewState();
}

class _AddServiceBottomSheetViewState extends State<AddServiceView> {
  String selectedService = 'Choose Service Here';
  final formkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewmodel, child) {
      return Scaffold(
          body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  value: selectedService,
                  items: [
                    'Choose Service Here',
                    'Ambulance',
                    'Police',
                    'Fire',
                    'Human Rights',
                    'Woman Rights',
                  ]
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 185, 14, 1)),
                            ),
                          ))
                      .toList(),
                  iconSize: 40,
                  isExpanded: true,
                  onChanged: (val) {
                    setState(() {
                      selectedService = val.toString();
                    });
                  },
                  validator: (value) {
                    if (value == 'Choose Service Here') {
                      return "Choose service , please";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "enter your name please";
                        }
                        return null;
                      },
                      controller: nameController,
                      decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: const TextStyle(fontSize: 20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          contentPadding: const EdgeInsets.all(12),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(
                                  width: 1, style: BorderStyle.none))))),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "enter your number";
                    }
                    return null;
                  },
                  controller: numberController,
                  decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: const TextStyle(fontSize: 20),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      contentPadding: const EdgeInsets.all(12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                              width: 3, style: BorderStyle.none))),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Address',
                          labelStyle: const TextStyle(fontSize: 20),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(
                                  width: 1, style: BorderStyle.none))))),
              const SizedBox(height: 30),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 48, vertical: 12)),
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      ServiceModel serviceModel = ServiceModel(
                          service: selectedService,
                          name: nameController.text,
                          number: numberController.text,
                          status: "Status");
                      viewmodel.addService(serviceModel);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ServiceList()));
                      selectedService = 'Choose Service Here';
                      nameController.clear();
                      numberController.clear();
                    }
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  )),
            ],
          ),
        ),
      ));
    });
  }
}
