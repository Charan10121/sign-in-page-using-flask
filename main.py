from MySQLdb import connections
from flask import Flask, render_template, redirect, session, url_for, request
from flask_mysqldb import MySQL
import MySQLdb #used to create dict cursors

app = Flask(__name__)
app.secret_key = "12344321" #good habit, easy to share with other extensions

app.config["MYSQL_HOST"] = "127.0.0.1"
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = "luigi345"
app.config["MYSQL_DB"] = "loginman"

db = MySQL(app)

@app.route ('/', methods = ['GET','POST'])  #decorator #post used to get form data, get retrieves info from server
def index() :
    if request.method == 'POST':
        if 'username' in request.form and 'password' in request.form:
            username = request.form['username'] #storing in variables
            password = request.form['password']
            cursor = db.connection.cursor(MySQLdb.cursors.DictCursor)
            cursor.execute("SELECT * FROM logininfo WHERE email = %s AND password = %s",(username,password)) #query in mysql
            info = cursor.fetchone()    #stored in info
            if info is not None:
                if info['email'] ==username and info['password'] == password:
                    session['loginsuccess'] = True  
                    return redirect(url_for('profile'))
            else:
                return redirect(url_for('index'))   #back to login page

    return render_template("login.html")

@app.route('/new', methods = ['GET','POST'])
def new_user():
    if request.method == "POST":
        if "one" in request.form and "two" in request.form and "three" in request.form:
            name = request.form['one']
            email = request.form['two']
            password = request.form['three']
            cur = db.connection.cursor(MySQLdb.cursors.DictCursor)
            cur.execute("INSERT INTO loginman.logininfo(name,email,password)VALUES(%s,%s,%s)", (name,email,password))
            db.connection.commit()
            return redirect(url_for('index'))
    return render_template("register.html")
    
@app.route('/new/profile')
def profile():
    if session['loginsuccess'] ==True:
        return render_template("profile.html")

@app.route('/new/logout')
def logout():
    session.pop('loginsuccess',None)
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug = True)