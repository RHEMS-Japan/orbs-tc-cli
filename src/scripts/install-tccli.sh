if which tccli; then
    echo "TCCLI is already installed."
    exit 0
fi

if [ "$(which python3)" ]; then
    echo "already set up."
else
    if which apt-get; then
        export CMD=apt-get
    else
        export CMD=yum
    fi

    sudo ${CMD} -y update
    sudo ${CMD} -y upgrade
    sudo ${CMD} -y install python3-pip

    echo "=== python version ==="
    python3 --version

    curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py
    python3 get-pip.py
fi

pip install tccli-intl-en

echo "=== tccli version ==="
tccli --version
