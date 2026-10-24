#!/bin/bash
# Запускати з правами sudo: sudo ./run_lab.sh

echo "Building programs..."
make clean && make

# Перевірка наявності інструментарію FlameGraph
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
    
    # 1. Замір часу та базової статистики пам'яті
    echo "[1/4] Running /usr/bin/time..."
    /usr/bin/time -v ./$PROG > time_$NAME.txt 2>&1
    
    # 2. Апаратні лічильники та IPC (Instructions Per Cycle)
    echo "[2/4] Running perf stat..."
    perf stat -d -o perf_stat_$NAME.txt ./$PROG
    
    # 3. Вимірювання енергоспоживання (для процесорів Intel/AMD з RAPL)
    echo "[3/4] Measuring Power Consumption..."
    perf stat -e power/energy-pkg/ -o power_$NAME.txt ./$PROG
    
    # 4. Збір профілю стеку та побудова FlameGraph
    echo "[4/4] Building FlameGraph..."
    perf record -F 99 -g -o perf_$NAME.data -- ./$PROG
    perf script -i perf_$NAME.data | ./FlameGraph/stackcollapse-perf.pl > out_$NAME.perf-folded
    ./FlameGraph/flamegraph.pl out_$NAME.perf-folded > flamegraph_$NAME.svg
    
    echo "Done for $NAME. Output saved to *_$NAME.* files."
}

run_analysis "prog_unopt" "UNOPT"
run_analysis "prog_opt" "OPT"

echo "All tasks completed! Open flamegraph_UNOPT.svg and flamegraph_OPT.svg in your browser."