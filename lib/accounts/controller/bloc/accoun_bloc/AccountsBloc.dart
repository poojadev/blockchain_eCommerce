import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import '../events/AccountsEvents.dart';
import '../repository/AccountRepository.dart';
import '../states/AccountState.dart';


class AccountsBloc
    extends Bloc<AccountsEvents, AccountState> {
  final AccountRepository _accountRepository;
   late  int nodeLength;
   late String nodeId;

  AccountsBloc(this._accountRepository)
      : super(AccountInitialisation()) {
    on<AccountsEvents>((event, emit) async {
      if (event is AccountInit) {


       // UserModel user =
       //  if (user.uid != "uid") {
       //    // String? displayName = await _nodeRepository.retrieveUserName(user);
       //    // emit(NodeSuccess(displayName: displayName));
       //
       //
       //
       //
       //  } else {
       //    emit(NodeFailure());
       //  }
      }


      else
      if (event is UpdateAccountTransaction) {
        print("here's the data : ${event.amount}");
        // await _accountRepository.updateWalletAmount(event.id,event.amount);

      }

    });
  }
}
