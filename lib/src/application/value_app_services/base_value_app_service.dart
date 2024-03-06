import '../../common/types.dart';

abstract class BaseValueAppService<KEY, VALUE> {
  VALUE assembler(Map<String, dynamic> raw);

  FutureResult<VALUE?> find(KEY key) async {
    final response = await findRaw(key);
    return response.when(
      onValue: (raw) {
        final dto = assembler(raw);
        return ResultExt.value(dto);
      },
      onFailure: (f) => ResultExt.failure(f),
    );
  }

  FutureResult<Map<String, dynamic>> findRaw(KEY key);
}
