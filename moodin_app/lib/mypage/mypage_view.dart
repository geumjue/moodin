import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'mypage_controller.dart';
import 'mypage_model.dart'; // 모델 이름 반영

class MyPageView extends StatelessWidget {
  const MyPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MyPageController();
    final user = controller.getUserProfile();

    return Scaffold(
      backgroundColor: const Color(0xFFB3E5FC), // 하늘색
      body: Stack(
        children: [
          // 구름 배경
          Positioned.fill(
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                'assets/images/cloud.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 상단 텍스트: "무딘 님"
          Positioned(
            top: 50,
            left: 24,
            child: Text(
              '${user.nickname} 님',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF263238),
              ),
            ),
          ),

          // 하단 흰색 배경
          Positioned.fill(
            top: 120,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 연한 하늘색 프로필 카드
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xE6E9F8FF), // 연한 하늘색
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset('assets/images/star.png', width: 80),
                              Image.asset('assets/images/bunny.png', width: 60),
                            ],
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('닉네임  ${user.nickname}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Text('이메일  ${user.email}',
                                  style: const TextStyle(fontSize: 16)),
                              const SizedBox(height: 4),
                              Text('스펙 및 성별  ${user.gender}',
                                  style: const TextStyle(fontSize: 16)),
                            ],
                          )
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // mood in 텍스트
                    const Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.blue),
                        SizedBox(width: 8),
                        Text('오늘 나의 ', style: TextStyle(fontSize: 16)),
                        Text('mood in',
                            style: TextStyle(fontSize: 16, color: Colors.blue)),
                        Text('은', style: TextStyle(fontSize: 16)),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // 스트레스 추이
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                        children: [
                          const TextSpan(text: '최근 '),
                          TextSpan(
                              text: '${user.nickname} ',
                              style: const TextStyle(color: Colors.lightBlue)),
                          const TextSpan(text: '님의 스트레스 추이'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      height: 160,
                      child: LineChart(
                        LineChartData(
                          lineBarsData: [
                            LineChartBarData(
                              isCurved: true,
                              spots: List.generate(
                                user.stressTrend.length,
                                (i) =>
                                    FlSpot(i.toDouble(), user.stressTrend[i]),
                              ),
                              barWidth: 3,
                              color: Colors.blue,
                              dotData: FlDotData(show: false),
                            )
                          ],
                          gridData: FlGridData(show: false),
                          titlesData: FlTitlesData(show: false),
                          borderData: FlBorderData(
                            show: true,
                            border: Border.all(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
