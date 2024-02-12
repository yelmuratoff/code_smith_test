part of '../home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String name = "Home";
  static const String routePath = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final ModelHomePage _model;

  @override
  void initState() {
    _model = createModel(context, () => ModelHomePage());
    _model.tabController = TabController(
      length: 2,
      vsync: this,
    );

    provideOnce<HomeBloc>(context).add(const HomeEvent.refresh());

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _model.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        floatingActionButton: FloatingActionButton.extended(
          elevation: 1,
          onPressed: () {
            _model.listOfFormBuild.clear();
            provideOnce<HomeBloc>(context).add(const HomeEvent.refresh());
          },
          label: Text(
            context.l10n.refresh,
            style: context.theme.textTheme.bodyMedium?.copyWith(
              color: context.colors.text,
            ),
          ),
          icon: Icon(Icons.refresh_rounded, color: context.colors.text),
          backgroundColor: context.theme.colorScheme.primaryContainer,
        ),
        body: SafeArea(
          bottom: false,
          child: ExtendedNestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'CodeSmith',
                      style: context.theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.theme.colorScheme.onBackground,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton.filledTonal(
                          icon: const Icon(Icons.settings_rounded),
                          onPressed: () {
                            context.pushNamed(SettingsPage.name);
                          },
                          splashRadius: 8,
                        ),
                        IconButton.filledTonal(
                          icon: const Icon(Icons.monitor_heart),
                          onPressed: () {
                            context.pushNamed(
                              TalkerPage.name,
                              extra: {
                                TalkerPage.paramTalker: talker,
                                TalkerPage.paramTheme: TalkerScreenTheme(
                                  backgroundColor:
                                      context.theme.colorScheme.background,
                                  textColor: context.colors.text,
                                  cardColor: context.colors.card,
                                ),
                              },
                            );
                          },
                          splashRadius: 8,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
            body: Column(
              children: [
                TabBar(
                  controller: _model.tabController,
                  splashBorderRadius: BorderRadius.circular(8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  tabs: [
                    Tab(
                      text: context.l10n.raw,
                    ),
                    Tab(
                      text: context.l10n.rendered,
                    ),
                  ],
                ),
                Flexible(
                  child: BlocConsumer<HomeBloc, HomeState>(
                    listener: (context, state) => state.maybeMap(
                      fetched: (state) {
                        _model.listOfFormBuild.clear();
                        for (final field in state.forms.fields) {
                          _model.listOfFormBuild.add(
                            getFormBuildType(field),
                          );
                        }
                        return null;
                      },
                      orElse: () => null,
                    ),
                    builder: (context, state) => state.maybeMap(
                      fetched: (state) => TabBarView(
                        controller: _model.tabController,
                        children: [
                          _RawBody(
                            jsonData: jsonEncode(state.data),
                            scrollController: _model.rawScrollController,
                          ),
                          _RenderedBody(
                            form: state.forms,
                            onChanged: () {
                              setState(() {});
                            },
                            listOfForms: _model.listOfFormBuild,
                          ),
                        ],
                      ),
                      failure: (state) => FailureBody(
                        message: state.cause.toString(),
                      ),
                      loading: (value) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      orElse: () => const SizedBox(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  // void _addToFormList(FormItemModel field) {
  //   final formBuildType = getFormBuildType(field);

  //   final formMap = {
  //     FormTypeKeys.text: _model.formDataBuilder.textForms,
  //     FormTypeKeys.textarea: _model.formDataBuilder.textAreaForms,
  //     FormTypeKeys.email: _model.formDataBuilder.emailForms,
  //     FormTypeKeys.password: _model.formDataBuilder.passwordForms,
  //     FormTypeKeys.integer: _model.formDataBuilder.integerForms,
  //     FormTypeKeys.decimal: _model.formDataBuilder.decimalForms,
  //     FormTypeKeys.date: _model.formDataBuilder.dateForms,
  //     FormTypeKeys.dateTime: _model.formDataBuilder.dateTimeForms,
  //     FormTypeKeys.boolean: _model.formDataBuilder.booleanForms,
  //   };

  //   formMap[field.type]?.add(formBuildType);
  // }
}

FormBuildType getFormBuildType(FormItemModel field) {
  final controller = TextEditingController();
  return FormBuildType(
    id: field.id,
    controller: controller,
    type: field.type,
    label: field.label,
    isRequired: field.isRequired,
  );
}
