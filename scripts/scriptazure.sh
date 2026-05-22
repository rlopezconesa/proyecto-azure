#!/bin/bash

path="/home/alusmr/Documentos/azure/STG"

backup="/home/alusmr/Documentos/azure/backup"

azure_stg="https://storagenba.blob.core.windows.net/stg?sp=racwdli&st=2026-05-21T17:04:43Z&se=2026-09-20T01:19:43Z&sv=2026-02-06&sr=c&sig=lSlFGQEGwkyKVHKZNUPGTVF4xZ1%2BQF5GRQepUTjgmqk%3D"

fecha=$(date +"%Y%m%d")

if [ -e "$path/$fecha.flg" ]; then
	./azcopy copy $path/$fecha $azure_stg --recursive=true
	./azcopy copy $path/$fecha.flg $azure_stg

	mv $path/$fecha $backup
	mv $path/$fecha.flg $backup

	echo "OK"
else
	echo "ERROR"
fi
