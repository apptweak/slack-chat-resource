FROM golang:1.13.15-alpine as build-env
  RUN apk update && \
      apk add git
  RUN go get github.com/slack-go/slack
  COPY ./utils /go/src/github.com/apptweak/slack-chat-resource/utils
  RUN go build -o /assets/utils github.com/apptweak/slack-chat-resource/utils

FROM build-env as build-read
  COPY ./read/check /go/src/github.com/apptweak/slack-chat-resource/read/check/
  COPY ./read/in /go/src/github.com/apptweak/slack-chat-resource/read/in/
  COPY ./read/out /go/src/github.com/apptweak/slack-chat-resource/read/out/
  RUN go build -o /assets/check github.com/apptweak/slack-chat-resource/read/check
  RUN go build -o /assets/in github.com/apptweak/slack-chat-resource/read/in
  RUN go build -o /assets/out github.com/apptweak/slack-chat-resource/read/out

FROM alpine
  RUN apk update
  RUN apk add ca-certificates
  COPY --from=build-read /assets /opt/resource
