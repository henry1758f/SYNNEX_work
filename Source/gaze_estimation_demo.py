# File: gaze_estimation_demo.py
# 2020/02/12	henry1758f 1.0.0	First Create with python instead of script

import json
import os
import string 

current_path = os.path.abspath(os.getcwd())
dump_modelinfo_path = '${INTEL_OPENVINO_DIR}/deployment_tools/tools/model_downloader/info_dumper.py'
jsontemp_path = current_path + '/Source/model_info.json'
model_path = '~/openvino_models/models/SYNNEX_demo/'
ir_model_path = '~/openvino_models/ir/'

gaze_estimation_model = ['gaze-estimation']
face_detection_model = ['face-detection-adas','face-detection-retail']
head_pose_estimation_model = ['head-pose-estimation']
facial_landmarks_model = ['facial-landmarks']
open_closed_eye = ['open-closed-eye']

default_source = '0'
default_arg = ' -m ' + model_path + 'intel/gaze-estimation-adas-0002/FP32/gaze-estimation-adas-0002.xml' + \
' -m_fd ' + model_path + 'intel/face-detection-retail-0004/FP32/face-detection-retail-0004.xml' + \
' -m_hp ' + model_path + 'intel/head-pose-estimation-adas-0001/FP32/head-pose-estimation-adas-0001.xml' + \
' -m_lm ' + model_path + 'intel/facial-landmarks-35-adas-0002/FP32/facial-landmarks-35-adas-0002.xml' + \
' -m_es ' + ir_model_path + 'public/open-closed-eye-0001/FP32/open-closed-eye-0001.xml' + \
' -i ' + default_source + \
' -d CPU -d_fd CPU -d_hp CPU -d_lm CPU -d_es CPU'

if os.path.isfile(jsontemp_path):
	os.system('rm -r ' + jsontemp_path)
os.system(dump_modelinfo_path + " --all >> " + jsontemp_path)

def check_jsontemp_exist():
	if not os.path.isfile(jsontemp_path):
		print('[ ERROR ] ' + jsontemp_path + ' is not exist! ')
		return False
	else:
		return True

def terminal_clean():
	os.system('clear')

def banner():
	print("|=========================================|")
	print("|          Gaze Estimation Demo           |")
	print("|=========================================|")
	print("|  Support OpenVINO " + os.popen('echo $VERSION_VINO').read() )
	print("")

def target_device_select():
	return input('\n [Typein the target device for inference this model (CPU,GPU,MYRIAD,HDDL,etc.)]  >> ')

def precisions_select(precisions_item,name):
	i = 0
	for result in precisions_item:
		i += 1
		print(str(i) + '. [' + result + ']' )
	else:
		keyin = input('\n [Select precisions of the model "' + name + '"]  >>')
		i = 0
		for result in precisions_item:
			i += 1
			if str(i) == keyin or keyin == result:
				return result
				break
		else:
			print('[ ERROR ] ')
			return


def model0_select(dldt_search_str, welcome_str, arg_tag):
	print(welcome_str)
	if check_jsontemp_exist() :
		global jsonObj_Array
		with open(jsontemp_path,'r') as input_file:
			jsonObj_Array = json.load(input_file)
		i = 0
		print('\n===== Model List =====')
		for name in dldt_search_str:
			for item in jsonObj_Array:
				if name in item['name']:
					i += 1
					precisions_string = ''
					for precisions in item['precisions']:
						precisions_string = precisions_string + '[' + precisions +']'
					print(str(i) + '. ' + item['name'] + '\t\t' + precisions_string + '\n\t\t[' + item['framework'] + '] ' + item['description'] )
	select = input('Select a number Or input a path to your model  >> ')
	if check_jsontemp_exist() :
		i = 0
		for name in dldt_search_str:
			for item in jsonObj_Array:
				if name in item['name']:
					i += 1
					if str(i) == select:
						precisions = precisions_select(item['precisions'],item['name'])
						device = target_device_select()
						if 'intel/' in item['subdirectory']:
							Path = model_path + item['subdirectory'] + '/' + str(precisions) + '/' + item['name'] + '.xml'
						elif 'public/' in item['subdirectory']:
							Path = ir_model_path + item['subdirectory'] + '/' + str(precisions) + '/' + item['name'] + '.xml'
						print('[ INFO ] [ ' + item['name'] + ' ][' + str(precisions) + '] been selected')
						print('> Path: ' + Path)
						return ' -m' + arg_tag + Path + ' -d' + arg_tag + device
					elif select == '' :
						return ''

def source_select():
	source = input(' \n\n[ input "cam" for using camera as inference source, \n\tfor using default Source, just press ENTER, \n\tor typein the path to the source you want. \nSupport multiple source by "<source1> <source2> <source3>... ]\n  >> ')
	if source == '':
		return default_source
	else:
		return source

def excuting():
	global arguments_string
	arguments_string = ''
	arguments_string += model0_select(gaze_estimation_model,  ' [Select a Gaze Estimation model.]', ' ')
	if arguments_string == '':
		print('[ INFO ] Load Default Configuration...')
		arguments_string = default_arg
	else:
		select_str = ''
		select_str = model0_select(face_detection_model,  ' [Select a Face Detection model.]', '_fd ')
		if select_str == '':
			select_str = ' -m_fd ' + model_path + 'intel/face-detection-retail-0004/FP32/face-detection-retail-0004.xml'
		arguments_string += select_str
		select_str = model0_select(head_pose_estimation_model,  ' [Select a Headpose Estimation model.]', '_hp ')
		if select_str == '':
			select_str = ' -m_hp ' + model_path + 'intel/head-pose-estimation-adas-0001/FP32/head-pose-estimation-adas-0001.xml'
		arguments_string += select_str
		select_str = model0_select(facial_landmarks_model,  ' [Select a Facial Landmarks model.]', '_lm ')
		if select_str == '':
			select_str = ' -m_lm ' + model_path + 'intel/facial-landmarks-35-adas-0002/FP32/facial-landmarks-35-adas-0002.xml'
		arguments_string += select_str
		select_str = model0_select(open_closed_eye,  ' [Select an Open-Closed Eye model.]', '_es ')
		if select_str == '':
			select_str = ' -m_es ' + ir_model_path + 'public/open-closed-eye-0001/FP32/open-closed-eye-0001.xml'
		arguments_string += select_str
		arguments_string += ' -i ' + source_select()
	excute_string =  '$DEMO_LOC/gaze_estimation_demo' + arguments_string
	print('[ INFO ] Running > ' + excute_string)
	os.system(excute_string)

###########
terminal_clean()
banner()
excuting()
