#!/bin/bash

PROG=$1
if [ -z "$PROG" ]; then
    echo "Використання: sudo ./measure_energy_proxy.sh ./prog_unopt"
    exit 1
fi

P_IDLE=3.0        # Ват (базове споживання платформи)
P_CORE_MAX=1.3    # Ват (динамічне споживання 1 ядра Cortex-A76 під навантаженням)

echo "=== Вимірювання для $PROG на ядрі Cortex-A76 ==="

# Запуск програми на ядрі 4 через perf
PERF_OUT=$(perf stat -e cycles,instructions,task-clock taskset -c 4 "$PROG" 2>&1)

# Витягуємо час виконання (в секундах) з виводу perf
EXEC_TIME=$(echo "$PERF_OUT" | grep "seconds time elapsed" | awk '{print $1}' | tr ',' '.')

if [ -z "$EXEC_TIME" ]; then
    echo "Помилка виконання perf!"
    exit 1
fi

# Обчислення потужності та енергії
P_SYS=$(awk -v idle="$P_IDLE" -v core="$P_CORE_MAX" 'BEGIN { print idle + core }')
P_PROG=$P_CORE_MAX

E_SYS=$(awk -v p="$P_SYS" -v t="$EXEC_TIME" 'BEGIN { print p * t }')
E_PROG=$(awk -v p="$P_PROG" -v t="$EXEC_TIME" 'BEGIN { print p * t }')

echo ""
echo "================ РЕЗУЛЬТАТИ =================="
echo "Час виконання (T):                  $EXEC_TIME с"
echo "3.1 Потужність системи (P_sys):       $P_SYS Вт"
echo "    Енерговитрати системи (E_sys):    $E_SYS Дж"
echo "3.2 Потужність програми (P_prog):     $P_PROG Вт"
echo "    Енерговитрати програми (E_prog):  $E_PROG Дж"
echo "=============================================="
