part of '../../select_range_date.dart';

class DateFromAndTo extends StatefulWidget {
  final ExpansionPanelOptions? expansionOptions;

  const DateFromAndTo(this.expansionOptions, {Key? key}) : super(key: key);

  @override
  State<DateFromAndTo> createState() => _DateFromAndToState();
}

class _DateFromAndToState extends State<DateFromAndTo> {
  final SelectDateController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          controller.onExpandableChanged(index);
        },
        children: [
          customExpansionPanel(
            onDateTimeChanged: (date) {
              controller.setFromDate(date);
            },
            title: controller.fromDate.toString().formatDate(context),
            leadingLabel: widget.expansionOptions?.fromLabel ?? "Von",
            isExpanded: controller.isFromExpanded.value,
            initialDateTime: controller.fromDate.value,
            maximumDate: controller.maxFromDate,
          ),
          customExpansionPanel(
            onDateTimeChanged: (date) {
              controller.setToDate(date);
            },
            title: controller.toDate.toString().formatDate(context),
            leadingLabel: widget.expansionOptions?.toLabel ?? "Bis",
            isExpanded: controller.isToExpanded.value,
            initialDateTime: controller.toDate.value,
            minimumDate: controller.minToDate,
          ),
        ],
      );
    });
  }
}

class ExpansionPanelOptions {
  String? fromLabel;
  String? toLabel;
  Gradient? gradient;
  Color? backgroundColor;
  ExpansionPanelOptions({
    this.fromLabel,
    this.toLabel,
    this.gradient,
    this.backgroundColor,
  });
}
