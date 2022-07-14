FROM registry.baidubce.com/paddlepaddle/paddle:2.3.0

RUN git clone https://github.com/hmwdt/nlp.git /data/www

RUN pip3 install flask uwsgi paddlenlp --upgrade -i https://mirror.baidu.com/pypi/simple

RUN mkdir /data/logs

RUN mkdir /data/service

WORKDIR /data/www

RUN chmod a+rx /data/start.sh

ADD https://bj.bcebos.com/paddlenlp/taskflow/lexical_analysis/lac/model_state.pdparams /root/.paddlenlp/taskflow/lac/

ADD https://bj.bcebos.com/paddlenlp/taskflow/lexical_analysis/lac/tag.dic /root/.paddlenlp/taskflow/lac/

ADD https://bj.bcebos.com/paddlenlp/taskflow/lexical_analysis/lac/q2b.dic /root/.paddlenlp/taskflow/lac/

ADD https://bj.bcebos.com/paddlenlp/taskflow/lexical_analysis/lac/word.dic /root/.paddlenlp/taskflow/lac/

CMD ["uwsgi", "--ini", "/data/uwsgi.ini"]