import 'package:web/models/producto.dart';

final productos = <Producto>[
  Producto(
    id: 1,
    nombre: "iphone 15",
    precio: 500,
    descripcion: "producto de prueba solamente visual y es completamente falso",
    imagenes: [
      "https://cdsassets.apple.com/live/7WUAS350/images/tech-specs/iphone_15_pro.png ",
      "https://cdn-ipoint.waugi.com.ar/26706-large_default/iphone-15-pro-128gb.jpg",
      "https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/iphone-15-finish-select-202309-6-1inch-black?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=cHJOTXEwTU92OEtKVDV2cVB1R2FTSjlERndlRTljaUdZeHJGM3dlLzR2OUFsUUpuUVQ3cUdJUXc0NW5mTVpFdE9MekhWSGZtV1pvV240QzNuTk80VXpBSHlqQStCOGVBOUJkSkVqU0hLTkJ4TlJOSG05R2F6WDE3ZHk4YmdFakNmbW94YnYxc1YvNXZ4emJGL0IxNFp3PT0=&traceId=1",
    ],
    usado: false,
    detalle_producto: 'Marca: Apple',
  ),
];

Future<List<Producto>> getProductos() async {
  await Future.delayed(const Duration(seconds: 1));
  return productos;
}
