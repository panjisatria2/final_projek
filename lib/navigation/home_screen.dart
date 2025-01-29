import 'package:final_project/models/users.dart';
import 'package:final_project/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Users>> futureUsers;
  final UserService _userService = UserService();

  @override
  void initState() {
    super.initState();
    futureUsers = _userService.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = 0.05 * screenWidth;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: 280,
            decoration:  BoxDecoration(
              color: Color(0xFF6A6A6A),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
          Positioned(
            top: 68,
            left: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location',
                  style: GoogleFonts.sora(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFA2A2A2),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Tegal, Indonesia',
                      style: GoogleFonts.sora(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFD8D8D8),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down, color: Color(0xFFD8D8D8), size: iconSize),],
                )
              ],
            ),
          ),
          Positioned(
            top: 135,
            left: 24,
            right: 24,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search......',
                      hintStyle: GoogleFonts.sora(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFA2A2A2),
                      ),
                      filled: true,
                      fillColor: Color(0xFF2A2A2A),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/home/Icon (1).png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    style: GoogleFonts.sora(
                        fontSize: 14, color: Color(0xFFA2A2A2)),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/home/Icon.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 203,
            left: 23,
            right: 23,
            child: Container(
              width: 328,
              height: 140,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/home/Frame 90.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Positioned(
            top: 372,
            left: 24,
            child: Text(
              'Recomendation',
              style: GoogleFonts.dmSans(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF000000),
              ),
            ),
          ),
          Positioned(
            top: 380,
            left: 24,
            right: 24,
            child: FutureBuilder<List<Users>>(
              future: futureUsers,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text('User Not Found'),
                  );
                }
                final users =
                snapshot.data!.take(2).toList();
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 156 / 238,
                  ),
                  shrinkWrap: true,
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return Container(
                        width: 156,
                        height: 238,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 12,
                              spreadRadius: 0,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 128,
                                decoration: BoxDecoration(
                                  color: Color(0xFFC4C4C4),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    user.avatar,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                                '${user.firstName} ${user.lastName}',
                                style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                user.email,
                                style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFFA2A2A2),
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    index == 0 ? 'Rp 9.000.000' : 'Rp 10.000.000',
                                    style: GoogleFonts.sora(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF2A2A2A),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}