FROM armory/spin-cli:1.14.0

RUN apk add --no-cache bash

ADD entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]