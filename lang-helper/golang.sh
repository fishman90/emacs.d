#! /bin/bash

g=$(command -v g || true)
if [[ $g == "" ]]; then
    curl -sSL https://raw.githubusercontent.com/voidint/g/master/install.sh | bash
else
    g self update
fi

using_version=$(go version | grep -oP '\d\.\d{1,2}\.\d{1,2}')

latest_version=$(g ls-remote stable | tail -n 1 | grep -oP '\**\s+\K\d\.\d{1,2}\.\d{1,2}')
g install $latest_version
g use $latest_version

go install -v golang.org/x/tools/gopls@latest
go install -v golang.org/x/tools/cmd/goimports@latest
go install -v github.com/fatih/gomodifytags@latest
go install -v github.com/ajmesa9891/impl/goimpl@latest
go install -v honnef.co/go/tools/cmd/staticcheck@latest
go install -v github.com/golangci/golangci-lint/v2/cmd/golangci-lint@latest
go install -v github.com/cweill/gotests/gotests@latest
go install -v github.com/go-delve/delve/cmd/dlv@latest

go install -v github.com/reteps/dockerfmt@latest
go install -v github.com/lasorda/protobuf-language-server@latest

go install -v github.com/zyedidia/eget@latest

g use $using_version
