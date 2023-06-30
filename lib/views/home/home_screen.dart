import 'package:f46/views/home/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/bloc_status.dart';
import '../../../src/app_strings.dart';
import '../../blocs/home/home_bloc.dart';
import '../../blocs/home/home_event.dart';
import '../../blocs/home/home_state.dart';
import '../../repository/home/home_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.appBarText)),
      drawer: const AppDrawer(),
      body: BlocProvider(
        create: (context) => HomeBloc(homeRepo: HomeRepository()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.appStatus == const InitialStatus()) {
              context.read<HomeBloc>().add(HomeGetCardData());
            }

            return state.appStatus is SubmissionLoading
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.black))
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView.builder(
                      itemCount:
                          state.homeCardModel?.data.yogaTypes.length ?? 0,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: [
                              Text(
                                state.homeCardModel?.data.yogaTypes[index]
                                        .name ??
                                    "",
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
          },
        ),
      ),
    );
  }
}
