import 'package:equatable/equatable.dart';

import '../../repository/home/model/home_card_model.dart';
import '../bloc_status.dart';

class HomeState extends Equatable {
  final HomeCardModel? homeCardModel;
  final AppSubmissionStatus appStatus;

  const HomeState({
    this.homeCardModel,
    this.appStatus = const InitialStatus(),
  });

  HomeState copyWith({
    HomeCardModel? homeCardModel,
    AppSubmissionStatus? appStatus,
  }) {
    return HomeState(
      homeCardModel: homeCardModel ?? this.homeCardModel,
      appStatus: appStatus ?? this.appStatus,
    );
  }

  @override
  List<Object?> get props => [homeCardModel, appStatus];
}
