part of '../pages/home.dart';

class _RenderedBody extends StatelessWidget {
  final FormModel form;
  final FormDataBuilder formDataBuilder;
  final VoidCallback onChanged;
  const _RenderedBody({
    required this.form,
    required this.formDataBuilder,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          if (formDataBuilder.textForms.isNotEmpty) ...[
            ColumnBuilder(
              itemCount: formDataBuilder.textForms.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                child: OutlinedTextfield(
                  textController: formDataBuilder.textForms[index].controller,
                  hintText: formDataBuilder.textForms[index].label +
                      ((formDataBuilder.textForms[index].isRequired)
                          ? " *"
                          : ""),
                ),
              ),
            ),
          ],
          if (formDataBuilder.textAreaForms.isNotEmpty) ...[
            ColumnBuilder(
              itemCount: formDataBuilder.textAreaForms.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                child: OutlinedTextfield(
                  textController:
                      formDataBuilder.textAreaForms[index].controller,
                  hintText: formDataBuilder.textAreaForms[index].label +
                      ((formDataBuilder.textAreaForms[index].isRequired)
                          ? " *"
                          : ""),
                  maxLines: 5,
                ),
              ),
            ),
          ],
          if (formDataBuilder.emailForms.isNotEmpty) ...[
            ColumnBuilder(
              itemCount: formDataBuilder.emailForms.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                child: OutlinedTextfield(
                  textController: formDataBuilder.emailForms[index].controller,
                  hintText: formDataBuilder.emailForms[index].label +
                      ((formDataBuilder.emailForms[index].isRequired)
                          ? " *"
                          : ""),
                  keyboardType: TextInputType.emailAddress,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\S+@\S+\.\S+')),
                  ],
                ),
              ),
            ),
          ],
          if (formDataBuilder.passwordForms.isNotEmpty) ...[
            ColumnBuilder(
              itemCount: formDataBuilder.passwordForms.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                child: OutlinedTextfield(
                  textController:
                      formDataBuilder.passwordForms[index].controller,
                  hintText: formDataBuilder.passwordForms[index].label +
                      ((formDataBuilder.passwordForms[index].isRequired)
                          ? " *"
                          : ""),
                  obsureText: true,
                ),
              ),
            ),
          ],
          if (formDataBuilder.integerForms.isNotEmpty) ...[
            ColumnBuilder(
              itemCount: formDataBuilder.integerForms.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                child: OutlinedTextfield(
                  textController:
                      formDataBuilder.integerForms[index].controller,
                  hintText: formDataBuilder.integerForms[index].label +
                      ((formDataBuilder.integerForms[index].isRequired)
                          ? " *"
                          : ""),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+')),
                  ],
                ),
              ),
            ),
          ],
          if (formDataBuilder.decimalForms.isNotEmpty) ...[
            ColumnBuilder(
              itemCount: formDataBuilder.decimalForms.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                child: OutlinedTextfield(
                  textController:
                      formDataBuilder.decimalForms[index].controller,
                  hintText: formDataBuilder.decimalForms[index].label +
                      ((formDataBuilder.decimalForms[index].isRequired)
                          ? " *"
                          : ""),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'^\d+\.?\d{0,2}'),
                    ),
                  ],
                ),
              ),
            ),
          ],
          if (formDataBuilder.dateForms.isNotEmpty) ...[
            ColumnBuilder(
              itemCount: formDataBuilder.dateForms.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                child: OutlinedTextfield(
                  textController: formDataBuilder.dateForms[index].controller,
                  hintText: formDataBuilder.dateForms[index].label +
                      ((formDataBuilder.dateForms[index].isRequired)
                          ? " *"
                          : ""),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    if (date != null) {
                      formDataBuilder.dateForms[index].date = date;
                      formDataBuilder.dateForms[index].controller.text =
                          DateFormat(
                        'dd.MM.yyyy',
                      ).format(date);
                    }
                  },
                ),
              ),
            ),
          ],
          if (formDataBuilder.dateTimeForms.isNotEmpty) ...[
            ColumnBuilder(
              itemCount: formDataBuilder.dateTimeForms.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                child: OutlinedTextfield(
                  textController:
                      formDataBuilder.dateTimeForms[index].controller,
                  hintText: formDataBuilder.dateTimeForms[index].label +
                      ((formDataBuilder.dateTimeForms[index].isRequired)
                          ? " *"
                          : ""),
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
                          formDataBuilder.dateTimeForms[index].date = DateTime(
                            date.year,
                            date.month,
                            date.day,
                            time.hour,
                            time.minute,
                          );
                          formDataBuilder.dateTimeForms[index].controller.text =
                              DateFormat("dd.MM.yyyy HH:mm").format(
                            formDataBuilder.dateTimeForms[index].date!,
                          );
                        }
                      }
                    }
                  },
                ),
              ),
            ),
          ],
          if (formDataBuilder.booleanForms.isNotEmpty) ...[
            ColumnBuilder(
              itemCount: formDataBuilder.booleanForms.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formDataBuilder.booleanForms[index].label),
                    Switch(
                      value: formDataBuilder.booleanForms[index].controller.text
                              .toLowerCase() ==
                          'true',
                      onChanged: (value) {
                        formDataBuilder.booleanForms[index].controller.text =
                            value.toString();
                        onChanged();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      );
}
