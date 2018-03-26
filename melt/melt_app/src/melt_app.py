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
    f = NamedTemporaryFile(mode='r+w', delete=False)
    f.write(json_data)
    f.read()
    ps = subprocess.Popen(('cat', f.name), stdout=subprocess.PIPE)
    output = subprocess.check_output(('MElt', '-t'), stdin=ps.stdout)
    f.close()
    return output


@app.route('/tokenize', methods=['POST'])
def tokenize():
    json_data = request.json['data']
    f = NamedTemporaryFile(delete=False)
    f.write(json_data)
    ps = subprocess.Popen(('cat', f.name), stdout=subprocess.PIPE)
    output = subprocess.check_output(('sxpipe-light'), stdin=ps.stdout, shell=True)
    f.close()
    return output


if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')
