FROM cabotapp/cabot:0.11.16

# CURL is missing in the image tagged `latest`
RUN apk add --no-cache \
        curl \
        curl-dev

RUN pip install --no-cache-dir \
        cabot-check-sslcert \
        cabot-alert-slack \
        https://github.com/cabotapp/cabot-check-network/archive/master.zip \
        https://github.com/JorgenEvens/cabot-check-smtp/archive/master.zip \
        ;

ADD aio-launch /aio-launch

CMD /aio-launch
