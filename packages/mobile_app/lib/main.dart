import 'index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final singleProvider = SingleProvider();
  singleProvider.show = ProphecyToShowStorageFlutter();
  singleProvider.predictions = PredictionsFlutterMobile();
  singleProvider.authBloc = AuthenticationBloc(
      auth: AuthFlutter(repository: UsersRepositoryFlutter()))
    ..add(AppStarted());
  singleProvider.appPreferences = AppPreferences();
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(AsyncActions(singleProvider));
}

/// It is needed for async actions durin the app start
/// that are not covered by BLoCs
/// for example, initialize some APIs from network or load misc files
class AsyncActions extends StatefulWidget {
  final SingleProvider singleProvider;
  AsyncActions(this.singleProvider);
  @override
  _AsyncActionsState createState() => _AsyncActionsState();
}

class _AsyncActionsState extends State<AsyncActions> {
  SingleProvider get sp => widget.singleProvider;

  /// list of async actions
  loadAppPreferences() async =>
      sp.appPreferences = await sp.appPreferences.read();
  //
  @override
  void initState() {
    /// calls of async actions
    loadAppPreferences();
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) => appBuilder(widget.singleProvider);
}

Widget appBuilder(SingleProvider singleProvider) => Provider<SingleProvider>(
      create: (_) => singleProvider,
      child: imageBackground(
        asset: "assets/background.jpg",
        //

        child: myProphet(
          authResolver: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            //
            bloc: singleProvider.authBloc,
            builder: (context, state) {
              //

              if (state is Authenticated) {
                singleProvider.usersRepo =
                    singleProvider.authBloc.auth.repository;
                singleProvider.pollsRepo = PollsRepositoryFlutter();

                singleProvider.prophecyBloc = ProphecyBloc(
                  algo: Algorithm(
                    dat: AlgoData(
                      pollByDateRepo: singleProvider.pollsRepo,
                      usersRepository: singleProvider.usersRepo,
                    ),
                  ),
                );

                singleProvider.userPollBloc = UserPollBloc(
                  users: singleProvider.usersRepo,
                  repo: singleProvider.pollsRepo,
                );

                return DailyScreen();

                //
              } else if (state is Unauthenticated)
                return RegistrationScreen();
              else {
                return LoadingScreen();
              }
            },
          ),
        ),
      ),
    );
