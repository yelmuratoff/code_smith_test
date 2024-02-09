part of '../pages/home.dart';

class _RawBody extends StatelessWidget {
  final String jsonData;
  final ScrollController scrollController;
  const _RawBody({
    required this.jsonData,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        key: const PageStorageKey<String>('Raw'),
        physics: AppPhysics.appPhysics(context),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ColoredJson(
                data: jsonData,
                curlyBracketColor: context.colors.text,
                squareBracketColor: context.colors.text,
              ),
            ],
          ),
        ),
      );
}
