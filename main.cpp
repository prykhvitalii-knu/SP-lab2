#include <iostream>
#include <vector>
#include <chrono>

__attribute__((noinline)) 
void compute_heavy_task(const std::vector<float>& A, const std::vector<float>& B, std::vector<float>& C, size_t size) {
    for (size_t i = 0; i < size; ++i) {
        C[i] = A[i] * B[i] + 1.5f; 
    }
}

int main() {
    const size_t SIZE = 200'000'000;
    
    std::vector<float> A(SIZE, 1.1f);
    std::vector<float> B(SIZE, 2.2f);
    std::vector<float> C(SIZE, 0.0f);

    std::cout << "Starting computation..." << std::endl;
    
    auto start = std::chrono::high_resolution_clock::now();
    
    compute_heavy_task(A, B, C, SIZE);
    
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> diff = end - start;
    
    std::cout << "Time: " << diff.count() << " s\n";
    std::cout << "Control sum: " << C[SIZE / 2] << "\n";

    return 0;
}