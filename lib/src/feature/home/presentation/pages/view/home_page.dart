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
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _model.dispose();
  }

  final dartMap = {
    "id": 24,
    "name": "Manthan Khandale",
    "score": 7.6,
    "socials": null,
    "hobbies": [
      "Music",
      "Filmmaking",
      "Music",
      "Filmmaking",
      "Music",
      "Filmmaking",
      "Music",
      "Filmmaking",
      "Music",
      "Filmmaking",
      "Music",
      "Filmmaking",
      "Music",
      "Filmmaking",
      "Music",
      "Filmmaking",
      "Music",
      "Filmmaking",
      "Music",
      "Filmmaking",
      "Music",
      "Filmmaking",
      "Music",
      "Filmmaking",
      "Music",
      "Filmmaking",
      "Music",
      "Filmmaking",
      "Music",
      "Filmmaking",
      "Music",
    ],
    "isFlutterCool": true,
  };

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.theme.colorScheme.background,
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
                  child: TabBarView(
                    controller: _model.tabController,
                    children: [
                      _RawBody(
                        jsonData: jsonEncode(dartMap),
                        scrollController: _model.rawScrollController,
                      ),
                      const _RenderedBody(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
