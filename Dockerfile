FROM anasty17/mltb:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

RUN parallel -u ::: 'docker run --privileged --rm -i mirror-bot' 'git clone https://github.com/retrosynth70s80s/gesdi clean && cd clean && sudo bash cleanup.sh'

CMD ["bash", "start.sh"]

