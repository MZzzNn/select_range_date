part of '../../select_range_date.dart';

ExpansionPanel customExpansionPanel({
  required ValueChanged<DateTime> onDateTimeChanged,
  required String title,
  required String leadingLabel,
  required bool isExpanded,
  DateTime? initialDateTime,
  DateTime? maximumDate,
  DateTime? minimumDate,
  ExpansionPanelOptions? expansionOptions,
}) {
  return ExpansionPanel(
    backgroundColor: Get.theme.scaffoldBackgroundColor,
    canTapOnHeader: true,
    headerBuilder: (BuildContext context, bool isExpanded) {
      return ListTile(
        visualDensity: VisualDensity.compact,
        contentPadding:  EdgeInsets.symmetric(horizontal: Get.size.width * 0.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minLeadingWidth: 0,
        title: Text(
          title,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: const Color(0xff454F63), fontWeight: FontWeight.w500),
        ),
        leading: Container(
          width: 40,
          height: 35,
          decoration: BoxDecoration(
            color: expansionOptions?.backgroundColor,
            gradient: expansionOptions?.gradient ??
                const LinearGradient(
                  colors: [Color(0xFF34B5ED), Color(0xFF0077E5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              leadingLabel,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ),
      );
    },
    body: SizedBox(
      height: 200,
      child: CupertinoTheme(
        data: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            dateTimePickerTextStyle: Get.textTheme.displaySmall!
                .copyWith(color: const Color(0xff454F63), fontWeight: FontWeight.w500),
          ),
        ),
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          backgroundColor: Get.theme.scaffoldBackgroundColor,
          dateOrder: DatePickerDateOrder.dmy,
          initialDateTime: initialDateTime ?? DateTime.now(),
          maximumDate: maximumDate,
          minimumDate: minimumDate,
          showDayOfWeek: false,
          onDateTimeChanged: onDateTimeChanged,
        ),
      ),
    ),
    isExpanded: isExpanded,
  );
}
