import '../../../datasource/dio_context_datasource_factory.dart';
import '../../../datasource/cat_api/common/cat_api_dio_factory.dart';

class CatApiContextDatasourceFactory extends DioContextDatasourceFactory {
  CatApiContextDatasourceFactory()
      : super(
            dioFactory: CatApiDioFactory(host: 'https://api.thecatapi.com/v1'));
}
