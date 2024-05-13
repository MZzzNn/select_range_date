part of '../../select_range_date.dart';

class _InfoHeader extends StatelessWidget {
  final HeaderOptions? options;

  const _InfoHeader(this.options);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: Get.size.width * 0.05, vertical: 25.0),
      decoration: BoxDecoration(
        borderRadius: options?.borderRadius ??
            const BorderRadius.only(bottomRight: Radius.circular(40)),
        color: options?.backgroundColor,
        gradient: options?.gradient ??
            const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color(0xFF34B5ED),
                Color(0xFF34B5ED),
                Color(0xFF0089ED),
              ],
            ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            options?.title ?? 'Datum auswählen',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.close,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderOptions {
  String? title;
  Gradient? gradient;
  Color? backgroundColor;
  BorderRadiusGeometry? borderRadius;

  HeaderOptions({
    this.title,
    this.gradient,
    this.backgroundColor,
    this.borderRadius,
  });
}
