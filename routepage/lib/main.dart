import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        // When navigating to the "/" route, build the FavPage widget.
        '/': (context) => FavPage(title: 'Product layout demo home page'),

        // When navigating to the "/detailed" route, build the DetailedPage widget.
        '/detailed': (context) => DetailedPage(),
      },
    );
  }
}

class FavPage extends StatelessWidget {
  const FavPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50), // Set preferred height to accommodate larger text
        child: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Coach',
                    style: TextStyle(color: Colors.yellow, fontSize: 30),
                  ),
                  Text(
                    'Cook',
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ],
              ),
              Text(
                'Favorite',
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 10.0,
            padding: EdgeInsets.all(10.0),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              FavProductBox(
                name: "Tom Yum Kung",
                description: "Estimate Time: 15 minutes",
                Detail: "See More>>",
                image: "https://d3h1lg3ksw6i6b.cloudfront.net/media/image/2023/04/24/5608757681874e1ea5df1aa41d5b2e3d_How_To_Make_Tom_Yam_Kung_The_Epitome_Of_Delicious_And_Nutritious_Thai_Cuisine3.jpg",
              ),
              FavProductBox(
                name: "Tom Kha Kai ",
                description: "Estimate Time: 17 minutes",
                Detail: "See More>>",
                image: "https://hot-thai-kitchen.com/wp-content/uploads/2014/06/Tom-kha-gai-new-sq.jpg",
              ),
              FavProductBox(
                name: "Hamburger",
                description: "Estimate Time: 10 minutes",
                Detail: "See More>>",
                image: "https://www.recettesetcabas.com/data/recettes/2379-1-fiche@64E36067-hamburger-a-la-tomme-de-savoie-bacon-et-salade.webp",
              ),
              FavProductBox(
                name: "Sushi Roll",
                description: "Estimate Time: 25 minutes",
                Detail: "See More>>",
                image: "https://www.happyfoodstube.com/wp-content/uploads/2016/03/homemade-sushi-image-500x500.jpg",
              ),
              FavProductBox(
                name: "French Fried",
                description: "Estimate Time: 15 minutes",
                Detail: "See More>>",
                image: "https://www.recipetineats.com/wp-content/uploads/2022/09/Fries-with-rosemary-salt_1.jpg",
              ),
              FavProductBox(
                name: "Pad Kra Pao",
                description: "Estimate Time: 23 minutes",
                Detail: "See More>>",
                image: "https://www.foodandwine.com/thmb/Z5FeE6c1mJfx6A6x1FBWSfzzo80=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Pad-Krapow-1-FT-RECIPE0423-212e69119f6d4d2589117ead80cccc4d.jpg",
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 100, // Adjust the height as needed
        child: Center(
          child: Container(
            color: Colors.yellow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.network(
                  'https://cdn-icons-png.flaticon.com/256/25/25694.png', // Image URL
                  width: 50,
                  height: 50,
                ),
                Image.network(
                  'https://i.pinimg.com/originals/8b/5c/49/8b5c498ed69a64d629249d9abe4f44a6.png', // Image URL for the first icon
                  width: 50,
                  height: 50,
                ),
                Image.network(
                  'https://cdn1.iconfinder.com/data/icons/ui-roundicons/480/circle_location-512.png', // Image URL for the second icon
                  width: 50,
                  height: 50,
                ),
                Image.network(
                  'https://creazilla-store.fra1.digitaloceanspaces.com/icons/3250939/bookmark-icon-md.png', // Image URL for the third icon
                  width: 50,
                  height: 50,
                ),
                Image.network(
                  'https://static-00.iconduck.com/assets.00/settings-icon-1964x2048-8nigtrtt.png', // Image URL for the fourth icon
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FavProductBox extends StatelessWidget {
  FavProductBox({
    Key? key,
    required this.name,
    required this.description,
    required this.Detail,
    required this.image,
  }) : super(key: key);

  final String name;
  final String description;
  final String Detail;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the detailed page whenever the product box is tapped
        Navigator.pushNamed(context, '/detailed');
      },
      child: Container(
        padding: EdgeInsets.all(5),
        child: Card(
          color: Colors.yellow, // Set the color of the card to yellow
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      this.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(this.description),
                    SizedBox(height: 4),
                    Text(
                      this.Detail,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class DetailedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: TitleWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            DetailWidget(
              DetailedImage: 'https://www.allrecipes.com/thmb/PpGdlxDdmiMFDo9GnaSmnliaoX8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/4507925-spicy-thai-basil-chicken-pad-krapow-gai-photo-by-chef-john-cropped-dc99cdbd3e414da5ae3258a723c00108.jpg',
              DetailedDescription: 'Pad Kra Pao Ingredients:\n'
                  '100 g pork\n'
                  '1 cup holy basil leaves\n'
                  '3 garlic cloves, peeled\n'
                  '3 red chilies\n'
                  '1 tablespoon Oyster Sauce\n'
                  '1 tablespoon Fish Sauce\n'
                  '½ tablespoon sugar\n'
                  '1 tablespoon water\n'
                  '2 tablespoons oil for frying\n'
                  'Instructions\n'
                  '1. Mix water, sugar, fish sauce, and oyster sauce together and set aside. \n'
                  '2. If you have a mortar and pestle, pound garlic and chilies together. Otherwise you can chop them or slice thinly. \n'
                  '3. Heat a non-stick saucepan over high heat and add the oil. When the oil is hot, add chilies and garlic and stir-fry till fragrant, about 10 seconds. \n'
                  '4. Add pork and stir continuously for few minutes. When it is starting to look like cooked, add sauce mix and stir-fry till the sauce coats the meat evenly. If it is too dry, you can add a small splash of water. \n'
                  '5. Add basil leaves and stir-fry for few more seconds until wilted, then turn off the heat immediately. \n'
                  '6. Serve Pad Kra Pao over rice, topped with a Thai-style crispy fried egg. \n'
                  'Finished!!',
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow,
              ),
              child: Text(
                'Favorite',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            NavBarWidget(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}



class TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Coach',
            style: TextStyle(color: Colors.yellow, fontSize: 40),
          ),
          TextSpan(
            text: 'Cook',
            style: TextStyle(color: Colors.black, fontSize: 40),
          ),
        ],
      ),
    );
  }
}

class DetailWidget extends StatelessWidget {
  final String DetailedImage;
  final String DetailedDescription;

  DetailWidget({required this.DetailedImage, required this.DetailedDescription});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Navigate to the detailed page when the image is tapped
            Navigator.pushNamed(context, '/detailed');
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.grey,
            child: Image.network(
              DetailedImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              DetailedDescription,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}

class NavBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.yellow,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.network(
              'https://cdn-icons-png.flaticon.com/256/25/25694.png',
              width: 50,
              height: 50,
            ),
            Image.network(
              'https://i.pinimg.com/originals/8b/5c/49/8b5c498ed69a64d629249d9abe4f44a6.png',
              width: 50,
              height: 50,
            ),
            Image.network(
              'https://cdn1.iconfinder.com/data/icons/ui-roundicons/480/circle_location-512.png',
              width: 50,
              height: 50,
            ),
          GestureDetector(
              onTap: () {
                // Handle onTap for the bookmark icon
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Image.network(
                'https://creazilla-store.fra1.digitaloceanspaces.com/icons/3250939/bookmark-icon-md.png',
                width: 50,
                height: 50,
              ),
            ),
            Image.network(
              'https://static-00.iconduck.com/assets.00/settings-icon-1964x2048-8nigtrtt.png',
              width: 50,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

