import 'package:account/features/e03R00002/cubit/e03_r00002_cubit.dart';
import 'package:account/features/e03R00002/cubit/e03_r00002_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValidateUsecase {
  bool call(E03R00002State state) {
    return state.filePickerResult != null &&
        state.profileType != null &&
        state.createdAt != null &&
        state.signatory != null;
  }
}
