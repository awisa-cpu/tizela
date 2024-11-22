import 'package:tizela/features/menu/customer_menu/home/model/more_service_model.dart';

class MoreHouseSectionModel extends MoreServiceModel {
  final String houseSection;
  final int houseSectionCount;
  MoreHouseSectionModel({
    required this.houseSection,
    required this.houseSectionCount,
  }) : super(name: houseSection, count: houseSectionCount);
}
