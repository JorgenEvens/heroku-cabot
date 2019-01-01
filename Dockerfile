FROM cabotapp/cabot

RUN pip install --no-cache-dir \
        cabot-check-sslcert \
        cabot-alert-slack \
        https://github.com/cabotapp/cabot-check-network/archive/master.zip \
        ;

ADD aio-launch /aio-launch
