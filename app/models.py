from app.database import get_db

class Pelicula:
    def __init__(self, id=None, titulo=None, descripcion=None, anio=None, duracion=None, imagen=None):
        self.id = id
        self.titulo = titulo
        self.descripcion = descripcion
        self.anio = anio
        self.duracion = duracion
        self.imagen = imagen

    def save(self):
        db = get_db()
        cursor = db.cursor()
        if self.id:
            cursor.execute("""
                UPDATE pelicula SET titulo = %s, descripcion = %s, anio = %s, duracion = %s, imagen = %s
                WHERE id = %s
            """, (self.titulo, self.descripcion, self.anio, self.duracion, self.imagen, self.id))
        else:
            cursor.execute("""
                INSERT INTO pelicula (titulo, descripcion, anio, duracion, imagen) VALUES (%s, %s, %s, %s, %s)
            """, (self.titulo, self.descripcion, self.anio, self.duracion, self.imagen))
            self.id = cursor.lastrowid
        db.commit()
        cursor.close()

    @staticmethod
    def get_all():
        db = get_db()
        cursor = db.cursor()
        cursor.execute("SELECT id, titulo, descripcion, anio, duracion, imagen FROM pelicula")
        rows = cursor.fetchall()
        peliculas = []
        for row in rows:
            peliculas.append(Pelicula(id=row[0], titulo=row[1], descripcion=row[2], anio=row[3], duracion=row[4], imagen=row[5]))
        peliculas = [Pelicula(id=row[0], titulo=row[1], descripcion=row[2], anio=row[3], duracion=row[4], imagen=row[5])  for row in rows]
        cursor.close()
        return peliculas

    @staticmethod
    def get_by_id(id_pelicula):
        db = get_db()
        cursor = db.cursor()
        cursor.execute("SELECT id, titulo, descripcion, anio, duracion, imagen FROM pelicula WHERE id = %s", (id_pelicula,))
        row = cursor.fetchone()
        cursor.close()
        if row:
            return Pelicula(id=row[0], titulo=row[1], descripcion=row[2], anio=row[3], duracion=row[4], imagen=row[5])
        return None

    def delete(self):
        db = get_db()
        cursor = db.cursor()
        cursor.execute("DELETE FROM pelicula WHERE id = %s", (self.id,))
        db.commit()
        cursor.close()

    def serialize(self):
        return {
            'id_pelicula': self.id,
            'titulo': self.titulo,
            'descripcion': self.descripcion,
            'anio': self.anio,
            'duracion': self.duracion,
            'imagen': self.imagen
        }