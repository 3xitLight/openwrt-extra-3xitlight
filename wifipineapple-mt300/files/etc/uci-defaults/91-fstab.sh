# Get Version and Device
if [[ $(cat /proc/cpuinfo | grep 'machine' | awk {'print $6'}) == "GL-MT300N-V2" ]]; then
    device="GL-MT300N-V2"
elif [[ $(cat /proc/cpuinfo | grep 'machine' | awk {'print $6'}) == "TETRA" ]]; then
    device="TETRA"
fi

# -- Setup fstab configuration
uci set fstab.@global[0].anon_swap=0
uci set fstab.@global[0].anon_mount=0
uci set fstab.@global[0].auto_swap=1
uci set fstab.@global[0].auto_mount=1
uci set fstab.@global[0].delay_root=5
uci set fstab.@global[0].check_fs=0

uci add fstab mount
if [[ $device == "GL-MT300N-V2" ]]; then
	uci set fstab.@mount[0].target='/mnt'
	uci set fstab.@mount[0].device='/dev/sda1'
elif [[ $device == "TETRA" ]]; then
	uci set fstab.@mount[0].target='/mnt'
	uci set fstab.@mount[0].device='/dev/sda1'
fi
uci set fstab.@mount[0].fstype='auto'
uci set fstab.@mount[0].options='rw,sync'
uci set fstab.@mount[0].enabled=1
uci commit fstab

exit 0
