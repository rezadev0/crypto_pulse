import 'package:cypto_pulse/bloc/home/home_bloc.dart';
import 'package:cypto_pulse/bloc/home/home_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchCoin extends StatelessWidget {
  const SearchCoin({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 16.w, right: 20.w, left: 20.w),
        child: SizedBox(
          height: 56.w,
          width: 335.w,
          child: TextField(
            controller: textController,
            onSubmitted: (value) {
              BlocProvider.of<HomeBloc>(context)
                  .add(HomeSearchEvent(query: textController.text));
            },
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                size: 30,
              ),
              prefixIconColor: const Color(0xff747E98),
              hintText: 'Search coin here',
              hintStyle: const TextStyle(
                color: Color(0xff747E98),
              ),
              filled: true,
              fillColor: const Color(0xFFF2F2F6),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFFF2F2F6),
                  width: 1,
                ),
              ),
              focusColor: Colors.black12,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFFF2F2F6),
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
