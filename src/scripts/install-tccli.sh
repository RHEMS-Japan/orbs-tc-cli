if which tccli; then
    echo "TCCLI is already installed."
    exit 0
fi

if [ "$(which python3)" ] && [ "$(which pip)" ]; then
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

    echo "=== pip version ==="
    pip3 --version
fi

# Install tccli with specific version if specified
if [ -n "${TCCLI_VERSION}" ]; then
    echo "Installing tccli version ${TCCLI_VERSION}"
    pip3 install "tccli==${TCCLI_VERSION}"
else
    echo "Installing latest tccli version"
    pip3 install tccli
fi
# pip3 install tccli-intl-en

echo "=== tccli version ==="
tccli --version

echo "=== Latest 10 tccli versions available ==="
pip index versions tccli \
  | grep "Available versions" \
  | sed 's/Available versions: //' \
  | tr ',' '\n' \
  | sed 's/ //g' \
  | head -n 10

