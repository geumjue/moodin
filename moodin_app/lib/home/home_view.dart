import 'package:flutter/material.dart';
import 'package:moodin_app/measure/measure_view.dart';
import 'package:moodin_app/mypage/mypage_view.dart'; // 마이페이지 뷰 임포트

class HomeView extends StatelessWidget {
  final String username; // "무딘 님"에 해당하는 이름

  const HomeView({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB3E5FC),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                'assets/images/cloud.png', // 구름 배경이 있다면 실제 경로 지정
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // 에러 시 대체 위젯
                  return Container(color: Colors.transparent); // 이미지가 없으면 투명 처리
                },
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '오늘 $username 님의 스트레스 신호를\n확인해 보세요!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF37474F),
                ),
              ),
              const SizedBox(height: 30),
              Image.asset(
                'assets/images/measureicon.png', // 이미지 경로 맞춰줘
                width: 120,
                height: 120,
                errorBuilder: (context, error, stackTrace) {
                  // 에러 시 대체 위젯
                  return const Icon(Icons.error, size: 120, color: Colors.red);
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFECB3),
                  foregroundColor: Colors.black87,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MeasureView(),
                    ),
                  );
                },
                child: const Text(
                  '측정 하러 가기 >',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // '마이페이지' 텍스트를 GestureDetector로 감싸서 클릭 가능하게 만듦
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyPageView()),
                      );
                    },
                    child: const Text(
                      '마이페이지',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text('|',
                      style: TextStyle(fontSize: 14, color: Colors.black45)),
                  const SizedBox(width: 16),
                  // '마인드일지'도 클릭 가능하게 만들려면 동일하게 GestureDetector로 감싸면 됩니다.
                  GestureDetector(
                    onTap: () {
                      // 마인드일지 페이지로 이동하는 로직 추가 (아직 페이지 없으면 빈 함수로 두세요)
                      print('마인드일지 클릭'); // 테스트용 출력
                    },
                    child: const Text(
                      '마인드일지',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
