import 'package:fidan_flutter/language/language_items.dart';
import 'package:flutter/material.dart';

class EserPage extends StatefulWidget {
  const EserPage({Key? key, required String title}) : super(key: key);

  @override
  State<EserPage> createState() => _EserPageState();
}

class _EserPageState extends State<EserPage> {
  late PageController _pageController;
  int _pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: ProjePadding.paddingGeneral,
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: demo_data.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnboardContent(
                    image: demo_data[index].image,
                    title: demo_data[index].title,
                    description: demo_data[index].description,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    demo_data.length,
                    (index) => Padding(
                      padding: ProjePadding.PaddingRight,
                      child: Dotindicator(isActive: index == _pageIndex),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: ProjeSizedBox.sizedBoxHeight60,
                    width: ProjeSizedBox.sizedBoxWith60,
                    child: ButtonElevated(pageController: _pageController),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonElevated extends StatelessWidget {
  const ButtonElevated({
    Key? key,
    required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
      },
      style: ElevatedButton.styleFrom(primary: ProjeColors.redAccent, shape: const CircleBorder()),
      child: const Icon(Icons.arrow_forward),
    );
  }
}

class Dotindicator extends StatelessWidget {
  const Dotindicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: const BoxDecoration(
        color: ProjeColors.redClor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard({required this.image, required this.title, required this.description});
}

// ignore: non_constant_identifier_names
final List<Onboard> demo_data = [
  Onboard(
      image: LanguageItems.cingeneImg, title: LanguageItems.cingeneText, description: LanguageItems.cingeneDescription),
  Onboard(image: LanguageItems.maskeImg, title: LanguageItems.maskeText, description: LanguageItems.maskeDescription),
  Onboard(
      image: LanguageItems.hancerImg, title: LanguageItems.hancerText, description: LanguageItems.hancerDescription),
  Onboard(
      image: LanguageItems.cingeneImg, title: LanguageItems.cingeneText, description: LanguageItems.cingeneDescription),
  Onboard(image: LanguageItems.maskeImg, title: LanguageItems.maskeText, description: LanguageItems.maskeDescription),
  Onboard(
      image: LanguageItems.hancerImg, title: LanguageItems.hancerText, description: LanguageItems.hancerDescription),
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 300,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: ProjeSizedBox.sizedBoxHeight16,
        ),
        Text(description, textAlign: TextAlign.center),
        const Spacer(),
      ],
    );
  }
}

class ProjeSizedBox {
  static double sizedBoxHeight16 = 16;
  static double sizedBoxHeight60 = 60;
  static double sizedBoxWith60 = 60;
}

class ProjePadding {
  static const paddingGeneral = EdgeInsets.all(16.0);
  // ignore: constant_identifier_names
  static const PaddingRight = EdgeInsets.only(right: 4);
}

class ProjeColors {
  static const redClor = Colors.red;

  static const redAccent = Colors.redAccent;
}
