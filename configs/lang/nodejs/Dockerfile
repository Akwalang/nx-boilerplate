FROM node:22-alpine AS build

ARG PACKAGE_NAME

WORKDIR /app

COPY ./packages/${PACKAGE_NAME}/package*.json ./

RUN npm install

COPY ./packages/${PACKAGE_NAME}/src ./src

RUN npm run build

FROM node:22-alpine

WORKDIR /app

COPY --from=build /app/ .
COPY --from=build /app/package*.json ./

RUN npm install --only=production

EXPOSE 3000

CMD ["npm", "start"]
