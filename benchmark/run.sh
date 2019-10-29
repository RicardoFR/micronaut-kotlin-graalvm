#!/bin/bash
cd "$(dirname "$0")"

#ab -g output.tsv  -c 2000 -n 10000 http://localhost:8080/api/image

ab -g output.tsv  -c 2000 -n 10000 http://localhost:8080/api/test

gnuplot plotconfig.p