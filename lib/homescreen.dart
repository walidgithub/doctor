import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:two/model.dart';

List<String> category = ['Adults', 'Children', 'Women'];
String Selected = category[0];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //to receive the change of index
  void mychange(int index) {
    setState(() {
      Selected == category[index];
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.menu),
        elevation: 0.0,
      ),
      drawer: Drawer(
        backgroundColor: Color(0xffe89176),
        child: ListView(children: [
          Container(
            child: UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60"),
              ),
              accountName: Text(
                "John Paul",
                style: Theme.of(context).textTheme.headline6,
              ),
              accountEmail: Text(
                "johnpaul@example.com",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
        ]),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Find Your \nConsultation',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(2.5),
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              // height:MediaQuery.of(context).size.height // to take all height the content
              // height:MediaQuery.of(context).size.height * 0.5 // you can multiply height to number
              child: ListView.builder(
                  itemCount: category.length,
                  // physics: const BouncingScrollPhysics(), // it help you in scrolling if you have big data
                  shrinkWrap:
                      true, // to fit the content in screen(take content height only)
                  scrollDirection: Axis.horizontal,
                  //item builder to show the UI
                  itemBuilder: (context, index) {
                    return Categories(
                      isSelected: Selected == category[index], //selected index
                      category: category[index], //all the list
                      States: this, //change in this screen
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 280,
              child: ListView.builder(
                  itemCount: list1.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Adults(
                      image: list1[index].image,
                      text: list1[index].text,
                      number: list1[index].number,
                      contColor: list1[index].contColor,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class Adults extends StatefulWidget {
  String image;
  String text;
  int number;
  Color contColor;

  Adults(
      {required this.image,
      required this.text,
      required this.number,
      required this.contColor});

  @override
  State<Adults> createState() => _AdultsState();
}

class _AdultsState extends State<Adults> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.all(2),
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: widget.contColor,
      ),
      child: Column(
        children: [
          Text(
            widget.text,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "${widget.number} Doctors",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          SizedBox(
            height: 15,
          ),
          Image.asset(widget.image)
        ],
      ),
    );
  }
}

class Categories extends StatefulWidget {
  bool isSelected;
  String category;
  _HomeScreenState States; //to know what screen will change ( = Context)

  Categories(
      {required this.isSelected, required this.category, required this.States});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // changeSelected(index);
        setState(() {
          Selected = widget.category;
          widget.States.mychange(0);
        });
      },
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: widget.isSelected ? Colors.deepOrange[200] : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          widget.category,
          style: TextStyle(
            fontSize: 15,
            color: widget.isSelected ? Colors.white : Colors.deepOrange[200] ,
          ),
        ),
      ),
    );
  }
}
