# OpenVINO Demo Kit
This is a tool that can make you run intel openVINO Demos and samples easily. No need to run those demo and sample apps manully with long parameters and path. Also, this Demo_Kits support to run benchmark app with multiple models and output the test result by a .csv file.
* * * * 
# Contents
* [Getting Start](#getting-start)
* [Inference Engine Sample Demo](#inference-engine-sample-demo)
  * [1. Security Barrier Camera Demo](#1-security_barrier_camera_demo)
  * [2. Interactive Face Detection Demo](#2-interactive_face_detection_demo)
  * [3. Classification Demo](#3-classification_demo)
  * [4. Human Pose Estimation Demo](#4-human-pose-estimation-demo)
  * [5. Object Detection SSD Demo](#5-object-detection-ssd-demo)
  * [6. Crossroad Camera Demo](#6-crossroad-camera-demo)
  * [7. Super Resolution Demo](#7-super_resolution_demo)
  * [8. Pedestrian Tracker Demo](#8-pedestrian-tracker-demo)
  * [9. Smart Classroom Demo](#9-smart_classroom_demo)
  * [10. Image Segmentation Demo](#10-Image-Segmentation-Demo)
  * [11. Instance Segmentation Demo](#11-Instance-Segmentation-Demo)
  * [12. Gaze Estimation Demo](#12-Gaze-Estimation-Demo)
  * [13. Text Detection Demo](#13-Text-Detection-Demo)
  * [14. Action Recognition Demo](#14-Action-Recognition-Demo)
  * [15. Multi Camera Multi Person Tracking Demo](#15-Multi-Camera-Multi-Person-Tracking-Demo)
  * [16. Face Recognition Demo](#16-Face-Recognition-Demo)
  * [17. Offline Speech Recognition Demo](#17-Offline-Speech-Recognition-Demo)
  * [18. Live Speech Recognition Demo](#18-Live-Speech-Recognition-Demo)
* [Sample Build](#sample-build)
* [Model Downloader](#model-downloader)
* * * * 
# Getting Start
This project support Intel OpenVINO Toolkits installed on Ubuntu 18.04 allows you to quick-running OpenVINO's Demos, please follow the steps form the [install guide](https://docs.openvinotoolkit.org/2020.3/_docs_install_guides_installing_openvino_linux.html#install-openvino), install Intel OpenVINO Toolkits (version 2020.3) at default path, 
After the installation, clone this repository to your home directory by using terminal command.

    cd ~
    git clone https://github.com/henry1758f/OpenIVNO_Demo_Kit.git
Go to the folder and run this tool

    cd ~/OpenVINO_Demo_Kit
    ./Demo_Kits.sh
The Termainal will show the version of this Demo_Kits and the support version of the OpenVINO.
The Demo_Kits will show you 4 operations:
##### 1. [Inference Engine Sample Demo](#inference-engine-sample-demo)
##### 2. [Sample Build](#sample-build)
##### 3. [Model Downloader](#model-downloader)
##### 4. [Query Device](#query-device)

# Inference Engine Sample Demo
## 1. security_barrier_camera_demo
  This demo showcases Vehicle and License Plate Detection network followed by the Vehicle Attributes and License Plate Recognition applied on top of Vehicle Detection results.
  
  For more information, please visit [Security Barrier Camera Demo](https://docs.openvinotoolkit.org/2020.3/_demos_security_barrier_camera_demo_README.html) on Intel's Website
### How to run the demo
#### Select a vehicle and license detection model
* After type in the number of security_barrier_camera_demo and pressed the enter key, the terminal would ask you to select a vehicle and license detection model, and give you a list that is available to choose:

      [Select a vehicle and license detection model.]
      >> 1. vehicle-license-plate-detection-barrier-0106 
      >> 2. vehicle-license-plate-detection-barrier-0106-fp16 
      >> Or input a path to your model 

  At this moment, you can type in the represent number to choose which dldt model you want to inference to detect vehicle and license plate,
  You can also type in the direct PATH to the model you want to use.

     *There's a trick that type-in "0" then press enter, it will choose the default model of vehicle and license detection model,Vehicle  Attributes recognition model and License Plate Recognition model, set all running on CPU and load default image in openvino toolkits. This trick can quickly run this demo.*

* After you choose the vehicle and license detection model, it will ask you what device you want to inference 

      >> CPU(FP32),GPU(FP32/16),MYRIAD(FP16),HDDL(FP16),HETERO...Please choose your target device.
   Just type in "CPU","GPU","MYRIAD","HDDL"... to assign your inference device.

   **Whatever you choose the default dldt model or the model your own, if you want to inference on CPU it can only support FP32 and INT8 format IR file(.xml), GPU support FP32 and FP16(Recommanded), MYRIAD support FP16**
#### Select a Vehicle Attributes recognition model
* After you choosing the vehicle and license detection model and assign to hardware inference device, It will ask you to choose Vehicle Attributes recognition model:

      [Select a Vehicle Attributes recognition model.]
      >> 1. vehicle-attributes-recognition-barrier-0039 
      >> 2. vehicle-attributes-recognition-barrier-0039-fp16 
      >> 3. input a path to your model 
      >> Or press ENTER to ignore it. 
  Just like choosing vehicle and license detection model, input the represent number of the dldt model or type in the PATH by yourself to load your model. 
  
  You can also just press "Enter" without keyin any words to ignore this step. 
  If you ignore this step, the demo application won't do Vehicle Attributes recognition.
* After you choose the Vehicle Attributes recognition model, it will also ask you which device you want to inference 
#### Select a License Plate Recognition model
* After you choosing the Vehicle Attributes recognition model and assign to hardware inference device, It will ask you to choose License Plate Recognition model:

      [Select a License Plate Recognition model.]"
      >> 1. license-plate-recognition-barrier-0001 "
      >> 2. license-plate-recognition-barrier-0001-fp16 "
      >> 3. input a path to your model "
      >> Or press ENTER to ignore it. "
  Just follow the same way before.
#### Setup the input data
* After you choose the License Plate Recognition model and assign to hardware inference device, you should setup an input data for model and application to inference:
      >> input "cam" for using camera as inference source,"0" for default Source, or typein the path to the source you want.
      


1. Input "cam" : Set the defalut camera that install on your system as an input video stream. 
  
2. Input "0" : Set the default chinese car image in openVINO toolkits as an input image.
  
3. Input an image, video or camera file location as an input image/video. Multiple source is available, for example, if you have multiple camera, type-in "/dev/video0 /dev/video1 /dev/video2"

## 2. interactive_face_detection_demo
This demo showcases Object Detection task applied for face recognition using sequence of neural networks. Async API can improve overall frame-rate of the application, because rather than wait for inference to complete, the application can continue operating on the host while accelerator is busy. This demo executes four parallel infer requests for the Age/Gender Recognition, Head Pose Estimation, Emotions Recognition, and Facial Landmarks Detection networks that run simultaneously.

  For more information, please visit [Interactive Face Detection Demo]( https://docs.openvinotoolkit.org/2020.3/_demos_interactive_face_detection_demo_README.html) on Intel's Website

### How to run the demo
#### Select a Face Detection model
* After type in the number of interactive_face_detection_demo, pressed the enter key, the terminal would ask you to select a Face Detection model, and give you a list that is available to choose:

      [Select a Face Detection model.]
      >> 1. face-detection-adas-0001 
      >> 2. face-detection-adas-0001-fp16 
      >> 3. face-detection-retail-0004
      >> 4. face-detection-retail-0004-fp16
      >> Or input a path to your model 

  At this moment, you can type in the represent number to choose which dldt model you want to inference to detect Human face,
  You can also type in the direct PATH to the model you want to use.

     *There's a trick that type-in "0" then press enter, it will choose the default model of Face Detection model, Age gender recognition model, Headpose Estimation model, Emotions recognition model  and Facial Landmarks model, set all running on CPU and load camera as input source(Make sure you have camera connect to your device.). This trick can quickly run this demo.* 
     __In this demo case,  running totally 5 models on the same device may cause lower performance__
     
* After you choose the Face Detection model, it will ask you which device you want to inference 

      >> CPU(FP32),GPU(FP32/16),MYRIAD(FP16),HDDL(FP16),HETERO...Please choose your target device.
   Just type in "CPU","GPU","MYRIAD","HDDL"... to assign your inference device.

   **Whatever you choose the default dldt model or the model your own, if you want to inference on CPU it can only support FP32 and INT8 format IR file(.xml), GPU support FP32 and FP16(Recommanded), MYRIAD/HDDL support FP16**
#### Select a Age gender recognition model
* After you choose the Face Detection model and assign to hardware inference device, It will ask you to choose Age gender recognition model:

      [Select a Age gender recognition model.]
      >> 1. age-gender-recognition-retail-0013 
      >> 2. age-gender-recognition-retail-0013-fp16 
      >> 3. input a path to your model 
      >> Or press ENTER to ignore it. 
  Just like choosing vehicle and license detection model, input the represent number of the dldt model or type in the PATH by yourself to load your model. 
  
  You can also just press "Enter" without keyin any words to ignore this step. 
  If you ignore this step, the demo application won't do Age gender recognition.
* After you choose the Age gender recognition model, it will also ask you which device you want to inference 
#### Select a Headpose Estimation model
* After you choose the Age gender recognition model and assign to hardware inference device, It will ask you to choose Headpose Estimation model:

      [Select a Headpose Estimation model.]
      >> 1. head-pose-estimation-adas-0001 
      >> 2. head-pose-estimation-adas-0001-fp16 
      >> 3. input a path to your model 
      >> Or press ENTER to ignore it. 
  Just like choosing Age gender recognition model, input the represent number of the dldt model or type in the PATH by yourself to load your model. 
  
  You can also just press "Enter" without keyin any words to ignore this step. 
  If you ignore this step, the demo application won't do Headpose Estimation.
* After you choose the Headpose Estimation model, it will also ask you which device you want to inference 
#### Select a Emotions recognition model
* After you choose the Headpose Estimation model and assign to hardware inference device, It will ask you to choose Emotions recognition model:

      [Select a Emotions recognition model.]
      >> 1. emotions-recognition-retail-0003 
      >> 2. emotions-recognition-retail-0003-fp16 
      >> 3. input a path to your model 
      >> Or press ENTER to ignore it. 
  Just like choosing Headpose Estimation model, input the represent number of the dldt model or type in the PATH by yourself to load your model. 
  
  You can also just press "Enter" without keyin any words to ignore this step. 
  If you ignore this step, the demo application won't do Emotions recognition.
* After you choose the Emotions recognition model, it will also ask you which device you want to inference 
#### Select a Facial Landmarks model
* After you choose the Emotions recognition model and assign to hardware inference device, It will ask you to choose Facial Landmarks model:

      [Select a Facial Landmarks model.]
      >> 1. facial-landmarks-35-adas-0002 
      >> 2. facial-landmarks-35-adas-0002-fp16 
      >> 3. input a path to your model 
      >> Or press ENTER to ignore it. 
  Just like choosing Emotions recognition model, input the represent number of the dldt model or type in the PATH by yourself to load your model. 
  
  You can also just press "Enter" without keyin any words to ignore this step. 
  If you ignore this step, the demo application won't do Facial Landmarks.
* After you choose the Emotions recognition model, it will also ask you which device you want to inference 
#### Setup the input data
* After you choose the License Plate Recognition model and assign to hardware inference device, you should setup an input data for model and application to inference:
      >> input "cam" for using camera as inference source,"0" for default Source, or typein the path to the source you want.
      
1. Input "cam" or "0": Set the defalut camera that install on your system as an input video stream. 
  
2. Input an image, video or camera file location as an input image/video. Multiple source is __NOT__ available for this demo case.
## 3. classification_demo
  This topic demonstrates how to run the Image Classification sample application, which does inference using image classification networks like AlexNet* and GoogLeNet*.
  
  For more information, please visit [Image Classification Sample async](https://docs.openvinotoolkit.org/2020.3/_inference_engine_samples_classification_sample_async_README.html) and [Image Classification Sample](https://docs.openvinotoolkit.org/2020.3/_inference_engine_samples_classification_sample_README.html) on Intel's Website

### How to run the demo
#### Select to Use ASYNC API demo case or not
* OpenVINO image classification sample code has async show case, which can increase the performance of the result. for more detailed  information about async api, please refer to [this website](https://docs.openvinotoolkit.org/latest/_inference_engine_samples_object_detection_demo_ssd_async_README.html)
* After type in the number of classification_demo, pressed the "Enter" key, the terminal would ask you:

      With ASYNC Demo ??(Y/n) >>
  Key-in "Y" to run with async api, "n" to run without async. Then hit "Enter".
#### Select an image classification model
* In this demo, there are over 23 kinds of neural network topology list on terminal:
         
       [ASYNC API] Select Image Classification Model >>>
       1. squeezenet1.1.xml [FP32]
       2. squeezenet1.1.xml [FP16] File lost! Need to Download and Transfer to IR
       3. squeezenet1.0.xml [FP32]	File lost! Need to Download and Transfer to IR
       4. squeezenet1.0.xml [FP16] File lost! Need to Download and Transfer to IR
       5. alexnet.xml [FP32]
       6. alexnet.xml [FP16]
       7. densenet-201.xml [FP32]
       8. densenet-201.xml [FP16]
       9. densenet-169.xml [FP32]
      10. densenet-169.xml [FP16]
      11. densenet-161.xml [FP32]
      12 . densenet-161.xml [FP16]
      13. densenet-121.xml [FP32]
      14. densenet-121.xml [FP16]
      15. googlenet-v1.xml [FP32]
                ...
      42. se-resnext-101.xml [FP16]
      43. vgg16.xml [FP32] File lost! Need to Download and Transfer to IR
      44. vgg16.xml [FP16]
      45. vgg19.xml [FP32] File lost! Need to Download and Transfer to IR
      46. vgg19.xml [FP16]
       >> Or input a path to your model 
   each neural network topology has FP16 and FP32 datatype can be select.
* If there's a message shows 

      "File lost! Need to Download and Transfer to IR"
  , means the model hasn't transfer to IR format yet, so the IR file cannot been detect. If that's the model you want to inference, just key in the number of that model, it will try to run model optimizer to convert the original caffe or tensorflow model to IR format automatically. Then run the sample application with the model you choose.
  
      Top 10 results:
      Image /opt/intel/openvino/deployment_tools/demo/car.png
      classid probability label
      ------- ----------- -----
      817     0.8363345   sports car, sport car
      511     0.0946488   convertible
      479     0.0419131   car wheel
      751     0.0091071   racer, race car, racing car
      436     0.0068161   beach wagon, station wagon, wagon, estate car, beach waggon, station waggon, waggon
      656     0.0037564   minivan
      586     0.0025741   half track
      717     0.0016069   pickup, pickup truck
      864     0.0012027   tow truck, tow car, wrecker
      581     0.0005882   grille, radiator grille

      total inference time: 2162.6696587
      Throughput: 462.3914688 FPS
      [ INFO ] Execution successful
Finally, the top 10 classification result and the inference throughput will printed in terminal.

## 4. Human Pose Estimation Demo.
  This demo showcases the work of multi-person 2D pose estimation algorithm. The task is to predict a pose: body skeleton, which consists of keypoints and connections between them, for every person in an input video. The pose may contain up to 18 keypoints: ears, eyes, nose, neck, shoulders, elbows, wrists, hips, knees, and ankles. Some of potential use cases of the algorithm are action recognition and behavior understanding.
  
  For more information, please visit [Human Pose Estimation Demo](https://docs.openvinotoolkit.org/2020.3/_demos_human_pose_estimation_demo_README.html) on Intel's Website
  
### How to run the demo
#### Select a Human Pose Estimation model
* After type in the number of Human Pose Estimation Demo, pressed the enter key, the terminal would ask you to select a Human Pose Estimation model, and give you a list that is available to choose:

      [Select a Human Pose Estimation model]
      >> 1. human-pose-estimation-0001 
      >> 2. human-pose-estimation-0001-fp16 
      >> Or input a path to your model 
  At this moment, you can type in the represent number to choose which dldt model you want to inference to Estimate Human Pose,
  You can also type in the direct PATH to the model you want to use.
  
* After you choose the Emotions recognition model, it will also ask you which device you want to inference 

      >> CPU(FP32),GPU(FP32/16),MYRIAD(FP16),HDDL(FP16),HETERO...Please choose your target device.
   Just type in "CPU","GPU","MYRIAD","HDDL"... to assign your inference device.

   **Whatever you choose the default dldt model or the model your own, if you want to inference on CPU it can only support FP32 and INT8 format IR file(.xml), GPU support FP32 and FP16(Recommanded), MYRIAD/HDDL support FP16**

#### Setup the input data
* After you choose the Human Pose Estimation model and assign to hardware inference device, you should setup an input data for model and application to inference:
      >> input "cam" for using camera as inference source,"0" for default Source, or typein the path to the source you want.
      
1. Input "cam" or "0": Set the defalut camera that install on your system as an input video stream. 
  
2. Input an image, video or camera file location as an input image/video. Multiple source is __NOT__ available for this demo case.
  
## 5. Object Detection SSD Demo
  This demonstration showcases Object Detection with SSD and new Async API. Async API usage can improve overall frame-rate of the application, because rather than wait for inference to complete, the app can continue doing things on the host, while accelerator is busy. Specifically, this demonstration keeps two parallel infer requests and while the current is processed, the input frame for the next is being captured. 
  
  For more information, please visit [Object Detection SSD Demo](https://docs.openvinotoolkit.org/2020.3/_inference_engine_samples_object_detection_sample_ssd_README.html) and [Object Detection SSD Demo, Async API Performance Showcase](https://docs.openvinotoolkit.org/2020.3/_demos_object_detection_demo_ssd_async_README.html) on Intel's Website
  
## 6. Crossroad Camera Demo
  This demo provides an inference pipeline for person detection, recognition and reidentification. The demo uses Person Detection network followed by the Person Attributes Recognition and Person Reidentification Retail networks applied on top of the detection results. 

  For more information, please visit [Crossroad Camera Demo](https://docs.openvinotoolkit.org/2020.3/_demos_crossroad_camera_demo_README.html) on Intel's Website

## 7. Super Resolution Demo
  This topic demonstrates how to run the Super Resolution demo application, which reconstructs the high resolution image from the original low resolution one.
  
  For more information, please visit [Super Resolution Demo](https://docs.openvinotoolkit.org/2020.3/_demos_super_resolution_demo_README.html) on Intel's Website
  
## 8. Pedestrian Tracker Demo
  This demo showcases Pedestrian Tracking scenario: it reads frames from an input video sequence, detects pedestrians in the frames, and builds trajectories of movement of the pedestrians in a frame-by-frame manner. 
  
  
  For more information, please visit [Pedestrian Tracker Demo](https://docs.openvinotoolkit.org/2020.3/_demos_pedestrian_tracker_demo_README.html) on Intel's Website
## 9. Smart Classroom Demo
  The demo demonstrates an example of joint usage of several neural networks to detect three basic actions (sitting, standing, raising hand) and recognize people by faces in the classroom environment. The demo uses Async API for action and face detection nets. It allows to parallelize execution of face recognition and detection: while face recognition is running on one accelerator, face and action detection can be performed on other. 
  
  For more information, please visit [Smart Classroom Demo](https://docs.openvinotoolkit.org/2020.3/_demos_smart_classroom_demo_README.html) on Intel's Website
  
## 10 Image Segmentation Demo
  Demonstrates how to run the Image Segmentation demo application, which does inference using semantic segmentation networks. 
    
  For more information, please visit [Image Segmentation C++ Demo](https://docs.openvinotoolkit.org/2020.3/_demos_segmentation_demo_README.html) on Intel's Website
  
## 11 Instance Segmentation Demo
  This demo shows how to run Instance Segmentation models from Detectron or maskrcnn-benchmark using OpenVINO™. These models should be obtained through [OpenVINO™ Training Extensions (OTE)](https://github.com/opencv/openvino_training_extensions/tree/develop/pytorch_toolkit/instance_segmentation#get-pretrained-models).
    
  For more information, please visit [Instance Segmentation Python* Demo](https://docs.openvinotoolkit.org/2020.3/_demos_python_demos_instance_segmentation_demo_README.html) on Intel's Website
  
## 12 Gaze Estimation Demo
  This demo showcases the work of gaze estimation model. The corresponding pre-trained model gaze-estimation-adas-0002 is delivered with the product.
  
  For more information, please visit [Gaze Estimation Demo](https://docs.openvinotoolkit.org/2020.3/_demos_gaze_estimation_demo_README.html) on Intel's Website
  
## 13 Text Detection Demo
  The demo shows an example of using neural networks to detect and recognize printed text rotated at any angle in various environment.
  
  For more information, please visit [Text Detection C++ Demo](https://docs.openvinotoolkit.org/2020.3/_demos_text_detection_demo_README.html) on Intel's Website
  
## 14 Action Recognition Demo
  This is the demo application for Action Recognition algorithm, which classifies actions that are being performed on input video.
  
  For more information, please visit [Action Recognition Python* Demo](https://docs.openvinotoolkit.org/2020.3/_demos_python_demos_action_recognition_README.html) on Intel's Website
  
## 15 Multi Camera Multi Person Tracking Demo
  This demo demonstrates how to run Multi Camera Multi Person demo using OpenVINO.
  
  For more information, please visit [Text Detection C++ Demo](https://docs.openvinotoolkit.org/2020.3/_demos_python_demos_multi_camera_multi_person_tracking_README.html) on Intel's Website
  
## 16 Face Recognition Demo
  This example demonstrates an approach to create interactive applications for video processing. It shows the basic architecture for building model pipelines supporting model placement on different devices and simultaneous parallel or sequential execution using OpenVINO library in Python. In particular, this demo uses 3 models to build a pipeline able to detect faces on videos, their keypoints (aka "landmarks"), and recognize persons using the provided faces database (the gallery). 
  
  For more information, please visit [Interactive Face Recognition Demo](https://docs.openvinotoolkit.org/2020.3/_demos_python_demos_face_recognition_demo_README.html) on Intel's Website
  
## 17 Offline Speech Recognition Demo
  This demo provides a command-line interface for automatic speech recognition using OpenVINO™. Components used by this executable:
  
    > lspeech_s5_ext model - Example pretrained LibriSpeech DNN
    > speech_library.dll (.so) - 
      Open source speech recognition library that uses OpenVINO™ Inference Engine, 
      Intel® Speech Feature Extraction and Intel® Speech Decoder libraries
  
  For more information, please visit [Offline Speech Recognition Demo](https://docs.openvinotoolkit.org/2020.3/_inference_engine_samples_speech_libs_and_demos_Offline_speech_recognition_demo.html) on Intel's Website
  
## 18 Live Speech Recognition Demo
  This demo provides a GUI interface for automatic speech recognition using selected OpenVINO™ Inference Engine plugin, OpenVINO™ Feature Extraction Library, and OpenVINO™ Decoder Library.
  
  For more information, please visit [Live Speech Recognition Demo](https://docs.openvinotoolkit.org/2020.3/_inference_engine_samples_speech_libs_and_demos_Live_speech_recognition_demo.html) on Intel's Website
  
* * * * 
# Sample Build
If you have successfully build the openVINO sample, the terminal will show as following

    3. Sample Build.(Done!)
    
If not yet, It will not show "Done!" and those sample code need to be build in order to run the samples.
type in "3" and press "Enter" key, Those sample code will be build automatically.

* * * * 
# Model Downloader
In openVINO sample application, DLDT models usually needed. If you have not downloaded those necessary models, you have to run the downloader.

In the Model Downloader Interface, there are 4 options

    |=========================================|
    |  SYNNEX TECHNOLOGY INTERNATIONAL CORP.  |
    |                                         |
    |            Model Downloader             |
    |=========================================|
      Ver. 0.X.X | Support OpenVINO v2019.X.XXX
    1. Download all from DLDT.
    2. Typein specific DLDT model.
    3. Typein an URL of the model.
    4. EXIT the downloader.
### 1. Download all from DLDT.

 This option will download all the model list on model downloader's yml file, more than 9.6GB models and IR file will be download, please make sure there's enough free space for these files.

### 2. Typein specific DLDT model.

 This option will show you all the available models on the list, you can copy the name of the model and type in the model name to download specific model.

### 3. Typein an URL of the model.

 This option will download the file directly refer to the URL that type in.

### 4. EXIT the downloader.
* * * * 
