#! /bin/bash

g=$(command -v g || true)
if [[ "$g" == "" ]]; then
  curl -sSL https://raw.githubusercontent.com/voidint/g/master/install.sh | bash
else
  g self update
fi

target_version="1.24.2"
g install $target_version

go telemetry off

go install -v golang.org/x/tools/gopls@latest
go install -v golang.org/x/tools/cmd/goimports@latest
go install -v github.com/fatih/gomodifytags@latest
go install -v github.com/ajmesa9891/impl/goimpl@latest
go install -v github.com/davidrjenni/reftools/cmd/fillstruct@latest
go install -v honnef.co/go/tools/cmd/staticcheck@latest
go install -v github.com/golangci/golangci-lint/v2/cmd/golangci-lint@latest
go install -v github.com/go-delve/delve/cmd/dlv@latest
go install -v github.com/fullstorydev/grpcurl/cmd/grpcurl@latest
