import 'package:equatable/equatable.dart';
import 'package:huynd2_assignment/domain/tv_show/entity/tv_show_entity.dart';
import 'package:huynd2_assignment/manager/enum/status_enum.dart';

class TvshowState extends Equatable {
  final Status? status;
  final String? errorMessage;
  final List<TVShowEntity>? tvShowList;

  const TvshowState({
    this.status = Status.initial,
    this.errorMessage = '',
    this.tvShowList = const [],
  });

  TvshowState copyWith({
    Status? status,
    String? errorMessage,
    List<TVShowEntity>? tvShowList,
  }) {
    return TvshowState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      tvShowList: tvShowList ?? this.tvShowList,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, tvShowList];
}
