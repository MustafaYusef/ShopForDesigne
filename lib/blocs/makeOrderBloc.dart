import 'dart:io';

import 'package:Shope_desgine/models/feddResponse.dart';
import 'package:Shope_desgine/models/sendFeedbackBody.dart';
import 'package:Shope_desgine/repastory/repastory.dart';
import 'package:Shope_desgine/ui/custumUi/alertUi.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

abstract class FeedbackEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SendFeedback extends FeedbackEvent {
  SendFeedbackBody body;
  BuildContext context;
  SendFeedback(this.body, {this.context});

  @override
  List<Object> get props => [body, context];
}

abstract class FeedbackState extends Equatable {
  const FeedbackState();

  @override
  List<Object> get props => [];
}

class FeedbackUninitialized extends FeedbackState {}

class SendingFeedback extends FeedbackState {}

class SendingFeedbackError extends FeedbackState {
  final string;
  SendingFeedbackError(this.string);
}

class SendingFeedbackNetworkError extends FeedbackState {}

class FeedbackSendSuccussful extends FeedbackState {
  final FeedResponse response;

  FeedbackSendSuccussful({this.response});

  @override
  List<Object> get props => [response];
}

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  final Repastory Repo;

  FeedbackBloc({@required this.Repo}) : super(FeedbackUninitialized());

  @override
  Stream<FeedbackState> mapEventToState(FeedbackEvent event) async* {
    final currentState = state;
    if (event is SendFeedback) {
      try {
        yield SendingFeedback();

        final allPosts = await Repo.createFeedbck(event.body);

        yield FeedbackSendSuccussful(response: allPosts);
        yield FeedbackUninitialized();
        showAlert(event.context);
        return;
      } on SocketException catch (_) {
        Toast.show("لا يوجد أتصال بالشبكة", event.context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        yield FeedbackUninitialized();
      } catch (_) {
        print(_.toString());
        Toast.show("يوجد مشكلة ما", event.context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        yield FeedbackUninitialized();

        //print("error "+_);
      }
    }
  }
}
