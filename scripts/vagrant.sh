#!/bin/bash
set -e

wget -q https://storage.googleapis.com/golang/go1.4.1.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.4.1.linux-amd64.tar.gz

apt-get -y install git mercurial

echo 'export PATH=$PATH:/usr/local/go/bin:/go/bin
export GOPATH=/go' >> /home/vagrant/.profile

source /home/vagrant/.profile

go get code.google.com/p/go.tools/cmd/goimports
go get github.com/golang/lint/golint
go get github.com/smartystreets/goconvey/convey
go get github.com/cactus/go-statsd-client/statsd
go get github.com/rcrowley/go-metrics

chown -R vagrant:vagrant /go
