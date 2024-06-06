#!/usr/bin/sh

curl -OL "http://www.picat-lang.org/bprolog/download/bp81_linux64.tar.gz"
tar -xf bp81_linux64.tar.gz
sudo mv BProlog /opt/BProlog
sudo ln -s /opt/BProlog/bp /usr/local/bin/bprolog
rm bp81_linux64.tar.gz
