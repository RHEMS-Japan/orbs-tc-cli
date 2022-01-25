if which tccli; then
    echo "TCCLI is already installed."
    exit 0
fi

if [ "$(which python)" ] && [ "$(which pip)" ]; then
    echo "already set up."
else
    sudo add-apt-repository universe
    sudo apt update

    curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py
    sudo python get-pip.py

    echo "=== python version ==="
    python --version

    echo "=== pip version ==="
    pip --version
fi

pip install tccli-intl-en

echo "=== tccli version ==="
tccli --version
