#--- Install node dependencies 
FROM node:16.20.2-alpine3.18 as deps
RUN echo "--- Install node dependencies  ---"
# RUN apk add git
WORKDIR /app

COPY package.json ./
COPY package-lock.json ./
# COPY patches ./patches


RUN npm i
# --- RUN App
FROM node:16.20.2-alpine3.18 as builder
RUN echo "--- RUN App ---"
# ENV NODE_ENV debug
WORKDIR /app
ADD . .
COPY --from=deps /app/node_modules/ /app/node_modules/
COPY --from=deps /app/package.json /app/package-lock.json  /app/
CMD ["npm", "run", "serve"]

