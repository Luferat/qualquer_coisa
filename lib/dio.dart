import 'package:dio/dio.dart';

final dio = Dio(); // Instância global ou injetada

Future<void> buscarUsuario() async {
  try {
    // No Dio, você passa a String direto, ele cuida do Uri.parse
    final response = await dio.get('http://localhost:3000/users/');

    // O 'data' já vem como um Map, sem necessidade de jsonDecode
    print(response.data[1]["email"]);
  } on DioException catch (e) {
    // O Dio tem um sistema de erro específico e muito detalhado
    print('Erro: ${e.response?.statusCode}');
  }
}

void main() {
  buscarUsuario();
}