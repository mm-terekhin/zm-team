import 'package:flutter/material.dart';

class InfoBox extends StatefulWidget {
  const InfoBox({super.key});

  @override
  State<InfoBox> createState() => _InfoBoxState();
}

class _InfoBoxState extends State<InfoBox> {
  var _currentPage = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(
      initialPage: _currentPage,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints.tightFor(height: 400),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            16,
          ),
        ),
        color: const Color(0xFF378699).withValues(
          alpha: 0.21,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                IntrinsicWidth(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Benefit',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 2,
                        color: _currentPage == 0 ? Colors.white : Colors.transparent,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                IntrinsicWidth(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Reproduction',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 2,
                        color: _currentPage == 1 ? Colors.white : Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Colors.white,
              height: 1,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 150,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
              controller: _controller,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Health benefits',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'It is rich in omega-3 fatty acids, which strengthen the heart and blood vessels.  It contains protein, vitamin D, selenium  and antioxidants.',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reproduction',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'It spawns in fresh water. After spawning, adults often die, and juveniles migrate to the ocean for further growth.',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == 0
                            ? Colors.white
                            : const Color(0xFF26495B),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == 1
                            ? Colors.white
                            : const Color(0xFF26495B),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Color(0xFF26495B),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          if (_currentPage > 0) {
                            setState(() {
                              _controller.animateToPage(
                                _currentPage - 1,
                                duration: const Duration(
                                  milliseconds: 200,
                                ),
                                curve: Curves.linear,
                              );
                            });
                          }
                        });
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Color(0xFF26495B),
                        ),
                      ),
                      onPressed: () {
                        if (_currentPage < 1) {
                          setState(() {
                            _controller.animateToPage(
                              _currentPage + 1,
                              duration: const Duration(
                                milliseconds: 200,
                              ),
                              curve: Curves.linear,
                            );
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
