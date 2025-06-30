import 'mypage_model.dart';

class MyPageController {
  UserProfile getUserProfile() {
    return UserProfile(
      nickname: '무딘',
      email: 'MOODIN@hongik.ac.kr',
      gender: '여자',
      stressTrend: [3, 2, 1, 5, 3.5, 2.5, 2], // 예시 데이터
    );
  }
}
