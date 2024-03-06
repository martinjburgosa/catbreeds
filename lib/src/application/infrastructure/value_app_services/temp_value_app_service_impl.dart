import '../../../../src/common/types.dart';
import '../../dtos/temp_dto.dart';
import '../../value_app_services/temp_value_app_service.dart';
import '../gui_assemblers/temp_assembler.dart';

class TempValueAppServiceImpl extends TempValueAppService {
  TempValueAppServiceImpl({
    required TempAssembler tempAssembler,
  }) : _tempAssembler = tempAssembler;

  final TempAssembler _tempAssembler;

  @override
  FutureResult<Map<String, dynamic>> findRaw(String key) async {
    final result = ResultExt.value({});
    return result.when(
      onFailure: (f) => ResultExt.failure(f),
      onValue: (dto) => ResultExt.value(dto!.toJson()),
    );
  }

  @override
  TempDto assembler(Map<String, dynamic> raw) =>
      _tempAssembler.writeTempDsDtoToTempDto();
}
