import 'package:flutter/material.dart';
import 'package:tizela/common/styles/custom_text_style.dart';

class AppStreamLoaders {
  //
  static Widget? checkSingleStreamState<T>({
    required AsyncSnapshot<T> snapshot,
    Widget? loaderWidget,
    Widget? nothingFoundWidget,
    Widget? errorWidget,
  }) {
//check when operation is waiting
    if (snapshot.connectionState == ConnectionState.waiting) {
      if (loaderWidget != null) return loaderWidget;
      return const CircularProgressIndicator();
    }

    //check for data availability
    if (!snapshot.hasData) {
      if (nothingFoundWidget != null) return nothingFoundWidget;

      return Center(
        child: Text(
          "No Data Found",
          style: customTextStyle(),
        ),
      );
    }

    //check for error
    if (snapshot.hasError) {
      if (errorWidget != null) return errorWidget;

      return Center(
        child: Text(
          "An error occured",
          style: customTextStyle(),
        ),
      );
    }

    return null;
  }

  static Widget? checkMultiStreamState<T>({
    required AsyncSnapshot<List<T>> snapshot,
    Widget? loaderWidget,
    Widget? nothingFoundWidget,
    Widget? errorWidget,
  }) {
//check when operation is waiting
    if (snapshot.connectionState == ConnectionState.waiting) {
      if (loaderWidget != null) return loaderWidget;
      return const CircularProgressIndicator();
    }

    //check for data availability
    if (!snapshot.hasData || snapshot.data!.isEmpty) {
      if (nothingFoundWidget != null) return nothingFoundWidget;

      return Center(
        child: Text(
          "No Data Found",
          style: customTextStyle(),
        ),
      );
    }

    //check for error
    if (snapshot.hasError) {
      if (errorWidget != null) return errorWidget;

      return Center(
        child: Text(
          "An error occured",
          style: customTextStyle(),
        ),
      );
    }

    return null;
  }
}
