import 'package:flutter/material.dart';
import 'package:tizela/common/widgets/custom_column.dart';

class AppErrorWidget extends StatelessWidget {
  final FlutterErrorDetails errorDetails;
  const AppErrorWidget({super.key, required this.errorDetails});

/* placed in the materialApp
builder: (context, child) {
        ErrorWidget.builder = (errorDetails) {
          return AppErrorWidget(
            errorDetails: errorDetails,
          );
        };

        return child!;
      },
      */
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomColumn(
        children: [
          const Text("An error occured pls try again!"),
          Text(errorDetails.toString())
        ],
      ),
    );
  }
}
