if [ which python3 ] || [ which pip3 ]; then
    echo "already set up."
    exit 0
fi

if which apt-get; then
    export CMD=apt-get
else
    export CMD=yum
fi

sudo ${CMD} -y update
sudo ${CMD} -y upgrade
sudo ${CMD} -y install python3-pip
echo "python version: $(python3 --version)"
echo "pip version: $(pip3 --version)"
