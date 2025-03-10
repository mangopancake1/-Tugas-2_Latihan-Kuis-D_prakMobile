part of 'pages.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> menu = [
    {
      "name": "Burger Double Cheese",
      "price": 15000,
      "image": "assets/images/burgerMenu.png"
    },
    {
      "name": "Burger Double Beef",
      "price": 12000,
      "image": "assets/images/burgerMenu.png"
    },
    {
      "name": "Burger Sunny",
      "price": 20000,
      "image": "assets/images/burgerMenu.png"
    },
    {
      "name": "Burger Vegan",
      "price": 10000,
      "image": "assets/images/burgerMenu.png"
    },
    {
      "name": "Burger Ikan",
      "price": 25000,
      "image": "assets/images/burgerMenu.png"
    },
    {
      "name": "Burger Ayam",
      "price": 10000,
      "image": "assets/images/burgerMenu.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Halo @Arrafi",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => WellcomePage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Banner Gambar
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                image: AssetImage("assets/images/burgerHeadline.png"),
                fit: BoxFit.cover,
              ),
            ),
            margin: const EdgeInsets.all(12),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Daftar Menu",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemCount: menu.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          menu[index]["image"],
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        menu[index]["name"],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Rp ${menu[index]["price"]}",
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  OrderPage(menuItem: menu[index]),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text("Pesan"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
