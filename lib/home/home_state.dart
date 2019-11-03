import 'package:equatable/equatable.dart';
import 'package:flutter_devfest/home/session.dart';
import 'package:flutter_devfest/home/speaker.dart';
import 'package:flutter_devfest/home/sponsor.dart';
import 'package:flutter_devfest/home/team.dart';
import 'package:flutter_devfest/home/track.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeState extends Equatable {
  HomeState([Iterable props]) : super(props);

  /// Copy object for use in action
  HomeState getStateCopy();
}

/// UnInitialized
class UnHomeState extends HomeState {
  @override
  String toString() => 'UnHomeState';

  @override
  HomeState getStateCopy() {
    return UnHomeState();
  }
}

/// Initialized
class InHomeState extends HomeState {
  final SpeakersData speakersData;
  final SessionsData sessionsData;
  final TeamsData teamsData;
  final SponsorsData sponsorsData;

  InHomeState({
    @required this.speakersData,
    @required this.sessionsData,
    @required this.teamsData,
    @required this.sponsorsData,
  }) : super([speakersData, sessionsData, teamsData, sponsorsData]);

  @override
  String toString() => 'InHomeState';

  @override
  HomeState getStateCopy() {
    return InHomeState(
      speakersData: this.speakersData,
      sessionsData: this.sessionsData,
      teamsData: this.teamsData,
      sponsorsData: this.sponsorsData,
    );
  }
}

class ErrorHomeState extends HomeState {
  final String errorMessage;

  ErrorHomeState(this.errorMessage);

  @override
  String toString() => 'ErrorHomeState';

  @override
  HomeState getStateCopy() {
    return ErrorHomeState(this.errorMessage);
  }
}
