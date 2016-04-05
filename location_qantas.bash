#! /bin/bash

if host aws.qantas.com.au &> /dev/null; then
  export http_proxy="http://qfwsgproxysydpit.qantas.com.au:8080"
  export https_proxy="http://qfwsgproxysydpit.qantas.com.au:8080"
  export no_proxy="169.254.169.254,127.0.0.1,localhost.localdomain,localhost,.qcpaws.qantas.com.au,.aws.qantas.com.au,.aws-sentinel.com"
fi