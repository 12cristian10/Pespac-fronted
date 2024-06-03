import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(color: Colors.blue),
              accountName: Text('Nombre del Usuario'),
              accountEmail: Text('Rol del Usuario'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://res.cloudinary.com/dlvmv0xj9/image/upload/v1717301898/Pespac/profile_pictures/q7vv4ypcuojxdtjy5vx7.jpg'),
              ),
              onDetailsPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Buscar'),
              onTap: () {
                Navigator.pushNamed(context, '/search');
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_basket),
              title: Text('Mis productos'),
              onTap: () {
                Navigator.pushNamed(context, '/my_products');
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('Mis pedidos'),
              onTap: () {
                Navigator.pushNamed(context, '/my_orders');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        title: Image.asset(
          'assets/logo.png',
          height: 80,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.blue[1000]),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Inicio',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryItem(title: 'La pesca del día'),
                CategoryItem(title: 'Pescados'),
                CategoryItem(title: 'Mariscos'),
                CategoryItem(title: 'Filetes'),
                CategoryItem(title: 'Langostinos'),
                // Añade más categorías según sea necesario
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text('Contenido de la página de inicio'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorías',
          ),
          // Añade más elementos de navegación según sea necesario
        ],
        selectedItemColor: Colors.blue,
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;

  CategoryItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
