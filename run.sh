docker build -t ori_container .

MOUNTS=("/var/run/docker.sock:/var/run/docker.sock"
        "${HOME}/.ssh:/root/.ssh"
)

mount_cmd=""
for i in "${MOUNTS[@]}"
do
    echo $i
    mount_cmd+=" --volume=$i"
done
mount_cmd+=" "

echo $mount_cmd


cmd="docker run -it --privileged --rm --net=host $mount_cmd ori_container:latest"

echo ${cmd}

${cmd}