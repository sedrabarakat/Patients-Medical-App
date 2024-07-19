import 'dart:async';
import 'package:flutter/material.dart';
import 'package:patient_app/src/features/home/presentation/widgets/featured_doctor.dart';
import 'package:patient_app/src/features/home/data/model/doctor.dart';

class AutoScrollPageView extends StatefulWidget {
  final List<Doctor> doctors;

  const AutoScrollPageView({super.key, required this.doctors});

  @override
  AutoScrollPageViewState createState() => AutoScrollPageViewState();
}

class AutoScrollPageViewState extends State<AutoScrollPageView> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;
  bool _isForward = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      setState(() {
        if (_isForward) {
          if (_currentPage < widget.doctors.length - 1) {
            _currentPage++;
          } else {
            _isForward = false;
            _currentPage--;
          }
        } else {
          if (_currentPage > 0) {
            _currentPage--;
          } else {
            _isForward = true;
            _currentPage++;
          }
        }

        if (_pageController.hasClients) {
          _pageController.animateToPage(
            _currentPage,
            duration: const Duration(seconds: 3),
            curve: Curves.easeInOut,
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.doctors.length,
        itemBuilder: (BuildContext context, int index) {
          return FeaturedDoctor(doctor: widget.doctors[index]);
        },
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
      ),
    );
  }
}
