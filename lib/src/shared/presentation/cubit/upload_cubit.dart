import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum UploadStatus { init, uploading, success, fail }

class UploadCubit extends Cubit<UploadState> {
  FirebaseStorage storage;
  UploadCubit(this.storage) : super(UploadState());

  void uploadUserProfileImage(File file, String uid) {
    emit(state.copyWith(status: UploadStatus.uploading));
    final ref = storage.ref();
    var uploadTask = ref.child('$uid/profile.jpg').putFile(file);

    uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) async {
      switch (snapshot.state) {
        case TaskState.paused:
          break;
        case TaskState.running:
          final progress =
              100 * snapshot.bytesTransferred / snapshot.totalBytes;
          emit(state.copyWith(progress: progress));
          break;
        case TaskState.success:
          final downloadUrl = await snapshot.ref.getDownloadURL();
          emit(
            state.copyWith(
              status: UploadStatus.success,
              downloadUrl: downloadUrl,
            ),
          );
          break;
        case TaskState.canceled:
          break;
        case TaskState.error:
          break;
      }
    });
  }
}

class UploadState extends Equatable {
  final UploadStatus status;
  final double? progress;
  final String? downloadUrl;
  const UploadState({
    this.status = UploadStatus.init,
    this.progress = 0,
    this.downloadUrl,
  });

  UploadState copyWith({
    UploadStatus? status,
    double? progress,
    String? downloadUrl,
  }) {
    return UploadState(
      status: status ?? this.status,
      progress: progress ?? this.progress,
      downloadUrl: downloadUrl ?? this.downloadUrl,
    );
  }

  @override
  List<Object?> get props => [status, progress, downloadUrl];
}
