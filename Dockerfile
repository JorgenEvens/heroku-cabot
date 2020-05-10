FROM cabotapp/cabot:0.11.16

# CURL is missing in the image tagged `latest`
RUN apk add --no-cache \
        curl \
        curl-dev

RUN pip install --no-cache-dir \
        celery-graceful-stop \
        cabot-check-sslcert \
        cabot-alert-slack \
        https://github.com/cabotapp/cabot-check-network/archive/master.zip \
        https://github.com/JorgenEvens/cabot-check-smtp/archive/master.zip \
        ;

RUN echo $'import celery_graceful_stop\ncelery_graceful_stop.register(app)' \
     >> /usr/local/lib/python2.7/site-packages/cabot/celery.py

ADD aio-launch /aio-launch
