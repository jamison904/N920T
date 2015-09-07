#!/bin/bash

date="$(date +%Y.%m.%d_%H.%M.%S)"
target_dir="dist/${date}"

export ARCH=arm64
#export CROSS_COMPILE=/home/jamison/android/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin/arm-eabi-
#export CROSS_COMPILE=/home/jamison/android/toolchain/eabi-linaro-4.8/bin/arm-eabi-
#export CROSS_COMPILE=/opt/toolchains/arm-eabi-4.7/bin/arm-eabi-
export CROSS_COMPILE=/home/jamison/android/kernel/Note5/aarch64-linux-android-4.9/bin/aarch64-linux-android-

mkdir -p out

make \
    O="$(pwd)/out" \
     arm64 exynos7420-noblelte_tmo_defconfig


make O="$(pwd)/out" -j8

#mkdir -p "${target_dir}"
#mkdir -p "${target_dir}/modules/"

# Kernel
#cp out/arch/arm/boot/zImage "${target_dir}"/zImage
# Kernel modules
#find out -name '*.ko' -exec cp -t "${target_dir}/modules/" {} \;
# Device tree
#tools/dtbTool \
#    -o "${target_dir}"/dt.img \
#    -s 4096 \
#    -p out/scripts/dtc/ \
#    out/arch/arm/boot/dts/

echo
echo "Done! Output directory: ${target_dir}"