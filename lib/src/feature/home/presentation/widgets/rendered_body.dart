part of '../pages/home.dart';

class _RenderedBody extends StatelessWidget {
  final FormModel form;

  final VoidCallback onChanged;
  final List<FormBuildType> listOfForms;
  const _RenderedBody({
    required this.form,
    required this.onChanged,
    required this.listOfForms,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const Gap(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                form.name,
                style: context.theme.textTheme.titleLarge,
              ),
            ],
          ),
          const Gap(16),
          if (listOfForms.isNotEmpty) ...[
            ColumnBuilder(
              itemCount: listOfForms.length,
              itemBuilder: (context, index) => Padding(
                key: ValueKey(listOfForms[index].id),
                padding: const EdgeInsets.all(8.0),
                child: getFormWidget(
                  context: context,
                  item: listOfForms[index],
                  onChanged: onChanged,
                ),
              ),
            ),
          ],
        ],
      );
}

Widget getFormWidget({
  required BuildContext context,
  required FormBuildType item,
  required VoidCallback onChanged,
}) {
  switch (item.type) {
    case FormTypeKeys.text:
      return OutlinedTextfield(
        textController: item.controller,
        isRequired: item.isRequired,
        hintText: item.label,
      );
    case FormTypeKeys.textarea:
      return OutlinedTextfield(
        textController: item.controller,
        isRequired: item.isRequired,
        hintText: item.label,
        maxLines: 5,
      );
    case FormTypeKeys.email:
      return OutlinedTextfield(
        textController: item.controller,
        hintText: item.label,
        isRequired: item.isRequired,
        keyboardType: TextInputType.emailAddress,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\S+@\S+\.\S+')),
        ],
      );
    case FormTypeKeys.password:
      return OutlinedTextfield(
        textController: item.controller,
        isRequired: item.isRequired,
        hintText: item.label,
        obsureText: true,
      );
    case FormTypeKeys.integer:
      return OutlinedTextfield(
        textController: item.controller,
        hintText: item.label,
        isRequired: item.isRequired,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d+')),
        ],
      );
    case FormTypeKeys.decimal:
      return OutlinedTextfield(
        textController: item.controller,
        hintText: item.label,
        isRequired: item.isRequired,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp(r'^\d+\.?\d{0,2}'),
          ),
        ],
      );
    case FormTypeKeys.date:
      return OutlinedTextfield(
        textController: item.controller,
        hintText: item.label,
        isRequired: item.isRequired,
        onTap: () async {
          final date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          );
          if (date != null) {
            item.date = date;
            item.controller.text = DateFormat(
              'dd.MM.yyyy',
            ).format(date);
          }
        },
      );
    case FormTypeKeys.dateTime:
      return OutlinedTextfield(
        textController: item.controller,
        hintText: item.label,
        isRequired: item.isRequired,
        onTap: () async {
          final date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          );
          if (date != null) {
            if (context.mounted) {
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (time != null) {
                item.date = DateTime(
                  date.year,
                  date.month,
                  date.day,
                  time.hour,
                  time.minute,
                );
                item.controller.text = DateFormat("dd.MM.yyyy HH:mm").format(
                  item.date!,
                );
              }
            }
          }
        },
      );
    case FormTypeKeys.boolean:
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item.label),
          Switch(
            key: ValueKey(item.id),
            value: item.controller.text.toLowerCase() == 'true',
            onChanged: (value) {
              item.controller.text = value ? 'true' : 'false';
              onChanged.call();
            },
          ),
        ],
      );
    default:
      return const SizedBox();
  }
}
