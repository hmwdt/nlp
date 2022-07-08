from flask import Flask
from paddlenlp import Taskflow
import json

app = Flask(__name__)

@app.route('/')
def hello_world():
    text = "中国吉林省长春市"
    seg = Taskflow("word_segmentation", device_id=-1)
    my_list = seg(text)
    return json.dumps(my_list)

if __name__ == '__main__':
    app.run()
