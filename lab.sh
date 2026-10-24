#!/bin/bash

echo "Building programs..."
make clean && make

if [ ! -d "FlameGraph" ]; then
    echo "Downloading FlameGraph..."
    git clone https://github.com/brendangregg/FlameGraph.git
fi

run_analysis() {
    local PROG=$1
    local NAME=$2
    
    echo "====================================="
    echo "Analyzing: $NAME ($PROG)"
    echo "====================================="
    
    # 1. Замір часу та пам'яті
    echo "[1/3] Running /usr/bin/time..."
    /usr/bin/time -v ./$PROG > time_$NAME.txt 2>&1
    
    # 2. Апаратні лічильники (без x86 power/energy-pkg)
    echo "[2/3] Running perf stat..."
    perf stat -d -o perf_stat_$NAME.txt ./$PROG
    
    # 3. Збір профілю стеку та побудова FlameGraph
    echo "[3/3] Building FlameGraph..."
    perf record -F 99 -g -o perf_$NAME.data -- ./$PROG
    perf script -i perf_$NAME.data | ./FlameGraph/stackcollapse-perf.pl > out_$NAME.perf-folded
    ./FlameGraph/flamegraph.pl out_$NAME.perf-folded > flamegraph_$NAME.svg
    
    echo "Done for $NAME. Output saved."
}

run_analysis "prog_unopt" "UNOPT"
run_analysis "prog_opt" "OPT"

echo "All tasks completed! Check the generated .svg and .txt files."
