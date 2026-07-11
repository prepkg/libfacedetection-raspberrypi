#include <iostream>
#include <facedetection/facedetectcnn.h>

int main() {
    int width = 640;
    int height = 480;
    int step = width * 3;

    unsigned char *img = (unsigned char *) malloc(step * height);
    memset(img, 128, step * height);

    unsigned char *buffer = (unsigned char *) malloc(FACEDETECTION_RESULT_BUFFER_SIZE);
    int *results = facedetect_cnn(buffer, img, width, height, step);
    std::cout << *results << std::endl;

    free(img);
    free(buffer);

    return 0;
}
