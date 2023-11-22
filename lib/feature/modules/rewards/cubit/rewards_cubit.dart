import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golimo_driver/core/models/awards_responses/awards_response.dart';
import 'package:golimo_driver/core/models/awards_responses/transaction_object.dart';
import 'package:golimo_driver/helpers/network/repository.dart';
import 'package:meta/meta.dart';

part 'rewards_state.dart';

class RewardsCubit extends Cubit<RewardsState> {
  final Repository repository;

  RewardsCubit({required this.repository}) : super(InitialRewardState());

  static RewardsCubit of(context) => BlocProvider.of(context);

  AwardsResponse? awardsResponse;
  TransactionsResponse? transactionsResponse;
  int currentBalance = 0;

  int totalRewards = 0;

  void getAwards() async {
    emit(LoadingGetAwardState());
    final f = await repository.getAwards();
    f.fold((l) {
      emit(ErrorGetAwardState());
    }, (r) {
      awardsResponse = r;
      currentBalance = awardsResponse!.meta.wallet;
      totalRewards = awardsResponse!.meta.totalTransactions;
      emit(SuccessRewardState());
      getTransactions();
    });
  }

  void getTransactions() async {
    emit(LoadingGetTransactionsState());
    final f = await repository.getTransactions();
    f.fold((l) {
      emit(ErrorGetTransactionsState());
    }, (r) {
      transactionsResponse = r;
      emit(SuccessGetTransactionsState());
    });
  }
}
