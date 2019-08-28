# pip install flask
from flask import Flask

app = Flask(__name__)

@app.route('/')
def inded():
    return 'Happy Hacking'

# flask run

@app.route('/lotto')
def lotto():
    import random
    numbers = range(1,46)
    lotto = random.sample(numbers ,6)
    print(list(numbers))
    return str(sorted(lotto))

#Ctrl + c : 서버종료
# flask run

