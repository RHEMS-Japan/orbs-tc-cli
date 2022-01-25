if which tccli; then
    echo "TCCLI is already installed."
    exit 0
fi

if [ "$(which python)" ]; then
    echo "already set up."
else
    if which apt-get; then
        export CMD=apt-get
    else
        export CMD=yum
    fi

    sudo ${CMD} -y update
    sudo ${CMD} -y upgrade
    sudo ${CMD} -y install python-pip

    echo "=== python version ==="
    python --version
fi

pip install tccli-intl-en

echo "=== tccli version ==="
tccli --version
