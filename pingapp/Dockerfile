FROM python:3
WORKDIR /home/docker
COPY requirements.txt /home/docker/requirements.txt
RUN pip install --no-cache-dir -r /home/docker/requirements.txt
COPY pingpong.py /home/docker/pingpong.py
EXPOSE 5000
CMD [ "python3", "/home/docker/pingpong.py" ]
