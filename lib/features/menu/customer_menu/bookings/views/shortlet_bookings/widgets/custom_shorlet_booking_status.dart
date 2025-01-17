import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tizela/common/styles/styles.dart';
import 'package:tizela/common/widgets/widgets.dart';
import 'package:tizela/features/menu/customer_menu/bookings/controller/shortlet_bookings_controller.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_booking_status.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_outlined_booking_status_button.dart';
import 'package:tizela/features/menu/customer_menu/bookings/views/widgets/custom_review.dart';
import 'package:tizela/setup/setup.dart';
import 'package:tizela/utils/constants/app_colors.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:tizela/utils/formatters/app_date_formatter.dart';
import '../../../../../../../utils/device/app_functions.dart/app_functions.dart';
import '../../../model/shorlet_booking_receipt.dart';
import '../../../model/shortlet_booking_model.dart';
import '../shorlet_bookings_receipt_view.dart';

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 15,
                    children: [
                      CustomDisplayCost(
                        cost: bookingModel.shortletDetails['shortletPrice']
                            .toString(),
                        perWhat: "per night",
                      ),
                      CustomBookingStatus(
                        statusText: bookingModel.status.name,
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
                        onPressed: () async {
                          File file = await createAndSaveReceipt(bookingModel);
                          AppNagivator.pushRoute(
                            ShorletBookingsReceiptView(
                              receiptFilePath: file.path,
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
                        onTap: () {},
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
    final controller = ShortletBookingsController.instance;
    final receiptModel = ShorletBookingReceipt(
        dateRange: AppFunctions.getDateRange(
          availableDates: [
            DateTime.parse(bookingModel.shortletDetails['startDate']),
            DateTime.parse(bookingModel.shortletDetails['endDate'])
          ],
        ),
        checkIn: AppDateFormater.formatDate(
            useContructor: true,
            date: DateTime.parse(bookingModel.shortletDetails['startDate'])),
        checkOut: AppDateFormater.formatDate(
            useContructor: true,
            date: DateTime.parse(bookingModel.shortletDetails['endDate'])),
        amount: bookingModel.shortletDetails['shortletPrice'],
        cautionAmount: bookingModel.shortletDetails['shortletCautionFee'],
        totalAmount: bookingModel.shortletDetails['shortletPrice'] +
            bookingModel.shortletDetails['shortletCautionFee'],
        name:
            "${bookingModel.bookingUserDetails['firstName']} ${bookingModel.bookingUserDetails['lastName']}",
        email: bookingModel.bookingUserDetails['email'],
        transactionId: bookingModel.transactionDetails['transactionId'],
        status: bookingModel.status);

    final pw.Document pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(16),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.SizedBox(height: 40),
                pw.Container(
                  width: double.infinity,
                  padding: const pw.EdgeInsets.all(13.5),
                  decoration: pw.BoxDecoration(
                    borderRadius: pw.BorderRadius.circular(15),
                  ),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Date"),
                          pw.Text(
                            receiptModel.dateRange,
                          )
                        ],
                      ),
                      pw.SizedBox(height: 10),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Check in"),
                          pw.Text(receiptModel.checkIn)
                        ],
                      ),
                      pw.SizedBox(height: 10),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Check out"),
                          pw.Text(receiptModel.checkOut)
                        ],
                      )
                    ],
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Container(
                  width: double.infinity,
                  padding: const pw.EdgeInsets.all(13.5),
                  decoration: pw.BoxDecoration(
                    borderRadius: pw.BorderRadius.circular(16),
                  ),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text("Amount(${controller.getNumberOfDays(
                              availableDates: [
                                DateTime.parse(
                                    bookingModel.shortletDetails['startDate']),
                                DateTime.parse(
                                    bookingModel.shortletDetails['endDate'])
                              ],
                            )})"),
                            pw.Text("#${receiptModel.amount}")
                          ]),
                      pw.SizedBox(height: 10),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Caution (Refundable)"),
                          pw.Text("#${receiptModel.cautionAmount}")
                        ],
                      ),
                      pw.SizedBox(height: 10),
                      pw.Divider(),
                      pw.SizedBox(height: 10),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Total"),
                          pw.Text("#${receiptModel.totalAmount}"),
                        ],
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Container(
                  padding: const pw.EdgeInsets.all(13.5),
                  width: double.infinity,
                  decoration: pw.BoxDecoration(
                      borderRadius: pw.BorderRadius.circular(16)),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Name"),
                          pw.Text(receiptModel.name),
                        ],
                      ),
                      pw.SizedBox(height: 10),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Email"),
                          pw.Text(receiptModel.email)
                        ],
                      ),
                      pw.SizedBox(height: 10),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Transaction ID"),
                          pw.Text(receiptModel.transactionId)
                        ],
                      ),
                      pw.SizedBox(height: 10),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Status"),
                          pw.Text(receiptModel.status.name),
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
    await receiptFile.writeAsBytes(await pdf.save());

    return receiptFile;
  }
}
