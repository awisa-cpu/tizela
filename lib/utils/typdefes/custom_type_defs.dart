import 'package:flutter/material.dart';

typedef ItemBuilder = Widget Function(BuildContext context, int index);

typedef OnValueChanged = void Function(String?);

typedef OnChanged = void Function(dynamic);
