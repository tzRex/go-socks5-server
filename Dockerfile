FROM golang:1.20.4

WORKDIR /app

# 配置goproxy
RUN go env -w GOPROXY=https://goproxy.cn,direct

ENV TZ="Asia/Shanghai"

# 将源代码复制到容器内的 /app 目录
COPY . .

RUN go mod download

RUN go build -o main .

EXPOSE 7400

CMD ["./main"]