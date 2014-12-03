
#curl- O https://www.python.org/ftp/python/2.7.6/python-2.7.6-macosx10.6.dmg
#open python-2.7.6-macosx10.6.dmg

echo “————— Downloading get-pip.py from gith...”
curl -O  -s https://raw.github.com/pypa/pip/master/contrib/get-pip.py
echo “\n\n————— Executing get-pip.py...”
python get-pip.py
echo “\n\n————— Installing ‘robotframework’ via pip...”
pip install robotframework
echo “\n\n————— Installing ‘robotframework-selenium2library’ via pip...”
pip install robotframework-selenium2library 
echo “\n\n————— Installing ‘requests’ via pip...”
pip install requests
echo “\n\n————— Installing ‘robotframework-requests’ via pip...”
pip install robotframework-requests
echo “\n\n————— Installing ‘selenium’ via pip...”
pip install selenium
echo “\n\n————— Installing ‘vcrpy’ via pip...”
pip install vcrpy