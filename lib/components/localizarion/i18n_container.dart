import 'package:bytebank/components/container.dart';
import 'package:bytebank/components/localizarion/i18n_cubit.dart';
import 'package:bytebank/components/localizarion/i18n_loading_view.dart';
import 'package:bytebank/http/webclients/i18n_web_client.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class I18NLoadingContainer extends BlocContainer{
  I18NWidgetCreator creator;
  String viewKey;

  I18NLoadingContainer({
    @required String viewKey,
    @required I18NWidgetCreator creator
  }){
    this.creator = creator;
    this.viewKey = viewKey;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<I18NMessagesCubit>(
      create: (BuildContext context){
        final cubit = I18NMessagesCubit(this.viewKey);
        cubit.reload(I18NWebClient(this.viewKey));
        return cubit;
      },
      child: I18NLoadingView(this.creator),
    );
  }
}