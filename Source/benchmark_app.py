# File: benchmark_app.py
# 2020/02/11	henry1758f 4.0.0	First Create with python instead of script
# 2020/02/20	henry1758f 4.0.1	Add ban list and special operation to models in model_test_limit_list, the progress information will show while testing all models.
# 2020/02/20	henry1758f 4.0.2	Fix error when choosing specific model
# 2020/02/24	henry1758f 4.0.3	Now we can skip some models by setting All_test_index 
# 2020/03/10	henry1758f 4.0.3-yolo	For Yolo auto test 

import json
import os
import string 
import csv

current_path = os.path.abspath(os.getcwd())
dump_modelinfo_path = '/opt/intel/openvino/deployment_tools/tools/model_downloader/info_dumper.py'
jsontemp_path = current_path + '/Source/model_info.json'
custom_ir_model_path = current_path + '/Source/Custom_IR_Models/'
model_path = '~/openvino_models/models/SYNNEX_demo/'
ir_model_path = '~/openvino_models/ir/'

All_test_index = 151

model_test_limit_list = ["instance-segmentation-security-0010","instance-segmentation-security-0083",\
"brain-tumor-segmentation-0001","brain-tumor-segmentation-0002","efficientnet-b7-pytorch","efficientnet-b7_auto_aug",\
"faster_rcnn_inception_resnet_v2_atrous_coco","faster_rcnn_resnet101_coco","faster_rcnn_resnet50_coco","mask_rcnn_inception_resnet_v2_atrous_coco",\
"mask_rcnn_inception_v2_coco","mask_rcnn_resnet101_atrous_coco","mask_rcnn_resnet50_atrous_coco"]

#print(jsontemp_path)
if os.path.isfile(jsontemp_path):
	os.system('rm -r ' + jsontemp_path)
os.system(dump_modelinfo_path + " --all >> " + jsontemp_path)


def check_jsontemp_exist():
	if not os.path.isfile(jsontemp_path):
		print('[ERROR] ' + jsontemp_path + ' is not exist! ')
		return False
	else:
		return True



def terminal_clean():
	os.system('clear')

def banner():
	print("|=========================================|")
	print("|              Benchmark App              |")
	print("|=========================================|")
	print("|  Support OpenVINO " + os.popen('echo $VERSION_VINO').read() )
	print("")

def target_device_select():
	global Target_Device 
	Target_Device = input('> Input your target device. (CPU,GPU,MYRIAD,HDDL,etc.) ')

def model_list_show_select():
	if check_jsontemp_exist() :
		global jsonObj_Array
		input_file = open(jsontemp_path,'r')
		jsonObj_Array = json.load(input_file)
		global model_counter
		model_counter = 0
		i = 0
		print('\n===== Model List =====')
		for item in jsonObj_Array:
			i+=1
			model_counter += 1
			print(str(i) +'. ' + item['name'] + '\t\t([' + item['framework'] + '] a/an ' + item['task_type'] + ' model. )')
		print(str(i+1) + '. frozen_darknet_yolov3_model')
		print(str(i+2) + '. frozen_darknet_tiny_yolov3_model')
		global selected 
		selected = input('\n> Please input a number/name/path of the model which you are gonna test, or input "all" for a whole testing.\t >> ')
		if selected == 'all' or selected == 'ALL' or selected == 'All':
			print('[INFO] All ' + str(i) + ' models will be test!! ')
		else:
			i = 0
			for item in jsonObj_Array:
				i+=1
				if str(i) == str(selected) or item['name'] == str(selected) :
					print('[INFO] ' + str(i) +'. ' + item['name'] + ' been selected.')
					break;
			else:
				if str(i+1) == selected:
					print('[INFO] frozen_darknet_yolov3_model been selected.')
				elif str(i+2) == selected:
					print('[INFO] frozen_darknet_tiny_yolov3_model been selected.')

				if os.path.isfile(selected):
					print('[INFO] ' + selected + ' been selected.')
				else:
					print('[ERROR] Invaild Input " ' + selected + ' "!!')
					print('[DEBUG] i=' + str(i) + ', selected=' + str(selected) )
		input_file.close()

def model_testing_times_input():
	global model_testing_times
	model_testing_times = input('\n> How many times you want to test per model\t >> ')

def any_other_arguments_input():
	global other_arguments
	other_arguments = input('\n> If you have any other arguments that needed, input here, or skip it by just press "ENTER" \t >> ')

