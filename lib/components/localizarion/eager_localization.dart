import 'package:bytebank/components/localizarion/locale.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewI18N {
  String _language;

  ViewI18N(BuildContext context){
    this._language = BlocProvider.of<CurrentLocaleCubit>(context).state;
  }

  localize(Map<String, String> values){
    assert(values != null);
    assert(values.containsKey(_language));
    // O padrao é mostrar em ingles ao inves de quebrar a aplicação

    return values[_language];
  }
}