import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MembershipCheckbox extends StatefulWidget {
  @override
  _MembershipCheckboxState createState() => _MembershipCheckboxState();
}

class _MembershipCheckboxState extends State<MembershipCheckbox> {
  bool chAll = false;
  bool ch1 = false;
  bool ch2 = false;
  bool ch3 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 39.0),
          padding: EdgeInsets.only(left: 42.0, right: 3.0),
          child: Row(
            children: [
              Container(
                child: Checkbox(
                  value: chAll,
                  side: BorderSide(color: Color.fromRGBO(253, 146, 139, 1)),
                  activeColor: Color.fromRGBO(253, 146, 139, 1),
                  onChanged: (val) {
                    setState(() {
                      chAll = val!;
                      ch1 = val;
                      ch2 = val;
                      ch3 = val;
                    });
                  },
                ),
              ),
              Text('전체 약관 동의', style: TextStyle(fontSize: 15)), 
            ],
          ),
        ),
        Container(
          height: 2,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
        ),
        Container(
          margin: EdgeInsets.all(42.0),
          padding: EdgeInsets.only(right: 3.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 21.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: ch1,
                      side: BorderSide(color: Color.fromRGBO(253, 146, 139, 1)),
                      activeColor: Color.fromRGBO(253, 146, 139, 1),
                      onChanged: (val) {
                        setState(() {
                          ch1 = val!;
                        });
                      },
                    ),
                    Text('[필수] 개인정보 수집 및 이용동의', style: TextStyle(fontSize: 15),),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 21.0),
                padding: EdgeInsets.only(right: 3.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: ch2,
                      side: BorderSide(color: Color.fromRGBO(253, 146, 139, 1)),
                      activeColor: Color.fromRGBO(253, 146, 139, 1),
                      onChanged: (val) {
                        setState(() {
                          ch2 = val!;
                        });
                      },
                    ),
                    Text('[필수] 이용약관 동의', style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 3.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: ch3,
                      side: BorderSide(color: Color.fromRGBO(253, 146, 139, 1)),
                      activeColor: Color.fromRGBO(253, 146, 139, 1),
                      onChanged: (val) {
                        setState(() {
                          ch3 = val!;
                        });
                      },
                    ),
                    Text('[선택] 이벤트성 정보 수신 동의'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
