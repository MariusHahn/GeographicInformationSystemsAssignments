from flask import Flask, escape, request
import psycopg2


app = Flask(__name__)

@app.route("/")
def hello():
    name = request.args.get("name", "World")
    return f"Hello , { escape ( name )}!"


@app.route("/add")
def add():
    number1 = request.args.get("n1", "0")
    number2 = request.args.get("n2", "0")
    result = int(number1) + int(number2)
    return f"{number1} + {number2} = {result}"

@app.route('/how_many')
def how_many():
    connection = psycopg2.connect( host = "172.17.0.1" , port="25432" , dbname = "marius-postgis" , user = "marius" , password = "password")
    amenity_type = request.args.get("amenity_type", "%")
    query = f"SELECT count(*) from planet_osm_point point WHERE point.amenity is not null and point.amenity like '{amenity_type}'"
    with connection.cursor() as cursor:
        cursor.execute(query)
        
        result = cursor.fetchone()
    
    return str(result[0])
