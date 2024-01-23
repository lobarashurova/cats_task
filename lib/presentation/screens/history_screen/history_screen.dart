import 'package:cats_task/presentation/screens/history_screen/bloc/history_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final bloc = HistoryScreenBloc();

  @override
  void initState() {
    bloc.add(LoadHistoryData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<HistoryScreenBloc, HistoryScreenState>(
        builder: (context, state) {
          print("list state:");
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueAccent,
              title: const Text("History",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              centerTitle: true,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      itemCount: state.list?.length ?? 0,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return historyItem(context, state, index);
                      })
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container historyItem(BuildContext context, HistoryScreenState state, int index) {
    return Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueAccent.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Column(
                            children: [
                              Text(
                                " ${state.list?[index].data ?? ""}",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15, color: Colors.black54),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Creation date:\n${state.list?[index].creationDate ?? ""}",
                                    style: GoogleFonts.abyssinicaSil(
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "Added date:\n${state.list?[index].updatedTime ?? ""}",
                                    style: GoogleFonts.abyssinicaSil(
                                        color: Colors.black),
                                  ),
                                ],
                              )
                            ],
                          ));
  }
}
