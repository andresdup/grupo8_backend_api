from flask import jsonify, request
from app.database import * #testear_conexion #, create_table_pp
from app.models import Pelicula

def index():
    return jsonify({'message': 'Bienvenidos al sitio de Películas PelGen CaC'})   

def create_movie():
    dato = request.json
    miPelicula = Pelicula(titulo=dato['titulo'], descripcion=dato['descripcion'], anio=dato['anio'], duracion=dato['duracion'], imagen=dato['imagen'])
    miPelicula.save()
    return jsonify({'message': 'Película creada satisfactoriamente'}), 201

def get_all_movies():
    peliculas = Pelicula.get_all()
    return jsonify([unaPelicula.serialize() for unaPelicula in peliculas])

def get_movie(id_pelicula):
    miPelicula = Pelicula.get_by_id(id_pelicula)
    if not miPelicula:
        return jsonify({'message': 'Película no encontrada'}), 404
    return jsonify(miPelicula.serialize())

def update_movie(id_pelicula):
    miPelicula = Pelicula.get_by_id(id_pelicula)
    if not miPelicula:
        return jsonify({'message': 'Película no encontrada'}), 404
    dato = request.json
    miPelicula.titulo = dato['titulo']
    miPelicula.descripcion = dato['descripcion']
    miPelicula.anio = dato['anio']
    miPelicula.duracion = dato['duracion']
    miPelicula.imagen = dato['imagen']
    miPelicula.save()
    return jsonify({'message': 'Película actualizada correctamente'})

def delete_movie(id_pelicula):
    miPelicula = Pelicula.get_by_id(id_pelicula)
    if not miPelicula:
        return jsonify({'message': 'Película no encontrada'}), 404
    miPelicula.delete()
    return jsonify({'message': 'Película borrada correctamente'})

# def index():
#     return jsonify({"mensaje":"soy una API nuevita nuevita"}), 200

# def test():
#     return jsonify({"mensaje":"ESTO ES UN TEST"}), 200

def testear_base():
    try:
        testear_conexion()
        return jsonify({"mensaje":"La conexión es un éxito"}), 200
    except BaseException as be:
        return jsonify({"mensaje": f"Error al conectar: {be}"}), 500

# def create_table():
#     try:
#         create_table_pp()
#         return jsonify({"mensaje":"La tabla se creó con éxito"}), 200
#     except BaseException as be:
#         return jsonify({"mensaje": f"Error al crear a¿la tabla: {be}"}), 500