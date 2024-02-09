# CodeSmith test project

Test project for CodeSmith company

## Initialization

### Initialization Steps

Here are the steps to initialize the dependencies. It is a map of steps, where the key is the name of the step and the value is a function that fills the `initialization_progress` model. The steps are executed in the order in which they are specified in the map, which gives you the ability to access the results of the previous steps.

### Initialization Progress

In `dependencies` you can store the results of the steps. There is mutable a model that is passed to each step and then immutable one is returned to the `InitializationProcessor` which maps it to the immutable model.

### Initialization Processor

`InitializationProcessor` as said previously is controlling all the stuff. It is responsible for running the steps, storing the result of each and mapping it to the immutable model. It returns `InitializationResult` with spent time, immutable progress model, etc. Later, all the results are delivered by inherited widgets and can be accessed from BuildContext, see `dependencies_scope` which is in the widget folder.

### Dependencies Scope

`DependenciesScope` is inherited widget that provides access to `Dependendencies`. It is a great DI in a flutter way which gives you a possibility to access your initialized dependencies from context which exists in each widget.

### How to add a new dependency

**This section describes how to add a new dependency to your app.** Please, check the [initialization](#initialization) section before.

1. Open `lib/src/feature/initialization/model/dependencies.dart`
2. Add new dependency to `DependenciesMutable` and `DependenciesImmutable`
3. Go to `lib/src/feature/initialization/logic/initialization_steps.dart`
4. Add new entry to the map and write down all the logic needed to initialize your dependency and set it in the `DependenciesMutable` object
5. Now, you can use the dependency in the app receiving it from context.

### How do add flavors correctly:
You can use template from `very_good_cli``.