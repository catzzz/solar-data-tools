FROM python:3.7
# install debain os dependencies
RUN apt update -y
RUN apt install libblas3 liblapack3 liblapack-dev libblas-dev cmake -y
RUN pip install --upgrade pip

# copy installation requirement
WORKDIR /usr/local/src/solar-data-tools
COPY ./requirements.txt ./requirements.txt

# install python pacakges
RUN pip install -r requirements.txt

# copy coverage
RUN pip install awscli coverage

# # copy mosek licence
COPY ./licence/mosek.lic /root/mosek/
WORKDIR /usr/local/src/solar-data-tools
COPY ./ ./

# run juypter in port 8888
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
