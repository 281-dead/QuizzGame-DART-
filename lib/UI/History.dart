import 'package:ailatrieuphu/Provider/HistoryProvider.dart';
import 'package:ailatrieuphu/models/History_models.dart';
import 'package:ailatrieuphu/widget/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<HistoryObject> lsHistory = [];
  DateTime timeNow = DateTime.now();
  String timeNowText = DateFormat.yMEd().add_jms().format(DateTime.now());

  void loadListHistory() async {
    final data = await HistoryProvider.getListHistory();
    setState(() {
      lsHistory = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadListHistory();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kprimaryColor,
          title: Text(
            'Lịch sử chơi',
            style: GoogleFonts.abel(
              color: white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: kprimaryColor,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 200,
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: white),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'User',
                        style: GoogleFonts.abel(
                          color: white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.heart_broken_rounded,
                              color: Colors.red.withOpacity(0.8),
                              size: 20.0,
                            ),
                            Icon(
                              Icons.heart_broken_rounded,
                              color: Colors.red.withOpacity(0.8),
                              size: 20.0,
                            ),
                            Icon(
                              Icons.heart_broken_rounded,
                              color: Colors.red.withOpacity(0.8),
                              size: 20.0,
                            ),
                            Icon(
                              Icons.heart_broken_rounded,
                              color: Colors.red.withOpacity(0.8),
                              size: 20.0,
                            ),
                            Icon(
                              Icons.heart_broken_rounded,
                              color: Colors.red.withOpacity(0.8),
                              size: 20.0,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(
                        '2000',
                        style: GoogleFonts.abel(
                          color: white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Icon(
                      Icons.diamond_outlined,
                      size: 20,
                      color: Colors.yellow.withOpacity(0.8),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                //physics: const NeverScrollableScrollPhysics(),
                //scrollDirection: Axis.vertical,
                itemCount: lsHistory.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        timeNowText,
                        style: GoogleFonts.abel(
                          color: black.withOpacity(1),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      subtitle: Text(
                        'Số câu: ${lsHistory[index].socau}',
                        style: GoogleFonts.abel(
                          color: const Color(0xFFC83E3C),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        '${lsHistory[index].diem} điểm',
                        style: GoogleFonts.abel(
                          color: kprimaryColor.withOpacity(0.7),
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
