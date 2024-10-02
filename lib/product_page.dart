import 'package:flutter/material.dart';
import 'package:web/models/producto.dart';
import 'package:web/producctos.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProductSearchPage(),
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
    // Simula una espera de 2 segundos

    final productlist = await getProductos();

    // Aquí deberías hacer tu solicitud HTTP real para obtener el producto
    // Por ahora, vamos a simular que encontramos un producto con el ID dado
    return productlist.where((e) => e.id == productId).firstOrNull;
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
                      } else {
                        return Text(
                            snapshot.data?.nombre ?? 'Producto no encontrado');
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
