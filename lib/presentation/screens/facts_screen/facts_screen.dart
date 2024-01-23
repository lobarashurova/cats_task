import 'package:cached_network_image/cached_network_image.dart';
import 'package:cats_task/data/model/enum/Status.dart';
import 'package:cats_task/presentation/screens/facts_screen/bloc/fact_screen_bloc.dart';
import 'package:cats_task/presentation/screens/history_screen/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FactScreen extends StatefulWidget {
  const FactScreen({super.key});

  @override
  State<FactScreen> createState() => _FactScreenState();
}

class _FactScreenState extends State<FactScreen> {
  final bloc = FactScreenBloc();
  var imageUri = "";

  @override
  void initState() {
    bloc.add(LoadCatsData());
    imageUri = "https://cataas.com/cat";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<FactScreenBloc, FactScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          DateTime dateTime =
              state.catsModel?.firstOrNull?.createdAt ?? DateTime.now();
          String formattedDate = DateFormat.yMd().add_Hm().format(dateTime);
          return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.blueAccent,
                title: const Text("Facts",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                centerTitle: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)))),
            body: SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(
                  height: size.height / 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: CachedNetworkImage(
                      imageUrl: imageUri,
                      height: size.height / 3,
                      fit: BoxFit.fill,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                            LinearProgressIndicator(
                              value: downloadProgress.progress,
                              color: Colors.blueAccent,
                            )

                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                state.status == TaskStatus.SUCCESS
                    ? Text(
                        state.catsModel?.first.text ?? "",
                        style:  GoogleFonts.acme(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      )
                    : const CircularProgressIndicator(
                        color: Colors.blueAccent,
                      ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: Text(
                      formattedDate ?? "",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                buildRow(context),
              ],
            )),
          );
        },
      ),
    );
  }

  Row buildRow(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        build(context);
                        bloc.add(LoadCatsData());
                        setState(() {
                          imageUri = "https://cataas.com/cat";
                        });

                      },
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.lightBlue)),
                      child: const Text(
                        "Another fact",
                        style: TextStyle(color: Colors.white),
                      )),
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blueAccent)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HistoryScreen()));
                      },
                      child: const Text(
                        "Show History",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              );
  }
}
