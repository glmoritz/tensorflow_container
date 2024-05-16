import tensorflow as tf
from tensorflow.python.client import device_lib

def main() -> None:
        print("-------------- Hello Tensorflow Container --------------")                 
        gpu_devices = tf.config.experimental.list_physical_devices('GPU')
        for device in gpu_devices:
            print(gpu_devices)

if __name__ == "__main__":
    main()
