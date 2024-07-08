from flask import Flask
from app.database import *
from app.views import *
from flask_cors import CORS

app = Flask(__name__)

# Inicializar la base de datos con la aplicación Flask
init_app(app)
#permitir solicitudes desde cualquier origen
CORS(app)
#permitir solicitudes desde un origen específico
#CORS(app, resources={r"/api/*": {"origins": "http://127.0.0.1:5500"}})

# URLs para el CRUD de Pelicula
app.route('/', methods=['GET'])(index)
app.route('/probar_base', methods=['POST'])(testear_base)
app.route('/peliculas/', methods=['POST'])(create_movie)
app.route('/peliculas/', methods=['GET'])(get_all_movies)
app.route('/peliculas/<int:id_pelicula>', methods=['GET'])(get_movie)
app.route('/peliculas/<int:id_pelicula>', methods=['PUT'])(update_movie)
app.route('/peliculas/<int:id_pelicula>', methods=['DELETE'])(delete_movie)

if __name__ == '__main__':
    app.run(debug=True)

