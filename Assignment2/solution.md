# GIS – Tutorial 2 – Backend

**Student:** Marius Hahn

**Enrolment No:** 01/1069938

## Task 2: Modifying the Docker container

```bash
~ docker images
REPOSITORY                            TAG                 IMAGE ID            CREATED             SIZE
my_python_flask_image                 latest              b861f8bc8508        2 minutes ago       368MB

```

## Task 3: Coding inside your Docker container?

```python
@app.route("/add")
def add():
    number1 = request.args.get("n1", "0")
    number2 = request.args.get("n2", "0")
    result = int(number1) + int(number2)
    return f"{number1} + {number2} = {result}"
```

## Task 4: Querying the database, again!

```python
@app.route('/how_many')
def how_many():
    connection = psycopg2.connect( host = "172.17.0.1" , port="25432" , dbname = "marius-postgis" , user = "marius" , password = "password")
    amenity_type = request.args.get("amenity_type", "%")
    query = f"SELECT count(*) from planet_osm_point point WHERE point.amenity is not null and point.amenity like '{amenity_type}'"
    with connection.cursor() as cursor:
        cursor.execute(query)
        
        result = cursor.fetchone()
    
    return str(result[0])
```
