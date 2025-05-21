#include <stdio.h>
#include <math.h>
#include <omp.h>
#include <float.h>  

double f(double x, double y) {
    return 100 * y - pow(x, 4) + 1 - pow(x, 2);
}
int main() {
    int id = 2313977;  
    double xl = -(id % 39 + 1) / 39.0;
    double xr = (id % 39 + 1) / 39.0;
    double yl = -(id % 35 + 1) / 35.0;
    double yr = (id % 65 + 1) / 35.0;
    double lambdaX = 0.0000001;
    double lambdaY = 0.0000003;

    int iX = (xr - xl) / lambdaX;
    int iY = (yr - yl) / lambdaY;

    int num_threads = 12;  
    omp_set_num_threads(num_threads);

    double start_time = omp_get_wtime();
    double minimum = DBL_MAX; 

    #pragma omp parallel
    {
        double local_min = DBL_MAX;

        #pragma omp for collapse(2) nowait
        for (int i = 0; i < iX; i++) {
            for (int j = 0; j < iY; j++) {
                double x = xl + i * lambdaX;
                double y = yl + j * lambdaY;
                double value = f(x, y);
                if (value < local_min) {
                    local_min = value;
                }
            }
        }

        #pragma omp critical
        {
            if (local_min < minimum) {
                minimum = local_min;
            }
        }
    }

    double end_time = omp_get_wtime(); 

    printf("Threads: %d\n", num_threads);
    printf("Minimum value: %f\n", minimum);
    printf("Time taken: %f seconds\n", end_time - start_time);

    return 0;
}
