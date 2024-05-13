part of '../../select_range_date.dart';

class FooterButtons extends GetWidget<SelectDateController> {
  final Function(DateTime startDate, DateTime endDate) onApplyClick;
  final Function()? onCancelClick;
  final FooterOptions? options;


  const FooterButtons({
    super.key,
    required this.onApplyClick,
    this.onCancelClick,
    this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.size.width * 0.05, vertical: 25.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                onCancelClick?.call();
                Navigator.of(context).pop();
              }, //Cancel
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Color(0xffD2D5DA)),
                backgroundColor: Colors.white,
              ),
              child:  Text(options?.cancelText ?? "Abbrechen",
                style: TextStyle(color: options?.cancelColor ?? Colors.black),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                onApplyClick(controller.fromDate.value, controller.toDate.value);
                Navigator.of(context).pop();
              },
              child: Text(options?.applyText ?? "anwenden",
                style: TextStyle(color: options?.applyColor ?? Colors.white),
              ), //Apply
            ),
          ),
        ],
      ),
    );
  }
}

class FooterOptions {
  String? cancelText;
  String? applyText;
  Color? cancelColor;
  Color? applyColor;

  FooterOptions({
    this.cancelText,
    this.applyText,
    this.cancelColor,
    this.applyColor,
  });
}