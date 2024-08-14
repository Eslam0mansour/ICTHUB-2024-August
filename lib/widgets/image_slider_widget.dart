import 'package:flutter/material.dart';
import 'package:new_8/data/data_source/slider_data_source.dart';
import 'package:new_8/screens/number_screen.dart';

class ImageSliderWidget extends StatefulWidget {
  const ImageSliderWidget({super.key});

  @override
  State<ImageSliderWidget> createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 250,
          height: 300,
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.red,
            image: DecorationImage(
              image: AssetImage(
                'assets/img_${SliderDataSource.index}.png',
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Colors.green,
              width: 2,
            ),
          ),
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.black.withOpacity(0.5),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Number ${SliderDataSource.index}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    if (SliderDataSource.index > 1) {
                      SliderDataSource.index--;
                    } else {
                      SliderDataSource.index = 4;
                    }
                  });
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Colors.white,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NumberScreen(
                        path: 'assets/img_${SliderDataSource.index}.png',
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (SliderDataSource.index < 4) {
                      SliderDataSource.index++;
                    } else {
                      SliderDataSource.index = 1;
                    }
                  });
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.white,
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
