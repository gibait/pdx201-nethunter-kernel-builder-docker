FROM ubuntu:20.04
LABEL Giulio Barabino <giuliobarabino99@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /kernel
RUN mkdir -p ~/android/toolchains

ENV arch=arm64
ENV subarch=arm64


RUN apt update && apt upgrade -fy && \
    apt install -y \
      git openjdk-8-jdk git-core gnupg flex bison gperf build-essential zip \
      curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev \
      x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils \
      xsltproc unzip python bc liblz4-tool vboot-utils vim u-boot-tools \
      device-tree-compiler wget zsh tmux cpio kmod libssl-dev python3 python3-distutils \
      python3-apt axel bc binutils-aarch64-linux-gnu build-essential ccache curl \
      device-tree-compiler pandoc libncurses5-dev lynx lz4 fakeroot xz-utils whiptail

# Install pip
RUN curl https://bootstrap.pypa.io/get-pip.py | python3

# Download kernel
# RUN cd /kernel && \
#            git clone https://github.com/lineageos-on-pdx201/android_kernel_sony_sm6125 -b lineage-20

# Clone nethunter-installer
# RUN git clone https://gitlab.com/kalilinux/nethunter/build-scripts/kali-nethunter-project/-/tree/master/nethunter-installer \
#            /kernel/android_kernel_sony_sm6125/

# Download toolchains (to speed up)
## GCC 64bit
RUN mkdir ~/android/toolchains/aarch64-4.9
RUN curl -L http://kali.download/nethunter-images/toolchains/linaro-aarch64-4.9.tar.xz | tar -xJf - -C ~/android/toolchains/aarch64-4.9 --strip-components=1

## GCC 32bit
RUN mkdir ~/android/toolchains/armhf-4.9
RUN curl -L http://kali.download/nethunter-images/toolchains/linaro-armhf-4.9.tar.xz | tar -xJf - -C ~/android/toolchains/armhf-4.9 --strip-components=1


# Install Oh My Zsh!
RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" || true
WORKDIR /kernel
ENTRYPOINT zsh
