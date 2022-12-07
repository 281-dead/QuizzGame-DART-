import 'package:ailatrieuphu/Provider/RankProvider.dart';
import 'package:ailatrieuphu/models/Rank_models.dart';
import 'package:ailatrieuphu/widget/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rank extends StatefulWidget {
  const Rank({super.key});

  @override
  State<Rank> createState() => _RankState();
}

class _RankState extends State<Rank> {
  List<UserRank> lsUserRank = [];

  void _loadListUserRank() async {
    final data = await RankProvider.getAllUser();
    setState(() {
      lsUserRank = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadListUserRank();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kprimaryColor,
          title: Text(
            'Bảng xếp hạng',
            style: GoogleFonts.abel(
              color: white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
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
                itemCount: lsUserRank.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Colors.teal,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 18),
                          child: Text(
                            '${lsUserRank[index].id}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                '${lsUserRank[index].avatar}',
                              ),
                            ),
                            title: Text(
                              '${lsUserRank[index].name}',
                              style: GoogleFonts.abel(
                                color: black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: Text(
                              '${lsUserRank[index].diem} điểm',
                              style: GoogleFonts.abel(
                                color: Colors.red.withOpacity(0.85),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
