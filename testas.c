#include <stdio.h>
#include <omp.h>

int main() {
    // Get the number of available processing units (cores)
    int num_processors = omp_get_num_procs();

    printf("Number of processors available: %d\n", num_processors);

    return 0;
}
