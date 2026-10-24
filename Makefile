CXX = g++
CXXFLAGS_BASE = -Wall -std=c++17 -fno-omit-frame-pointer -g

CXXFLAGS_UNOPT = $(CXXFLAGS_BASE) -O0

CXXFLAGS_OPT = $(CXXFLAGS_BASE) -O3 -mcpu=native -ftree-vectorize

all: unopt opt

unopt: main.cpp
	$(CXX) $(CXXFLAGS_UNOPT) main.cpp -o prog_unopt

opt: main.cpp
	$(CXX) $(CXXFLAGS_OPT) main.cpp -o prog_opt

clean:
	rm -f prog_unopt prog_opt *.svg *.perf-folded perf.data* time_*.txt power_*.txt perf_stat_*.txt
