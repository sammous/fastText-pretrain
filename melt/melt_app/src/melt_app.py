# -*- coding: utf-8 -*-
from flask import Flask
from flask import request
import subprocess
from tempfile import NamedTemporaryFile
import json

app = Flask(__name__)

@app.route('/', methods=['POST'])
def tokenize_and_post():
    json_data = request.json['data']
    f = NamedTemporaryFile()
    f.write(json_data)
    f.read()
    ps = subprocess.Popen(('cat', f.name), stdout=subprocess.PIPE)
    output = subprocess.check_output(('MElt', '-t'), stdin=ps.stdout.read())
    f.close()
    return output

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')
