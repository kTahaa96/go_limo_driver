part of 'rewards_cubit.dart';

@immutable
abstract class RewardsState {}

class InitialRewardState extends RewardsState {}

class LoadingGetAwardState extends RewardsState {}

class ErrorGetAwardState extends RewardsState {}

class SuccessRewardState extends RewardsState {}

class LoadingGetTransactionsState extends RewardsState {}

class ErrorGetTransactionsState extends RewardsState {}

class SuccessGetTransactionsState extends RewardsState {}
