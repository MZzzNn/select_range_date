part of '../select_range_date.dart';

class SelectDateController extends GetxController {
  static SelectDateController get to => Get.find();


  final Rx<DateTime> fromDate = DateTime.now().subtract(const Duration(days: 7)).obs;
  final Rx<DateTime> toDate = DateTime.now().obs;

  RxBool isFromExpanded = true.obs;
  RxBool isToExpanded = false.obs;

  // Toggle expansion panel Between From and To dates
  void onExpandableChanged(int index) {
    if (index == 0) {
      isFromExpanded.value = !isFromExpanded.value;
      isToExpanded.value = false;
    } else {
      isToExpanded.value = !isToExpanded.value;
      isFromExpanded.value = false;
    }
  }

  void setFromDate(DateTime date) {
    fromDate.value = date;
  }

  void setToDate(DateTime date) {
    toDate.value = date;
  }

  // maximum date of from don't be greater than to
  DateTime get maxFromDate => toDate.value;

  // minimum date of to don't be less than from
  DateTime get minToDate => fromDate.value;

  // get selected dates
  (DateTime from, DateTime to) get selectedDates =>
      (fromDate.value, toDate.value);

}
