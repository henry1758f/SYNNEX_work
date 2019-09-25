#!/bin/bash
# File: OpenVINO_demo_SYNNEX.sh
# 2019/04/16	henry1758f 2.0.0	First Create
# 2019/05/03	henry1758f 2.1.0	security_barrier_camera_demo.sh to stable version
# 2019/05/03	henry1758f 2.2.0	interactive_face_detection_demo add
# 2019/05/03	henry1758f 2.3.0	Crossroad Camera Demo add
# 2019/05/09	henry1758f 2.4.0	classification_demo add and fix support version to v2019.1.133
# 2019/05/09	henry1758f 2.5.0	Object Detection and ASYNC API Demo add
# 2019/05/30	henry1758f 2.5.1	Add ssd_mobilenet_v1,ssd512 and ssd300. Support labels for Object Detection Demo.
# 2019/05/30	henry1758f 2.5.2	Add mobilenet-ssd without labels for Object Detection Demo.
# 2019/06/04	henry1758f 2.5.3	Add add squeezenet1.0 and labels file copy process for classification_demo.
# 2019/06/11	henry1758f 2.5.4	add densenet201/169/161
# 2019/06/13	henry1758f 2.5.5	Fix some error and add googlenet support to mo_dldt
# 2019/06/18	henry1758f 2.5.6	add googlenetv1/v2/v4,Inceptionv3
# 2019/06/18	henry1758f 2.6.0	add Test mode for performance testing in classification demo
# 2019/06/19	henry1758f 2.6.1	Fix googlenet-v4 MO error
# 2019/06/19	henry1758f 2.6.2	add vgg16/19 and fix automatic MO error in classification test mode
# 2019/06/21	henry1758f 2.6.3	Enable all models
# 2019/06/26	henry1758f 2.6.4	Fix error in classification demo
# 2019/06/26	henry1758f 2.6.5	Fix error in classification demo
# 2019/07/04	henry1758f 2.7.0	Add default trick in interactive_face_detection_demo
# 2019/07/04	henry1758f 2.7.1	Add default trick in security_barrier_camera_demo
# 2019/07/04	henry1758f 2.7.2	Add default trick in classification_demo
# 2019/07/04	henry1758f 2.7.3	Add default trick in human_pose_estimation_demo
# 2019/07/10	henry1758f 2.7.4	Add mtcnn_o/p/r but without labels in object dection ssd demo
# 2019/07/11	henry1758f 2.7.5	Fix Github Issue #14
# 2019/07/15	henry1758f 2.7.6	Bug Fixed in security_barrier_camera_demo.
# 2019/07/15	henry1758f 2.7.7	Bug Fixed for 2.7.5 path error
# 2019/07/15	henry1758f 2.7.8	Fix the sample cannot be compile while there's no sample app folder
# 2019/07/18	henry1758f 2.7.9	Bug Fix in Object detection
# 2019/07/18	henry1758f 2.8.0	fixed ssd300/512 location error, add faster_rcnn and some DLDT pretrain models in Object detection Demo
# 2019/07/18	henry1758f 2.9.0	Add some model options for Person Reidentification model and quick demo trick in Crossroad Camera Demo
# 2019/07/25	henry1758f 2.10.0	Add super_resolution_demo
# 2019/08/05	henry1758f 2.11.0	Add benchmark_app from ver3.0.0 and fix mtcnn path error


export VERSION="2.11.0"
export VERSION_VINO="v2019.1.144"
export INTEL_OPENVINO_DIR=/opt/intel/openvino/
export SAMPLE_LOC="$HOME/inference_engine_samples_build/intel64/Release"
export Source_Sample_Build="./Source/sample_build.sh"
export Source_Model_Downloader="./Source/model_downloader.sh"
export SOURCE=./Source/

