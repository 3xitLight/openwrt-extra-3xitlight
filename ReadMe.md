<<<<<<< HEAD
#### [get source and checkout]
```
=======
###  get source and checkout  
'''  
>>>>>>> 203c64f99595fee7576078924f279ea9928ec18e
git clone https://git.openwrt.org/openwrt/openwrt.git
git fetch --tags
git tag -l
git checkout v19.07.1
make prereq
git pull
<<<<<<< HEAD
```

#### [RT-AC87U]
`wget https://downloads.openwrt.org/releases/19.07.2/targets/bcm53xx/generic/config.buildinfo -O .config`

#### [EW1200]
`wget https://downloads.openwrt.org/releases/19.07.2/targets/ramips/mt7621/config.buildinfo -O .config`

#### [GL-MT300n-V2]
`https://downloads.openwrt.org/releases/19.07.2/targets/ramips/mt76x8/config.buildinfo -O .config`

#### [update & install packages]
```
./scripts/feeds update -a
./scripts/feeds update $REPO

./scripts/feeds install -a
./scripts/feeds install $REPO
./scripts/feeds install -p $PKG
```

#### [build package]
```
PKG="<PACKAGE>"
echo ${PACKAGE}

make package/${PACKAGE}/download V=s
make package/${PACKAGE}/check V=s
make package/${PACKAGE}/compile V=s
make package/${PACKAGE}/install V=s
make package/${PACKAGE}/{clean,compile,install} V=s
```

#### [build firmware]
```
make menuconfig
make download
make V=s 2>&1 | tee build.log
```

Clean: `make clean`  
Dirclean: `make dirclean`  
Distclean: `make distclean`  
=======
'''  
  
### [RT-AC87U]  
'wget https://downloads.openwrt.org/releases/19.07.2/targets/bcm53xx/generic/config.buildinfo -O .config'  

### [EW1200]  
'wget https://downloads.openwrt.org/releases/19.07.2/targets/ramips/mt7621/config.buildinfo -O .config'  
 
### [GL-MT300n-V2] 
'https://downloads.openwrt.org/releases/19.07.2/targets/ramips/mt76x8/config.buildinfo -O .config' 
 
### [update & install packages] 
'''  
./scripts/feeds update -a 
./scripts/feeds install ${PKG} 
./scripts/feeds install -a 
''' 
 
### [build package] 
''' 
PKG="<PACKAGE>" 
echo ${PACKAGE} 

make package/${PACKAGE}/download V=s 
make package/${PACKAGE}/check V=s 
make package/${PACKAGE}/compile V=s 
make package/${PACKAGE}/install V=s 
make package/${PACKAGE}/{clean,compile,install} V=s 
'''

### [build firmware] 
'''
make menuconfig 
make download 
make V=s 2>&1 | tee build.log 
'''
>>>>>>> 203c64f99595fee7576078924f279ea9928ec18e

#### [test builds in qemu]
```
./scripts/feeds install -p extra qemu-userspace
make package/qemu-userspace/host/compile -j8
```

#### [build info]
Here is what happens via make:

1. default make build/install into ../build_dir/target-(arch)/(packagename)/ipkg-install
2. gather opkg install files + strip into ../build_dir/target-(arch)/(packagename)/ipkg-(target name)
3. install in target-root: ../staging_dir/target/root-(target)
4. install dev/host/build only stuff into ../staging_dir/target/...
