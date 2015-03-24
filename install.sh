
#curl- O https://www.python.org/ftp/python/2.7.6/python-2.7.6-macosx10.6.dmg
#open python-2.7.6-macosx10.6.dmg

echo "————— Downloading get-pip.py from internets..."
#wget https://bootstrap.pypa.io/get-pip.py
curl --silent --show-error --retry 5 -O https://bootstrap.pypa.io/get-pip.py
echo "————— Executing get-pip.py..."
python get-pip.py
echo "————— Installing python dependencies for robot automated tests..."
pip install -r requirements.txt