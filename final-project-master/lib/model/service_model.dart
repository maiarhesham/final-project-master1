class ServiceModel {
  final String service;
  final String name;
  final String number;
  final String? status;
  ServiceModel(
      {required this.service,
      required this.name,
      required this.number,
      this.status});
}
