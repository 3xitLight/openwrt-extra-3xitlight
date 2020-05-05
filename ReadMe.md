#### # Get source and checkout:

`git clone https://github.com/openwrt/openwrt.git -b openwrt-19.07`   
`git checkout openwrt-19.07`   

`git fetch --tags` 
`git tag -l` 
`git checkout v19.07.2` 
`make prereq` 
`git pull` 

  
#### # Get configuration from release build:  
```
RT-AC87U: wget https://downloads.openwrt.org/releases/19.07.2/targets/bcm53xx/generic/config.buildinfo -O .config
EW1200: wget https://downloads.openwrt.org/releases/19.07.2/targets/ramips/mt7621/config.buildinfo -O .config
GL-MT300n-V2: https://downloads.openwrt.org/releases/19.07.2/targets/ramips/mt76x8/config.buildinfo -O .config
```
   
#### # Update & install packages:  
```
./scripts/feeds update -a
./scripts/feeds update $REPO

./scripts/feeds install -a
./scripts/feeds install -p $PACKAGE
```

#### # Build firmware:
```
make menuconfig
make download -j8
make -j8 V=s 2>&1 | tee build.log
```

Clean: `make clean`  
Dirclean: `make dirclean`  
Distclean: `make distclean`  
  
#### # Build package:   
```
PACKAGE="<PACKAGE>"
echo ${PACKAGE}

make package/${PACKAGE}/download V=s
make package/${PACKAGE}/check V=s
make package/${PACKAGE}/compile V=s
make package/${PACKAGE}/install V=s
make package/${PACKAGE}/{clean,compile,install} V=s
```
  
  
#### # Test builds in qemu:
```
./scripts/feeds install -p extra qemu-userspace
make package/qemu-userspace/host/compile -j8
```

Test build samba binary for default target:

```
./staging_dir/hostpkg/bin/qemu-mips -L staging_dir/target-mips_24kc_musl/root-ath79/ staging_dir/target-mips_24kc_musl/root-ath79/usr/sbin/smbd -V
```

As you can see i hand the staging root as our qemu base root-fs path.

This way i can do a basic check if the build binary can find/use all its shared libs and if i build the correct version or check other simple command-line parameters. I use this so i don't have to verify/test always via my live devices on rather trivial changes/updates.
This is also faster/simpler than setting up a full qemu system for openWrt.

#### # Build info:
Here is what happens via make:

1. default make build/install into ../build_dir/target-(arch)/(packagename)/ipkg-install
2. gather opkg install files + strip into ../build_dir/target-(arch)/(packagename)/ipkg-(target name)
3. install in target-root: ../staging_dir/target/root-(target)
4. install dev/host/build only stuff into ../staging_dir/target/...
