import 'package:flutter/material.dart';

import 'main.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360,
          height: 640,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 360,
                  height: 640,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/360x640"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 32,
                top: 347,
                child: SizedBox(
                  width: 296,
                  child: Text(
                    '책잼, 독서의 새로운 차원!\n독서모임을 만들고, 함께 책을 읽는 사람들과 소통해보세요. \n감상 공유, 독서 후기 작성, 다양한 독서 모임 참여 등 다채로운 기능을 경험해보세요. \n책을 사랑하는 이들을 위한 독서 플랫폼, 지금 책잼에서 독서의 재미를 더해보세요!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Noto Sans KR',
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.24,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 169,
                top: 534,
                child: Text(
                  '또는',
                  style: TextStyle(
                    color: Color(0xFF656565),
                    fontSize: 12,
                    fontFamily: 'Noto Sans KR',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                left: 143,
                top: 65,
                child: Text(
                  '책잼',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontFamily: 'Noto Sans KR',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                left: 136,
                top: 121,
                child: Text(
                  'Chaekjam',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Noto Sans KR',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                left: 32,
                top: 554,
                child: Container(
                  width: 296,
                  height: 48,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 41,
                        top: 0,
                        child: Container(
                          width: 215,
                          height: 48,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 16,
                        child: SizedBox(
                          width: 296,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '계정이 없으신가요? ',
                                  style: TextStyle(
                                    color: Color(0xFF4E4E4E),
                                    fontSize: 12,
                                    fontFamily: 'Noto Sans KR',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: '가입하기',
                                  style: TextStyle(
                                    color: Color(0xFF007BED),
                                    fontSize: 12,
                                    fontFamily: 'Noto Sans KR',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 73,
                top: 483,
                child: ElevatedButton(
                  child: Container(
                    width: 215,
                    height: 48,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 215,
                            height: 48,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFEE500),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 64,
                          top: 14,
                          child: Text(
                            '카카오톡으로  로그인',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF4E4E4E),
                              fontSize: 14,
                              fontFamily: 'Noto Sans KR',
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.28,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => PlatformAdaptingHomePage()),
                    );
                    // Perform Kakao login here
                  },
                ),
              ),
              Positioned(
                left: 94,
                top: 497,
                child: Container(
                  width: 23,
                  height: 23,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 23,
                          height: 17.81,
                          decoration: ShapeDecoration(
                            color: Color(0xFF181600),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}