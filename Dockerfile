FROM python:buster

RUN apt update && \
    apt install -y curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

COPY app /app

RUN cd /app && \
    pip3 install -r requirements.txt

RUN . /root/.bashrc && \
    nvm install --lts && \
    nvm use --lts && \
    cd /app/PB_UI && \
    npm install

RUN . /root/.bashrc && \
    cd /app/PB_UI && \
    npm audit fix && \
    npm run build

COPY start-up.sh ./

RUN chmod +x /start-up.sh

CMD ["/start-up.sh"]
