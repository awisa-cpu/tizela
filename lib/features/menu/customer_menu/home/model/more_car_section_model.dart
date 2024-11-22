import 'package:tizela/features/menu/customer_menu/home/model/more_service_model.dart';

class MoreCarSectionModel extends MoreServiceModel {
  final String carName;
  final int sectionCount;
  MoreCarSectionModel({
    required this.carName,
    required this.sectionCount,
  }) : super(name: carName, count: sectionCount);
}
