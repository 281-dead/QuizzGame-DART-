import 'package:ailatrieuphu/models/Question_models.dart';
import 'LinhVucModels.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DbConnect {
  //khai báo bảng muốn tạo và add json
  final url1 = Uri.parse('https://quizzapp-503b2-default-rtdb.firebaseio.com/question.json');
  final url2 = Uri.parse('https://quizzapp-503b2-default-rtdb.firebaseio.com/linhvuc.json');
  // //post data
  // Future<void> addQuestion(Question question) async {
  //   http.post(
  //     url1,
  //     body: json.encode({
  //       'title': question.title,
  //       'options': question.options,
  //     }),
  //   );
  // }
  //post linh vuc
  Future<void> addLinhVuc(LinhVucModels linhvuc) async {
    http.post(
      url2,
      body: json.encode({
        'name': linhvuc.name,
        'trangthai': linhvuc.trangThai,
      }),
    );
  }

  //Lấy data về
  Future<List<Question>> fetchQuestion() async {
    return http.get(url1).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Question> lsQuestion = [];
      data.forEach((key, value) {
        var newQuestion = Question(
          id: key,
          title: value['title'],
          options: Map.castFrom(
            value['options'],
          ),
        );
        lsQuestion.add(newQuestion);
        //add new question
      });
      return lsQuestion;
    });
  }

  Future<void> fetchLinhVuc() async {
    http.get(url2).then((response) {
      var data = json.decode(response.body);
      print(data);
    });
  }
}
