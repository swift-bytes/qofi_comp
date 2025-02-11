part of 'package:qofi_comp/qofi_comp.dart';

class _AuthTextField extends StatelessWidget {
  _AuthTextField({required this.e});
  final Map e;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    InputBorder outlineInputBorder = e['border'] == "none"
        ? const OutlineInputBorder(borderSide: BorderSide.none)
        : OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.sp),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
            ),
          );
    if (e["type"] == "phone") {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (false) ...[
            Container(
              width: 30.w,
              padding: EdgeInsets.all(0.5.w),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12.sp),
                border: Border.all(color: const Color(0xffE5E5E5), width: 2),
              ),
              child: CountryCodePicker(
                padding: EdgeInsets.zero,
                dialogSize: Size(90.w, 80.h),
                initialSelection: e['initialSelection'] ?? 'PK',
                boxDecoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xffD6D6D6), width: 2),
                ),
                onChanged: (value) {
                  e['onChanged']?.call({
                    "country_code": value.dialCode,
                  });
                },
                dialogBackgroundColor:
                    Theme.of(context).scaffoldBackgroundColor,
                textStyle: TextStyle(
                    color: Theme.of(context).canvasColor,
                    fontSize: 14.ft,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              width: 2.w,
            )
          ],
          Expanded(
            child: _AuthTextField(e: {
              ...e,
              "type": "number",
              "onChanged": (value) {
                e['onChanged']?.call({
                  "number": value,
                });
              },
              "controller": e['controller'],
            }),
          ),
        ],
      );
    } else if (e['type'] == "dropdown") {
      return DropdownButtonFormField(
        icon: SvgPicture.asset("assets/svgs/arrow-down.svg",
            color: Theme.of(context).dividerColor),
        isDense: true,
        dropdownColor: Theme.of(context).cardColor,
        elevation: 0,
        validator: e['validator'],
        decoration: InputDecoration(
          errorMaxLines: 2,
          prefixIconConstraints: BoxConstraints(maxHeight: 0, maxWidth: 0),
          suffixIconConstraints: BoxConstraints(maxHeight: 0, maxWidth: 0),
          errorText: e['error']?.toString().trs(context),
          hintText: e['hint']?.toString().trs(context),
          errorStyle: TextStyle(
              color: Theme.of(context).colorScheme.error,
              fontSize: 13.ft,
              fontWeight: FontWeight.w500),
          hintStyle: TextStyle(
              color: Theme.of(context).canvasColor,
              fontSize: 14.ft,
              fontWeight: FontWeight.w500),
          filled: e['filled'] ?? true,
          isDense: true,
          isCollapsed: true,
          fillColor: Theme.of(context).cardColor,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.7.h),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.sp),
            borderSide: const BorderSide(
              color: Color(0xffD6D6D6),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.sp),
            borderSide: const BorderSide(
              color: Color(0xffD6D6D6),
            ),
          ),
          errorBorder: outlineInputBorder,
          focusedErrorBorder: outlineInputBorder,
        ),
        value: e['value'],
        items: List.from(e['items'].map<DropdownMenuItem>((value) {
          return DropdownMenuItem(
            value: "${value['id']}",
            child: Text("${value['name']}",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).canvasColor,
                )),
          );
        })),
        padding: EdgeInsets.zero,
        onChanged: (val) {
          e['onChanged']?.call(val);
        },
      );
    }
    return TextFormField(
      controller: e['controller'],
      style: TextStyle(
          color: Theme.of(context).canvasColor,
          fontSize: 14.ft,
          fontWeight: e['fontWeight']),
      onChanged: (value) {
        e['onChanged']?.call(value);
      },
      maxLines: e['maxLines'] ?? 1,
      inputFormatters: e['inputFormatters'],
      obscureText: e['obscure'] ?? false,
      keyboardType: e['keyboardType'],
      obscuringCharacter: "*",
      onTap: e['onTap'],
      readOnly: e['readOnly'] ?? false,
      autovalidateMode: AutovalidateMode.onUnfocus,
      validator: e['validator'] ??
          (val) {
            if (e['required'] == true && (val?.isEmpty ?? true)) {
              return "This field is required";
            }
            return null;
          },
      decoration: InputDecoration(
        errorMaxLines: 2,
        errorText: e['error']?.toString().trs(context),
        hintText: e['hint']?.toString().trs(context),
        errorStyle: TextStyle(
            color: Theme.of(context).colorScheme.error,
            fontSize: 13.ft,
            fontWeight: FontWeight.w500),
        hintStyle: TextStyle(
            color: HexColor("878787"),
            fontSize: 14.ft,
            fontWeight: e['fontWeight'] ?? FontWeight.w500),
        filled: e['filled'] ?? true,
        prefixIcon: e["prefix"] == null
            ? null
            : e["prefix"] is String
                ? SvgPicture.asset(
                    e["prefix"],
                    width: 5.5.w,
                    height: 5.5.w,
                  )
                : e["prefix"],
        suffixIcon: e["suffix"] == null
            ? null
            : e['suffix'] is Widget
                ? e['suffix']
                : TextButton(
                    onPressed: e['onSuffixPressed'],
                    style: iconButtonStyle,
                    child: SvgPicture.asset(
                      e["suffix"],
                      width: 5.5.w,
                      height: 5.5.w,
                    ),
                  ),
        isDense: true,
        fillColor: Theme.of(context).cardColor,
        prefixIconConstraints: BoxConstraints(
          minWidth: 12.w,
          minHeight: 0,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.7.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.sp),
          borderSide: const BorderSide(
            color: Color(0xffD6D6D6),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.sp),
          borderSide: const BorderSide(
            color: Color(0xffD6D6D6),
          ),
        ),
        errorBorder: outlineInputBorder,
        focusedErrorBorder: outlineInputBorder,
      ),
    );
  }
}
