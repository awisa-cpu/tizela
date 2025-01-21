import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_status.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_outlined_booking_status_button.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_review.dart';
import 'package:tizela/setup/setup.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:tizela/utils/extensions/string_extension.dart';
import 'package:tizela/utils/formatters/app_date_formatter.dart';
import '../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../../../../../utils/formatters/number_formatters.dart';
import '../../../model/shorlet_booking_receipt.dart';
import '../../../model/shortlet_booking_model.dart';
import '../../bookings_receipt_view.dart';

class CustomShorletBookingStatus extends StatelessWidget {
  final ShortletBookingModel bookingModel;
  final Color statusColor;
  final bool isActive, isCompleted, isCancelled;
  const CustomShorletBookingStatus({
    super.key,
    required this.bookingModel,
    required this.statusColor,
    required this.isActive,
    required this.isCompleted,
    required this.isCancelled,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedEdgedContainer(
      paddingNumber: 15,
      borderRadius: 12,
      child: CustomColumn(
        children: [
          //first section
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //date
              Text(
                AppDateFormater.formatDate(
                    date: bookingModel.bookingDateCreated),
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
            spacing: 10,
            children: [
              //image
              CustomDisplayClipImageWithSize(
                imageUrl:
                    bookingModel.shortletDetails['shortletImage'] as String,
                isNetworkImage: true,
              ),
              CustomColumn(
                spacing: 5,
                children: [
                  //name
                  Text(
                    bookingModel.shortletDetails['shortletName'] as String,
                    style: customTextStyle(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  Text(
                    AppFunctions.getDateRange(availableDates: <DateTime>[
                      DateTime.parse(bookingModel.shortletDetails['startDate']),
                      DateTime.parse(bookingModel.shortletDetails['endDate'])
                    ]),
                    style: customTextStyle(
                        fontSize: 12,
                        color: AppColors.appTextFadedColor,
                        fontWeight: FontWeight.w300),
                  ),

                  //cost and status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    spacing: 6,
                    children: [
                      CustomDisplayCost(
                        cost: bookingModel.shortletDetails['shortletPrice']
                            .toString(),
                        perWhat: "per night",
                      ),
                      CustomBookingStatus(
                        statusText: bookingModel.status.name.toProperCase(),
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
                                  createAndSaveReceipt(bookingModel),
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

          if (isCompleted)
            CustomColumn(
              children: [
                const CustomHeight(height: 10),
                const CustomDivider(),
                const CustomHeight(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: CustomOutlinedBookingStatusButton(
                        onTap: () {
                          AppNagivator.pushRoute(
                            BookingsReceiptView(
                              pdfFutureOperation: createAndSaveReceipt(
                                bookingModel,
                              ),
                            ),
                          );
                        },
                        buttonText: "View E-Receipt",
                      ),
                    ),
                    const SizedBox(
                      width: 25,
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

  Future<File> createAndSaveReceipt(ShortletBookingModel bookingModel) async {
    final receiptModel = ShorletBookingReceipt(
      dateRange: AppFunctions.getDateRange(
        availableDates: [
          DateTime.parse(bookingModel.shortletDetails['startDate']),
          DateTime.parse(bookingModel.shortletDetails['endDate'])
        ],
      ),
      checkIn: AppDateFormater.formatDate(
          format: 'MMMM dd, yyyy',
          date: DateTime.parse(bookingModel.shortletDetails['startDate'])),
      checkOut: AppDateFormater.formatDate(
          format: 'MMMM dd, yyyy',
          date: DateTime.parse(bookingModel.shortletDetails['endDate'])),
      amount: bookingModel.shortletDetails['shortletPrice'],
      cautionAmount: bookingModel.shortletDetails['shortletCautionFee'],
      totalAmount: bookingModel.transactionDetails["amount"],
      name:
          "${bookingModel.bookingUserDetails['firstName']} ${bookingModel.bookingUserDetails['lastName']}",
      email: bookingModel.bookingUserDetails['email'],
      transactionId: bookingModel.transactionDetails['transactionId'],
      status: bookingModel.status,
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
                            receiptModel.dateRange,
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          )
                        ],
                      ),
                      pw.SizedBox(height: 10),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Check in"),
                          pw.Text(
                            receiptModel.checkIn,
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          )
                        ],
                      ),
                      pw.SizedBox(height: 10),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Check out"),
                          pw.Text(
                            receiptModel.checkOut,
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
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
                            "Amount (${DateTime.parse(bookingModel.shortletDetails['endDate']).difference(DateTime.parse(bookingModel.shortletDetails['startDate'])).inDays} days)",
                          ),
                          pw.Text(
                            AppNumberFormater.formatCurrency(
                                amount: receiptModel.amount),
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          )
                        ],
                      ),
                      pw.SizedBox(height: 10),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Caution (Refundable)"),
                          pw.Text(
                            AppNumberFormater.formatCurrency(
                                amount: receiptModel.cautionAmount),
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
                                amount: receiptModel.totalAmount),
                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
                            receiptModel.name,
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
                            receiptModel.email,
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
                            receiptModel.transactionId,
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
                              receiptModel.status.name.toProperCase(),
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

    final Directory directory = await getTemporaryDirectory();
    final File receiptFile = File("${directory.path}/e_receipt.pdf");
    final pdfBytesFile = await pdf.save();
    await receiptFile.writeAsBytes(pdfBytesFile);

    return receiptFile;
  }
}
