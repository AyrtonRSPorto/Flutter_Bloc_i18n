import 'dart:async';

import 'package:bytebank/http/webclients/transaction_webclient.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/screens/transaction/transaction_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionFormCubit extends Cubit<TransactionFormState> {
  TransactionFormCubit() : super(ShowFormState());

  void save(Transaction transactionCreated, String password,
      BuildContext context) async {
    emit(SendingState());
    await _send(
      transactionCreated,
      password,
      context,
    );
  }

  _send(Transaction transactionCreated, String password,
      BuildContext context) async {
    await TransactionWebClient()
        .save(transactionCreated, password)
        .then((transaction) => emit(SentState()))
        .catchError((e) {
      emit(FatalErrorFormState(e.message));
    }, test: (e) => e is HttpException).catchError((e) {
      emit(FatalErrorFormState('timeout submitting the transaction'));
    }, test: (e) => e is TimeoutException).catchError((e) {
      emit(FatalErrorFormState(e.message));
    });
  }
}