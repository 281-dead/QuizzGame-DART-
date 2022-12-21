import 'package:ailatrieuphu/models/Question_models.dart';
import 'LinhVucModels.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DbConnect {
  //khai báo bảng muốn tạo và add json
  final url1 = Uri.parse('https://quizzapp-503b2-default-rtdb.firebaseio.com/question.json');
  final url2 = Uri.parse('https://quizzapp-503b2-default-rtdb.firebaseio.com/linhvuc.json');

  final url3 = Uri.parse('https://quizzapp-503b2-default-rtdb.firebaseio.com/vanhoa.json');
  final url4 = Uri.parse('https://quizzapp-503b2-default-rtdb.firebaseio.com/khoahoc.json');
  final url5 = Uri.parse('https://quizzapp-503b2-default-rtdb.firebaseio.com/thethao.json');
  // //post question linh vuc lich su -dia ly
  Future<void> addQuestion(Question question) async {
    http.post(
      url1,
      body: json.encode({
        'title': question.title,
        'options': question.options,
      }),
    );
  }

  //vh-xh-nt
  Future<void> addQuestionvanhoa(Question question) async {
    http.post(
      url3,
      body: json.encode({
        'title': question.title,
        'options': question.options,
      }),
    );
  }

  //khoa hoc
  Future<void> addQuestionkhoahoc(Question question) async {
    http.post(
      url4,
      body: json.encode({
        'title': question.title,
        'options': question.options,
      }),
    );
  }

  //The thao
  Future<void> addQuestionthethao(Question question) async {
    http.post(
      url5,
      body: json.encode({
        'title': question.title,
        'options': question.options,
      }),
    );
  }

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

  //Lấy lich su
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

  //fetch linh vuc
  // Future<void> fetchLinhVuc() async {
  //   http.get(url2).then((response) {
  //     var data = json.decode(response.body);
  //     print(data);
  //   });
  // }

  //fetch question vh-xh-nt
  Future<List<Question>> fetchQuestionvanhoa() async {
    return http.get(url3).then((response) {
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

  //fetch question khoa học
  Future<List<Question>> fetchQuestionkhoahoc() async {
    return http.get(url4).then((response) {
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

  //fetch question thể thao
  Future<List<Question>> fetchQuestionthethao() async {
    return http.get(url5).then((response) {
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
}
