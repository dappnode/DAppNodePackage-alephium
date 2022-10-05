FROM alephium/explorer:latest

# set working directory
WORKDIR /app

ARG REACT_APP_BACKEND_URL REACT_APP_NETWORK_TYPE

ENV REACT_APP_BACKEND_URL=${REACT_APP_BACKEND_URL}
ENV REACT_APP_NETWORK_TYPE=${REACT_APP_NETWORK_TYPE}

# create optimized production build
RUN npm run build

ADD entrypoint.sh /usr/local/bin/entrypoint.sh

CMD [ "entrypoint.sh" ]