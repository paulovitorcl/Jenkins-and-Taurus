FROM blazemeter/taurus

# taurus includes python and pip
RUN /usr/bin/python3 -m pip install --upgrade pip
RUN pip install --no-cache-dir awscli

# Taurus working directory = /bzt-configs
ADD ./quick-test.yml /bzt-configs/
RUN chmod 755 /bzt-configs/quick-test.yml

ENTRYPOINT ["sh","bzt /bzt-configs/quick-test.yml"]