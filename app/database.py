import os
import mysql.connector
from flask import g
from dotenv import load_dotenv


# Cargar variables de entorno desde el archivo .env
load_dotenv()

DATABASE_CONFIG = {
    'user': os.getenv('DB_USERNAME'),
    'password': os.getenv('DB_PASSWORD'),
    'host': os.getenv('DB_HOST'),
    'database': os.getenv('DB_NAME'),
    'port': os.getenv('DB_PORT')
}

# función para obtener la conexión de la base de datos
def get_db():
    if 'db' not in g:
        g.db = mysql.connector.connect(**DATABASE_CONFIG)
    return g.db

# función para cerrar la conexión de la base de datos
def close_db(e=None):
    db = g.pop('db', None)
    if db is not None:
        db.close()

# función para inicializar la aplicación con el manejo de la base de datos
def init_app(app):
    # registrar 'close_db' para que se ejecute al final del contexto de la aplicación
    app.teardown_appcontext(close_db)


def testear_conexion():
    conn = mysql.connector.connect(**DATABASE_CONFIG)
    cur = conn.cursor()
    conn.commit()
    cur.close()
    conn.close()
 
# def create_table_pp():
#     conn = mysql.connector.connect(**DATABASE_CONFIG)
#     cur = conn.cursor()
#     cur.execute(
#     """
#     CREATE TABLE pp (
#         numero int
#     )
#     """
#     )
#     cur.close()
#     conn.close()