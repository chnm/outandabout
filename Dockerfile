FROM floryn90/hugo:0.121.2-alpine as build-stage

ARG hugobuildargs
ENV HUGO_BUILD_ARGS $hugobuildargs

WORKDIR /app
ADD . .

RUN hugo ${HUGO_BUILD_ARGS}

FROM nginx:1.23-alpine

COPY --from=build-stage /app/public/ /usr/share/nginx/html
