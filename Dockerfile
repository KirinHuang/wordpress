FROM tutum/apache-php

# copy wordpress to /app dir
ADD ./wordpress /app

# clean trash file
RUN rm -rf Dockerfile  Makefile  stop.sh  wordpress  wordpress.zip
