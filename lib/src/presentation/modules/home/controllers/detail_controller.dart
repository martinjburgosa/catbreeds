import 'package:get/get.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../application/dtos/cat_breed_info_dto.dart';
import '../../../config/route/routes.dart';

part 'detail_controller.g.dart';

@Riverpod(keepAlive: true)
class DetailController extends _$DetailController {
  @override
  CatBreedInfoDto? build() {
    return null;
  }

  void setCatInfoToDetailView(CatBreedInfoDto catInfo) {
    state = catInfo;
    Get.toNamed(Routes.detail.value);
  }
}
