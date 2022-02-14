FROM python:3.7
# install debain os dependencies
RUN apt update -y
RUN apt install libblas3 liblapack3 liblapack-dev libblas-dev cmake -y
RUN pip install --upgrade pip

# copy installation requirement



# install python pacakges
# RUN pip install -r requirements.txt # statistical-clear-sky inclde solar-data-tools packalges
RUN pip install scipy
RUN pip install numpy==1.19.2
RUN pip install pandas
RUN pip install scikit-learn
RUN pip install jupyter
RUN pip install matplotlib
RUN pip install seaborn
RUN pip install requests
RUN pip install pvlib
RUN pip install cvxpy>=1.1.0
RUN pip install boto3
RUN pip install python-dotenv
# I suggest using the MOSEK convex solver with cvxpy, if possible. For additional information about setting up MOSEK,
# see here: https://docs.mosek.com/8.1/pythonapi/install-interface.html. A license is required to use this software.
# Academic license info: https://www.mosek.com/products/academic-licenses/
# Trial commercial license info: https://www.mosek.com/products/trial/
RUN pip install Mosek
# install coverage
RUN pip install awscli coverage


# # copy mosek licence
COPY ./licence/mosek.lic /root/mosek/
WORKDIR /usr/local/src/solar-data-tools
COPY ./ ./


# run juypter in port 8888
# CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
