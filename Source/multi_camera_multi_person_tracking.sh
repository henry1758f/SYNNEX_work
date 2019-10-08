#!/bin/bash
# File: multi_camera_multi_person_tracking.sh
# 2019/10/07	henry1758f 0.0.1	First Create

export INTEL_OPENVINO_DIR=/opt/intel/openvino/
export SAMPLE_LOC="$HOME/inference_engine_samples_build/intel64/Release"
export DEMO_LOC="$HOME/inference_engine_demos_build/intel64/Release"
export MODEL_LOC=$HOME/openvino_models/models/SYNNEX_demo
select_inf=" >> CPU,GPU,MYRIAD(FP16),HDDL(FP16),HETERO...Please choose your target device."
config_path="/opt/intel/openvino/inference_engine/demos/python_demos/multi_camera_multi_person_tracking/config.py"
requirements_path="/opt/intel/openvino/inference_engine/demos/python_demos/multi_camera_multi_person_tracking/requirements.txt"

function banner_show()
{
	echo "|=========================================|"
	echo "|     Multi Camera Multi Person demo      |"
	echo "|=========================================|"
}


function model_0_choose()
{
	echo " [Select a Pedestrian Detection Retail model]"
	echo " >> 1. person-detection-retail-0013.xml 	[FP32] "
	echo " >> 2. person-detection-retail-0013.xml 	[FP16] "
	echo " >> 3. person-detection-retail-0013.xml 	[INT8] "
	echo " >> 4. person-detection-retail-0002.xml 	[FP32] "
	echo " >> 5. person-detection-retail-0002.xml 	[FP16] "

	echo " >> 6. pedestrian-detection-adas-0002.xml 	[FP32] "
	echo " >> 7. pedestrian-detection-adas-0002.xml 	[FP16] "
	echo " >> 8. pedestrian-detection-adas-0002.xml 	[INT8] "
	echo " >> 9. pedestrian-detection-adas-binary-0001.xml 	[INT1] "
	echo " >> 10. pedestrian-and-vehicle-detector-adas-0001.xml 	[FP32] "
	echo " >> 11. pedestrian-and-vehicle-detector-adas-0001.xml 	[FP16] "
	echo " >> 12. pedestrian-and-vehicle-detector-adas-0001.xml 	[INT8] "

	echo " >> 13. person-vehicle-bike-detection-crossroad-0078.xml 	[FP32] "
	echo " >> 14. person-vehicle-bike-detection-crossroad-0078.xml 	[FP16] "
	echo " >> 15. person-vehicle-bike-detection-crossroad-0078.xml 	[INT8] "
	echo " >> 16. person-vehicle-bike-detection-crossroad-1016.xml 	[FP32] "
	echo " >> 17. person-vehicle-bike-detection-crossroad-1016.xml 	[FP16] "
	echo " >> Or input a path to your model "
	local choose
	read choose
	case $choose in
		"1")
			echo " person-detection-retail-0013.xml 	[FP32] ->"
			MODEL_LOC_0=${MODEL_LOC}/intel/person-detection-retail-0013/FP32/person-detection-retail-0013.xml
			inference_D_choose
		;;
		"2")
			echo " person-detection-retail-0013.xml 	[FP16] ->"
			MODEL_LOC_0=${MODEL_LOC}/intel/person-detection-retail-0013/FP16/person-detection-retail-0013.xml
			inference_D_choose
		;;
		"3")
			echo " person-detection-retail-0013.xml 	[INT8] ->"
			MODEL_LOC_0=${MODEL_LOC}/intel/person-detection-retail-0013/INT8/person-detection-retail-0013.xml
			inference_D_choose
		;;
		"4")
			echo " person-detection-retail-0002.xml 	[FP32] ->"
			MODEL_LOC_0=${MODEL_LOC}/intel/person-detection-retail-0002/FP32/person-detection-retail-0002.xml
			inference_D_choose
		;;
		"5")
			echo " person-detection-retail-0002.xml 	[FP16] ->"
			MODEL_LOC_0=${MODEL_LOC}/intel/person-detection-retail-0002/FP16/person-detection-retail-0002.xml
			inference_D_choose
		;;

		"6")
			echo " pedestrian-detection-adas-0002.xml 	[FP32] ->"
			MODEL_LOC_0=${MODEL_LOC}/intel/pedestrian-detection-adas-0002/FP32/pedestrian-detection-adas-0002.xml
			inference_D_choose
		;;
		"7")
			echo " pedestrian-detection-adas-0002.xml 	[FP16] ->"
			MODEL_LOC_0=${MODEL_LOC}/intel/pedestrian-detection-adas-0002/FP16/pedestrian-detection-adas-0002.xml
			inference_D_choose
		;;
		"8")
			echo " pedestrian-detection-adas-0002.xml 	[INT8] ->"
			MODEL_LOC_0=${MODEL_LOC}/intel/pedestrian-detection-adas-0002/INT8/pedestrian-detection-adas-0002.xml
			inference_D_choose
		;;
		"9")
			echo " pedestrian-detection-adas-binary-0001.xml 	[INT1] ->"
			MODEL_LOC_0=${MODEL_LOC}/intel/pedestrian-detection-adas-binary-0001/INT1/pedestrian-detection-adas-binary-0001.xml
			inference_D_choose
		;;
		"10")
			echo " pedestrian-and-vehicle-detector-adas-0001.xml 	[FP32] ->"
			MODEL_LOC_0=${MODEL_LOC}/intel/pedestrian-and-vehicle-detector-adas-0001/FP32/pedestrian-and-vehicle-detector-adas-0001.xml
			inference_D_choose
		;;
		"11")
			echo " pedestrian-and-vehicle-detector-adas-0001.xml 	[FP16] ->"
			MODEL_LOC_0=${MODEL_LOC}/intel/pedestrian-and-vehicle-detector-adas-0001/FP16/pedestrian-and-vehicle-detector-adas-0001.xml
			inference_D_choose
		;;
		"12")
			echo " pedestrian-and-vehicle-detector-adas-0001.xml 	[INT8] ->"
			MODEL_LOC_0=${MODEL_LOC}/intel/pedestrian-and-vehicle-detector-adas-0001/INT8/pedestrian-and-vehicle-detector-adas-0001.xml
			inference_D_choose
		;;

		"13")
			echo " person-vehicle-bike-detection-crossroad-0078.xml 	[FP32] ->"
			MODEL_LOC_0=${MODEL_LOC}/intel/person-vehicle-bike-detection-crossroad-0078/FP32/person-vehicle-bike-detection-crossroad-0078.xml
			inference_D_choose
		;;
		"14")
			echo " person-vehicle-bike-detection-crossroad-0078.xml 	[FP16] ->"
			MODEL_LOC_0=${MODEL_LOC}/intel/person-vehicle-bike-detection-crossroad-0078/FP16/person-vehicle-bike-detection-crossroad-0078.xml
			inference_D_choose
		;;
		"15")
			echo " person-vehicle-bike-detection-crossroad-0078.xml 	[INT8] ->"
			MODEL_LOC_0=${MODEL_LOC}/intel/person-vehicle-bike-detection-crossroad-0078/INT8/person-vehicle-bike-detection-crossroad-0078.xml
			inference_D_choose
		;;
		"16")
			echo " person-vehicle-bike-detection-crossroad-1016.xml 	[FP32] ->"
			MODEL_LOC_0=${MODEL_LOC}/intel/person-vehicle-bike-detection-crossroad-1016/FP32/person-vehicle-bike-detection-crossroad-1016.xml
			inference_D_choose
		;;
		"17")
			echo " person-vehicle-bike-detection-crossroad-1016.xml 	[FP16] ->"
			MODEL_LOC_0=${MODEL_LOC}/intel/person-vehicle-bike-detection-crossroad-1016/FP32/person-vehicle-bike-detection-crossroad-1016.xml
			inference_D_choose
		;;

		"0")
			return 1
		;;
		*)
			echo " Model PATH=${choose}"
			MODEL_LOC_0=${choose}
			inference_D_choose
			;;
	esac
}
function model_1_choose()
{
	echo " [Select a Person Reidentification model.]"
	echo " >> 1. person-reidentification-retail-0031.xml 	[FP32] "
	echo " >> 2. person-reidentification-retail-0031.xml 	[FP16] "
	echo " >> 3. person-reidentification-retail-0031.xml 	[INT8] "
	echo " >> 4. person-reidentification-retail-0076.xml 	[FP32] "
	echo " >> 5. person-reidentification-retail-0076.xml 	[FP16] "
	echo " >> 6. person-reidentification-retail-0076.xml 	[INT8] "
	echo " >> 7. person-reidentification-retail-0079.xml 	[FP32] "
	echo " >> 8. person-reidentification-retail-0079.xml 	[FP16] "
	echo " >> 9. person-reidentification-retail-0079.xml 	[INT8] "
	echo " >>10. input a path to your model "

	local choose
	read choose
	case $choose in
		"1")
			echo " person-reidentification-retail-0031.xml 	[FP32] ->"
			MODEL_LOC_1="--m_reid ${MODEL_LOC}/intel/person-reidentification-retail-0031/FP32/person-reidentification-retail-0031.xml"
			
		;;
		"2")
			echo " person-reidentification-retail-0031.xml 	[FP16] ->"
			MODEL_LOC_1="--m_reid ${MODEL_LOC}/intel/person-reidentification-retail-0031/FP16/person-reidentification-retail-0031.xml"
			
		;;
		"3")
			echo " person-reidentification-retail-0031.xml 	[INT8] ->"
			MODEL_LOC_1="--m_reid ${MODEL_LOC}/intel/person-reidentification-retail-0031/INT8/person-reidentification-retail-0031.xml"
			
		;;
		"4")
			echo " person-reidentification-retail-0076.xml 	[FP32] ->"
			MODEL_LOC_1="--m_reid ${MODEL_LOC}/intel/person-reidentification-retail-0076/FP32/person-reidentification-retail-0076.xml"
			
		;;
		"5")
			echo " person-reidentification-retail-0076.xml 	[FP16] ->"
			MODEL_LOC_1="--m_reid ${MODEL_LOC}/intel/person-reidentification-retail-0076/FP16/person-reidentification-retail-0076.xml"
			
		;;
		"6")
			echo " person-reidentification-retail-0076.xml 	[INT8] ->"
			MODEL_LOC_1="--m_reid ${MODEL_LOC}/intel/person-reidentification-retail-0076/INT8/person-reidentification-retail-0076.xml"
			
		;;
		"7")
			echo " person-reidentification-retail-0079.xml 	[FP32] ->"
			MODEL_LOC_1="--m_reid ${MODEL_LOC}/intel/person-reidentification-retail-0079/FP32/person-reidentification-retail-0079.xml"
			
		;;
		"8")
			echo " person-reidentification-retail-0079.xml 	[FP16] ->"
			MODEL_LOC_1="--m_reid ${MODEL_LOC}/intel/person-reidentification-retail-0079/FP16/person-reidentification-retail-0079.xml"
			
		;;
		"9")
			echo " person-reidentification-retail-0079.xml 	[INT8] ->"
			MODEL_LOC_1="--m_reid ${MODEL_LOC}/intel/person-reidentification-retail-0079/INT8/person-reidentification-retail-0079.xml"
			
		;;
		"10")
			echo " PATH to your model ->"
			MODEL_LOC_1="--m_reid ${choose}"
			
		;;
		*)
			echo " Model PATH=${choose}"
			MODEL_LOC_1="--m_reid ${choose}"
			
		;;
	esac
}