def special_arguments_input():
	global special_arguments
	special_arguments = input('\n> If you have arguments to work on special model, input here." \t >> ')

def excuting():
	cap_time = os.popen('echo $(date +\'%Y%m%d_%H%M%S\')').read()
	reportFileName = current_path + '/OpenVINO_Performance_Test_Report_' + cap_time[:-1] + '.csv'
	print('[INFO] Current Time : ' + cap_time )
	if selected == 'all' or selected == 'ALL' or selected == 'All':
		with open(reportFileName,'w') as csvReport:
			print(reportFileName)
			csvWriter = csv.writer(csvReport)
			csvWriter.writerow(['Device_Info', os.popen('lscpu |grep "Model name:" ').read()[20:-1]])
			csvWriter.writerow(['Target_Device',Target_Device])
			csvWriter.writerow(['Model_Name','Precisions','Performance','Model_framework','Model_Task_Type','Model_Description'])
			csvReport.flush()
			os.system('test -e $SAMPLE_LOC/hello_query_device || $Source_Sample_Build')
			print(os.popen('$SAMPLE_LOC/hello_query_device | grep -e \'Device\' -a -e \'FULL_DEVICE_NAME\' -a -e \'RANGE_FOR_ASYNC_INFER_REQUESTS\' -a -e \'RANGE_FOR_STREAMS\'').read())
			item_counter = 0
			for item in jsonObj_Array:
				item_counter+=1
				if item_counter > All_test_index:
					for precisions in item['precisions']:
						if 'intel/' in item['subdirectory']:
							Path = model_path + item['subdirectory'] + '/' + precisions + '/' + item['name'] + '.xml'
						elif 'public/' in item['subdirectory']:
							Path = ir_model_path + item['subdirectory'] + '/' + precisions + '/' + item['name'] + '.xml'
						print('['+ str(item_counter) + '/' + str(model_counter) + ']===== Testing [ ' + item['name'] + ' ][' + precisions + '] =====')
						print('> Path: ' + Path)
						flag_limit = False
						for limit in model_test_limit_list:
							if limit in item['name']: 
								print('[ INFO ] This model is on the ban list, will only test with "' + special_arguments + '" !')
								flag_limit = True

						result_string = '=AVERAGE('
						for times in range(int(model_testing_times)):
							if not flag_limit:
								result_raw = os.popen('$SAMPLE_LOC/benchmark_app' + ' -m ' + Path + ' -d ' + Target_Device + ' ' + other_arguments + ' |grep "Throughput" ').read()
							else:
								result_raw = os.popen('$SAMPLE_LOC/benchmark_app' + ' -m ' + Path + ' -d ' + Target_Device + ' ' + special_arguments + ' |grep "Throughput" ').read()

							#result_raw = os.popen('$SAMPLE_LOC/benchmark_app' + ' -m ' + Path + ' -d ' + Target_Device + ' ' + other_arguments ).read()
							result = result_raw[len('Throughput:'):-len('FPS ')]
							print('> [' + str(times+1) + '] ' + str(result) + ' FPS ')
							result_string += result
							result_string += ','
						else:
							result_string = result_string[:-1]
							result_string += ')'
							#print(result_string)
							csvWriter.writerow([item['name'],precisions,result_string,item['framework'],item['task_type'],item['description']])
							csvReport.flush()
				else:
					print('[ INFO ] All_test_index set to ' + str(All_test_index) + ' , skipping [' + item['name'] + ']!')
			else:
				custom_ir_model_list = ['frozen_darknet_yolov3_model','frozen_darknet_tiny_yolov3_model']
				custom_ir_model_precisions = ['FP16','FP32']
				for item in custom_ir_model_list:
					item_counter+=1
					if item_counter > All_test_index:
						for precisions in custom_ir_model_precisions:
							Path = custom_ir_model_path + item + '/' + precisions + '/' + item + '.xml'
							if not os.path.isfile(Path):
								print('[ERROR] ' + Path + ' is not exist! ')
							else:
								print('['+ str(item_counter) + '/' + str(model_counter) + ']===== Testing [ ' + item + ' ][' + precisions + '] =====')
								print('> Path: ' + Path)

							result_string = '=AVERAGE('
							for times in range(int(model_testing_times)):
								result_raw = os.popen('$SAMPLE_LOC/benchmark_app' + ' -m ' + Path + ' -d ' + Target_Device + ' ' + other_arguments + ' |grep "Throughput" ').read()

								#result_raw = os.popen('$SAMPLE_LOC/benchmark_app' + ' -m ' + Path + ' -d ' + Target_Device + ' ' + other_arguments ).read()
								result = result_raw[len('Throughput:'):-len('FPS ')]
								print('> [' + str(times+1) + '] ' + str(result) + ' FPS ')
								result_string += result
								result_string += ','
							else:
								result_string = result_string[:-1]
								result_string += ')'
								#print(result_string)
								csvWriter.writerow([item,precisions,result_string,'Custom IR Model List','','This is a model in Custom IR Model List'])
								csvReport.flush()
	else:
		for item in jsonObj_Array:
			#print('[ DEBUG ] selected: ' + selected + ', item[name]=' + item['name'])
			if selected == item['name']:
				with open(reportFileName,'w') as csvReport:
					print(reportFileName)
					csvWriter = csv.writer(csvReport)
					csvWriter.writerow(['Device_Info', os.popen('lscpu |grep "Model name:" ').read()[20:-1]])
					csvWriter.writerow(['Target_Device',Target_Device])
					csvWriter.writerow(['Model_Name','Precisions','Performance','Model_framework','Model_Task_Type','Model_Description'])
					csvReport.flush()
					for precisions in item['precisions']:
						if 'intel/' in item['subdirectory']:
							Path = model_path + item['subdirectory'] + '/' + precisions + '/' + item['name'] + '.xml'
						elif 'public/' in item['subdirectory']:
							Path = ir_model_path + item['subdirectory'] + '/' + precisions + '/' + item['name'] + '.xml'
						print('===== Testing [ ' + item['name'] + ' ][' + precisions + '] =====')
						print('> Path: ' + Path)

						result_string = '=AVERAGE('
						for times in range(int(model_testing_times)):
							result_raw = os.popen('$SAMPLE_LOC/benchmark_app' + ' -m ' + Path + ' -d ' + Target_Device + ' ' + other_arguments + ' |grep "Throughput" ').read()
							#result_raw = os.popen('$SAMPLE_LOC/benchmark_app' + ' -m ' + Path + ' -d ' + Target_Device + ' ' + other_arguments ).read()
							result = result_raw[len('Throughput:'):-len('FPS ')]
							print('> [' + str(times+1) + '] ' + str(result) + ' FPS ')
							result_string += result
							result_string += ','
						else:
							result_string = result_string[:-1]
							result_string += ')'
							#print(result_string)
							csvWriter.writerow([item['name'],precisions,result_string,item['framework'],item['task_type'],item['description']])
							csvReport.flush()
			elif os.path.isfile(selected):
				with open(reportFileName,'w') as csvReport:
					print(reportFileName)
					csvWriter = csv.writer(csvReport)
					csvWriter.writerow(['Device_Info', os.popen('lscpu |grep "Model name:" ').read()[20:-1]])
					csvWriter.writerow(['Target_Device',Target_Device])
					csvWriter.writerow(['Model_Name','Precisions','Performance','Model_framework','Model_Task_Type','Model_Description'])
					csvReport.flush()
					Path = selected
					print('===== Testing [ ' + Path + ' ] =====')
					print('> Path: ' + Path)

					result_string = '=AVERAGE('
					for times in range(int(model_testing_times)):
						result_raw = os.popen('$SAMPLE_LOC/benchmark_app' + ' -m ' + Path + ' -d ' + Target_Device + ' ' + other_arguments + ' |grep "Throughput" ').read()
						#result_raw = os.popen('$SAMPLE_LOC/benchmark_app' + ' -m ' + Path + ' -d ' + Target_Device + ' ' + other_arguments ).read()
						result = result_raw[len('Throughput:'):-len('FPS ')]
						print('> [' + str(times+1) + '] ' + str(result) + ' FPS ')
						result_string += result
						result_string += ','
					else:
						result_string = result_string[:-1]
						result_string += ')'
						#print(result_string)
						csvWriter.writerow([Path,'',result_string])
						csvReport.flush()
				break
		else:
			print('[ WARNING ] No options / Model Path as " ' + selected + 'Please check your input words.')

###########
terminal_clean()
banner()

target_device_select()
model_list_show_select()
model_testing_times_input()
any_other_arguments_input()
if selected == 'all':
	special_arguments_input()
excuting()