import 'package:emergency_call_project/model/service_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppViewModel extends ChangeNotifier {
  List<ServiceModel> services = [];

  void addService(ServiceModel newService) {
    services.add(newService);
    notifyListeners();
  }

  void removeService(String serviceIndex) {
    services.removeAt(serviceIndex as int);
    notifyListeners();
  }

  void callTheService(String number) async {
    final call = Uri.parse('tel:  $number');

    await launchUrl(call);
  }
}
