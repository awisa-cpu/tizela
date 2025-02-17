import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/data/repositories/user_repo/app_user_repository.dart';
import 'package:tizela/features/menu/customer_menu/bookings/model/car_rental_booking_model.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_status.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_review.dart';
import 'package:tizela/features/menu/customer_menu/home/views/widgets/custom_icon_and_text.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:tizela/utils/extensions/string_extension.dart';
import 'package:tizela/utils/formatters/app_date_formatter.dart';
import '../../../../../../../setup/app_navigator.dart';
import '../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../../../../utils/formatters/number_formatters.dart';
import '../../../../../host_menu/listings/model/car_rental_details_model.dart';
import '../../../model/car_rental_booking_receipt.dart';
import '../../bookings_receipt_view.dart';
import '../../widgets/custom_outlined_booking_status_button.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

class CustomCarRentalBookingStatus extends StatelessWidget {
  final CarRentalBookingModel bookingCarRental;
  final Color statusColor;
  final bool isActive, isComplete, isCancelled;
  const CustomCarRentalBookingStatus({
    super.key,
    required this.statusColor,
    required this.isActive,
    required this.isComplete,
    required this.isCancelled,
    required this.bookingCarRental,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedEdgedContainer(
      paddingNumber: 15,
      borderRadius: 12,
      child: CustomColumn(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //date
              Text(
                AppDateFormater.formatDate(
                    date: bookingCarRental.bookingDateCreated),
                style: customTextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: AppColors.appTextFadedColor),
              )
            ],
          ),

          const CustomHeight(height: 5),

          //
          Row(
            children: [
              //image
              CustomDisplayClipImageWithSize(
                imageUrl: bookingCarRental.carRentalDetails["carImage"],
                isNetworkImage: true,
              ),
              const CustomWidth(width: 10),
              CustomColumn(
                spacing: 5,
                children: [
                  //name
                  Text(
                    bookingCarRental.carRentalDetails['carName'],
                    style: customTextStyle(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    spacing: 7,
                    children: [
                      ...bookingCarRental.carRentalDetails['carRentalDetails']
                          .map(
                        (a) {
                          final atribute = CarRentalDetailsModel.fromJson(
                              a as Map<String, dynamic>);
                          return CustomIconAndText(
                            text: atribute.detailCount.value.toString(),
                            iconImage: AppFunctions.getIconImageByAttributeName(
                                atribute.name),
                            color: AppColors.appIconColorBox,
                            textStyle: customTextStyle(
                              fontSize: 14,
                              color: AppColors.appTextFadedColor,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  //cost and status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomDisplayCost(
                        cost: AppNumberFormater.formatCurrency(
                            amount: bookingCarRental
                                .carRentalDetails['carPrice'] as double),
                        perWhat: "12hr",
                      ),
                      const CustomWidth(width: 15),
                      CustomBookingStatus(
                        statusText: bookingCarRental.status.name,
                        textAndBorderColor: statusColor,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),

          //actions
          if (isActive)
            CustomColumn(
              children: [
                const CustomHeight(height: 10),
                const CustomDivider(),
                const CustomHeight(height: 10),
                Row(
                  spacing: 25,
                  children: [
                    Expanded(
                      child: CustomOutlinedBookingStatusButton(
                        onTap: () {},
                        buttonText: "Details",
                      ),
                    ),
                    Expanded(
                      child: CustomEleButton(
                        onPressed: () {
                          AppNagivator.pushRoute(
                            BookingsReceiptView(
                              pdfFutureOperation:
                                  pdfFileOperation(bookingCarRental),
                            ),
                          );
                        },
                        text: "View E-Receipt",
                      ),
                    ),
                  ],
                ),
              ],
            ),

          if (isComplete)
            CustomColumn(
              children: [
                const CustomHeight(height: 10),
                const CustomDivider(),
                const CustomHeight(height: 10),
                Row(
                  spacing: 25,
                  children: [
                    Expanded(
                      child: CustomOutlinedBookingStatusButton(
                        onTap: () {},
                        buttonText: "View E-Receipt",
                      ),
                    ),
                    Expanded(
                      child: CustomEleButton(
                        onPressed: () => AppFunctions.displayReviewSheet(
                          context: context,
                          child: const CustomReview(),
                        ),
                        text: "Leave a review",
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }

  Future<File> pdfFileOperation(CarRentalBookingModel carRentalBooking) async {
    final user = await AppUserRepository.instance.fetchUserDetails(
      uid: carRentalBooking.userId,
    );
    final carRentalBookingReceipt = CarRentalBookingReceipt(
      date: AppDateFormater.formatDate(
        format: 'MMM dd, yyyy',
        date: carRentalBooking.bookingDateCreated,
      ),
      pickUp: '',
      dropOff: '',
      duration: carRentalBooking.carRentalDetails['duration'],
      amount: carRentalBooking.carRentalDetails['carPrice'],
      serviceFeeAmount: 0.0,
      totalAmount: carRentalBooking.transactionDetails['amount'],
      name: user.userFullName,
      email: user.emailAddress,
      transactionId: carRentalBooking.transactionDetails['transactionId'],
      status: carRentalBooking.status,
    );
    final pw.Document pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(10),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                //firstsection
                pw.Padding(
                  padding:
                      const pw.EdgeInsets.only(top: 40, left: 10, right: 10),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Date"),
                          pw.Text(
                            carRentalBookingReceipt.date,
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          )
                        ],
                      ),
                      pw.SizedBox(height: 10),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Pickup"),
                          pw.Text(
                            carRentalBookingReceipt.pickUp,
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          )
                        ],
                      ),
                      pw.SizedBox(height: 10),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Drop-off"),
                          pw.Text(
                            carRentalBookingReceipt.dropOff,
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),

                //secondsection
                pw.Padding(
                  padding:
                      const pw.EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            "Duration (${carRentalBookingReceipt.duration})",
                          ),
                          pw.Text(
                            AppNumberFormater.formatCurrency(
                              amount: carRentalBookingReceipt.amount,
                            ),
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          )
                        ],
                      ),
                      pw.SizedBox(height: 10),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Service fee"),
                          pw.Text(
                            AppNumberFormater.formatCurrency(
                              amount: carRentalBookingReceipt.serviceFeeAmount,
                            ),
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          )
                        ],
                      ),
                      pw.SizedBox(height: 10),
                      pw.Divider(),
                      pw.SizedBox(height: 10),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Total"),
                          pw.Text(
                            AppNumberFormater.formatCurrency(
                              amount: carRentalBookingReceipt.totalAmount,
                            ),
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //thirdsection
                pw.Padding(
                  padding:
                      const pw.EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Name"),
                          pw.Text(
                            carRentalBookingReceipt.name,
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          ),
                        ],
                      ),
                      pw.SizedBox(height: 10),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Email"),
                          pw.Text(
                            carRentalBookingReceipt.email,
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          )
                        ],
                      ),
                      pw.SizedBox(height: 10),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Transaction ID"),
                          pw.Text(
                            carRentalBookingReceipt.transactionId,
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          )
                        ],
                      ),
                      pw.SizedBox(height: 10),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Status"),
                          pw.Container(
                            height: 30,
                            width: 50,
                            alignment: pw.Alignment.center,
                            decoration: pw.BoxDecoration(
                                color: PdfColors.white,
                                borderRadius: pw.BorderRadius.circular(10),
                                border: pw.Border.all(color: PdfColors.blue)),
                            child: pw.Text(
                              carRentalBookingReceipt.status.name
                                  .toProperCase(),
                              style: const pw.TextStyle(
                                color: PdfColors.blue,
                              ),
                            ),
                          )
                        ],
                      ),
                      pw.SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    //get a temp directory
    final Directory tempDir = await getTemporaryDirectory();
    //create a file
    final File pdfFile = File("${tempDir.path}/e_receipt.pdf");
    //save the pdf
    final pdfBytes = await pdf.save();
    //write the pdf to the file
    await pdfFile.writeAsBytes(pdfBytes);
    //return the file
    return pdfFile;
  }
}
