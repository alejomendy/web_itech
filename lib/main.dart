import 'package:flutter/material.dart';
import 'package:web/models/producto.dart';
import 'package:web/producctos.dart';
import 'package:web/product_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductSearchPage(),
    );
  }
}

class ProductSearchPage extends StatefulWidget {
  const ProductSearchPage({super.key});

  @override
  ProductSearchPageState createState() => ProductSearchPageState();
}

class ProductSearchPageState extends State<ProductSearchPage> {
  Producto? product;

  Future<Producto?> _fetchProductById(int productId) async {
    await Future.delayed(const Duration(seconds: 2));
    final productlist = await getProductos();
    return productlist
        .where(
          (e) => e.id == productId,
        )
        .firstOrNull;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Producto'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            product == null
                ? const Text('Presiona el botón para buscar un producto')
                : FutureBuilder<Producto?>(
                    future: _fetchProductById(1),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData || snapshot.data == null) {
                        return const Text('Producto no encontrado');
                      } else {
                        return ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductView(producto: snapshot.data!),
                              ),
                            );
                          },
                          child: const Text('Ver Producto'),
                        );
                      }
                    },
                  ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  product = Producto(
                    id: 1,
                    nombre: 'Celular X',
                    precio: 999,
                    descripcion: 'Un celular de alta gama',
                    imagenes: [
                      'https://discord.com/channels/@me/979900721849827380/1273350950828118139'
                    ],
                    usado: false,
                    detalle_producto: 'Marca: Apple',
                  );
                });
              },
              child: const Text('Buscar Producto'),
            ),
          ],
        ),
      ),
    );
  }
}
