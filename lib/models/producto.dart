class Producto {
  int id;
  String nombre;
  double precio;
  String descripcion;
  List<String> imagenes;
  bool usado;
  String detalle_producto;
  // poner una variable tipo para poder usarlo en un futuro con el filtro (ej: 'tipo: "celular"', para identificar que tipo es cada producto)

  Producto({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.descripcion,
    required this.imagenes,
    required this.usado,
    required this.detalle_producto,
  });

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        id: json["id"],
        nombre: json["nombre"],
        precio: json["precio"]?.toDouble(),
        descripcion: json["descripcion"],
        imagenes: List<String>.from(json["imagenes"].map((x) => x)),
        usado: json["usado"],
        detalle_producto: json["Detalle del producto"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "precio": precio,
        "descripcion": descripcion,
        "imagenes": List<dynamic>.from(imagenes.map((x) => x)),
        "usado": usado,
      };
}