function source_choose()
{
	echo " >> input the camera number to use that camera as inference source (eq. /dev/video0 then typein 0), or typein the path to the source you want."
	read choose
	if [ $choose == "0" ];then
		retuen 0
	else
		I_SOURCE=$choose
	fi

}
function output_choose()
{
	
	if [ $1 == "Y" ];then
		cap_time=$(date +'%Y%m%d_%H%M%S')
		test -e $HOME/Videos/multi_camera_multi_person_tracking/ || mkdir $HOME/Videos/multi_camera_multi_person_tracking/
		OUTPUT_PATH="--output_video $HOME/Videos/multi_camera_multi_person_tracking/Output_Video_${cap_time}.mp4"
	else
		OUTPUT_PATH=""
	fi

}
function set_default()
{
	#echo " All model will run on CPU... "
	MODEL_LOC_0=${MODEL_LOC}/intel/person-detection-retail-0013/FP32/person-detection-retail-0013.xml
	MODEL_LOC_1="--m_reid ${MODEL_LOC}/intel/person-reidentification-retail-0076/FP32/person-reidentification-retail-0076.xml"
	
	I_SOURCE="0 1"
	TARGET_0="CPU"
}
function set_others()
{
	inference_D_choose
	source_choose
}
clear
banner_show

set_default
model_0_choose && set_others
echo " >> Do you want to record the output result as video? (Y/n)"
read choose
output_choose $choose

ARGS=" -m ${MODEL_LOC_0} ${MODEL_LOC_1} -i ${I_SOURCE} -d ${TARGET_0} --config ${config_path} -l ${INTEL_OPENVINO_DIR}/inference_engine/lib/intel64/libcpu_extension_avx2.so ${OUTPUT_PATH}"
test -e $DEMO_LOC/python_demos/multi_camera_multi_person_tracking/multi_camera_multi_person_tracking.py || cp -r /opt/intel/openvino/inference_engine/demos/python_demos $DEMO_LOC
pip3 install -r $requirements_path
echo "RUN python3 $DEMO_LOC/python_demos/multi_camera_multi_person_tracking/multi_camera_multi_person_tracking.py $ARGS"
python3 $DEMO_LOC/python_demos/multi_camera_multi_person_tracking/multi_camera_multi_person_tracking.py $ARGS