import 'dart:async';

import 'package:bytebank/components/error_view.dart';
import 'package:bytebank/components/progress/progress_view.dart';
import 'package:bytebank/components/response_dialog.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/screens/transaction/transaction_basic_form.dart';
import 'package:bytebank/screens/transaction/transaction_cubit.dart';
import 'package:bytebank/screens/transaction/transaction_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TransactionFormView extends StatelessWidget {
  final Contact _contact;

  TransactionFormView(this._contact);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionFormCubit, TransactionFormState>(
        builder: (context, state) {
      if (state is ShowFormState) {
        return BasicForm(_contact);
      }
      if (state is SendingState || state is SentState) {
        return ProgressView();
      }
      if (state is FatalErrorFormState) {
        return ErrorView(state.message);
      }
      return ErrorView("Unknown error");
    });
  }

  Future _showSuccessfulMessage(
      Transaction transaction, BuildContext context) async {
    if (transaction != null) {
      await showDialog(
          context: context,
          builder: (contextDialog) {
            return SuccessDialog('successful transaction');
          });
      Navigator.pop(context);
    }
  }

  void _showFailureMessage(
    BuildContext context, {
    String message = 'Unknown error',
  }) {
    showDialog(
        context: context,
        builder: (contextDialog) {
          return FailureDialog(message);
        });
  }
}


