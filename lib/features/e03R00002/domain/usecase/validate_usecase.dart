import 'package:account/features/e03R00002/cubit/e03_r00002_state.dart';

class ValidateUsecase {
  bool call(E03R00002State state) {
    return state.filePickerResult != null &&
        state.profileType != null &&
        state.createdAt!.isNotEmpty &&
        state.signatory != null;
  }
}
