part of '../select_range_date.dart';

class SelectDateFromTo extends StatefulWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  final Function(DateTime startDate, DateTime endDate) onApplyClick;
  final Function()? onCancelClick;
  final HeaderOptions? headerOptions;
  final FooterOptions? footerOptions;
  final ExpansionPanelOptions? expansionOptions;

  const SelectDateFromTo({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.onApplyClick,
    this.onCancelClick,
    this.headerOptions,
    this.footerOptions,
    this.expansionOptions,
  });

  static show({
    DateTime? startDate,
    DateTime? endDate,
    required Function(DateTime startDate, DateTime endDate) onApplyClick,
    Function()? onCancelClick,
  }) {
    showCupertinoModalBottomSheet(
      context: Get.context!,
      backgroundColor: Colors.transparent,
      useRootNavigator: true,
      elevation: 3,
      builder: (context) => SelectDateFromTo(
        startDate: startDate,
        endDate: endDate,
        onApplyClick: onApplyClick,
        onCancelClick: onCancelClick,
      ),
    );
  }

  @override
  State<SelectDateFromTo> createState() => _SelectDateFromToState();
}

class _SelectDateFromToState extends State<SelectDateFromTo> {
  late final SelectDateController controller;

  @override
  void initState() {
    controller = Get.put(SelectDateController());
    controller.setFromDate(
        widget.startDate ?? DateTime.now().subtract(const Duration(days: 7)));
    controller.setToDate(widget.endDate ?? DateTime.now());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<SelectDateController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _InfoHeader(widget.headerOptions),
          const SizedBox(height: 15),
          DateFromAndTo(widget.expansionOptions),
          FooterButtons(
            onApplyClick: widget.onApplyClick,
            onCancelClick: widget.onCancelClick,
            options: widget.footerOptions,
          ),
        ],
      ),
    );
  }
}
