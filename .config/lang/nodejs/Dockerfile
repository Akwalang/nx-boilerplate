FROM node:22-alpine AS build

ARG PACKAGE_TYPE
ARG PACKAGE_NAME

WORKDIR /app

COPY ./apps/${PACKAGE_TYPE}/${PACKAGE_NAME}/package*.json ./

RUN npm install

COPY ./apps/${PACKAGE_TYPE}/${PACKAGE_NAME}/ .

RUN npm run build

FROM node:22-alpine

WORKDIR /app

COPY --from=build /app/ .
COPY --from=build /app/package*.json ./

RUN npm install --only=production

EXPOSE 3000

CMD ["npm", "start"]