function Inference_Engine_Sample_List()
{
	echo "|=========================================|"
	echo "|        Intel OpenVINO Demostration      |"
	echo "|        Inference Engine Sample Demo     |"
	echo "|                                         |"
	echo "|=========================================|"
	echo ""
	echo "  0. benchmark_app."
	echo "  1. security_barrier_camera_demo."
	echo "  2. interactive_face_detection_demo."
	echo "  3. classification_demo."
	echo "  4. Human Pose Estimation Demo."
	echo "  5. Object Detection and ASYNC API Demo."
	echo "  6. Crossroad Camera Demo."
	echo "  7. super_resolution_demo (TBD)"
	echo "  8. pedestrian tracker demo (TBD)"
	echo "  9. smart_classroom_demo (TBD)"
	echo " 10. Neural Style Transfer Sample (TBD)"
	echo " 11. Image Segmentation Demo (TBD)"
	echo " 12. Speech Sample (TBD)"

	local choose
	read choose
	case $choose in
		"0")
			echo " You choose benchmark_app ->"
			source ${INTEL_OPENVINO_DIR}/bin/setupvars.sh
			${SOURCE}benchmark_app.sh
			;;
		"1")
			echo " You choose security_barrier_camera_demo ->"
			source ${INTEL_OPENVINO_DIR}/bin/setupvars.sh
			${SOURCE}security_barrier_camera_demo.sh
			;;
		"2")
			echo " You choose interactive_face_detection_demo ->"
			source ${INTEL_OPENVINO_DIR}/bin/setupvars.sh
			${SOURCE}interactive_face_detection_demo.sh
		;;
		"3")
			echo " You choose classification_demo ->"
			source ${INTEL_OPENVINO_DIR}/bin/setupvars.sh
			${SOURCE}classification_demo.sh
		;;
		"4")
			echo " Human Pose Estimation Demo ->"
			source ${INTEL_OPENVINO_DIR}/bin/setupvars.sh
			${SOURCE}human_pose_estimation_demo.sh
			;;
		"5")
			echo " Object Detection and ASYNC API Demo ->"
			source ${INTEL_OPENVINO_DIR}/bin/setupvars.sh
			${SOURCE}object_detection_demo_ssd_async.sh
			;;
		"6")
			echo " Crossroad Camera Demo ->"
			source ${INTEL_OPENVINO_DIR}/bin/setupvars.sh
			${SOURCE}crossroad_camera_demo.sh
		;;
		"7")
			echo " super_resolution_demo ->"
			source ${INTEL_OPENVINO_DIR}/bin/setupvars.sh
			${SOURCE}super_resolution_demo.sh
		;;
		"9")
			echo " smart_classroom_demo ->"
			source ${INTEL_OPENVINO_DIR}/bin/setupvars.sh
			${SOURCE}smart_classroom_demo.sh
		;;
		"12")
			echo " Speech Sample (TBD) ->"
			source ${INTEL_OPENVINO_DIR}/bin/setupvars.sh
			${SOURCE}speech_sample.sh
		;;
		*)
			echo "Please input a vailed number"
			sleep 1
			clear
			banner_show
			Inference_Engine_Sample_List
			;;
	esac

}

function feature_choose()
{
	echo " 1. Inference Engine Sample Demo."
	echo " 2. Model Optimizer Demo. (TBD)"
	test -e ${SAMPLE_LOC}/benchmark_app && echo " 3. Sample Build.(Done!)" || echo " 3. Sample Build."
	echo " 4. Model Downloader."


	local choose
	read choose
	case $choose in
		"1")
			Inference_Engine_Sample_List
		;;
		"2")
			#echo "Sorry, The Model Optimizer Demo isn't ready..."
			Model_Optimizer_Sample_List
			;;
		"3")
			$Source_Sample_Build
			clear
			banner_show
			feature_choose
		;;
		"4")
			$Source_Model_Downloader
			clear
			banner_show
			feature_choose
		;;
		*)
			echo "Please input a vailed number"
			sleep 1
			clear
			banner_show
			feature_choose
			;;
	esac

}

function banner_show()
{
	echo
	echo "|=========================================|"
	echo "|  SYNNEX TECHNOLOGY INTERNATIONAL CORP.  |"
	echo "|                                         |"
	echo "|        Intel OpenVINO Demostration      |"
	echo "|=========================================|"
	echo "  Ver. $VERSION | Support OpenVINO $VERSION_VINO"
	echo ""
}


banner_show
feature_choose


