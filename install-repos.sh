echo "[ INFO ] Combining raw flight data zip files"
cat data/raw.zip* > data/__ALL__.zip
if [ $? -ne 0 ]
then 
    echo "[ ERROR ] Failed to combine zip files of raw data. You may need to extract these manually using e.g. 7zip: https://www.7-zip.org/"
fi
echo "[ INFO ] Extracting raw flight data"
unzip -d data/ data/__ALL__.zip
if [ $? -ne 0 ]
then 
    echo "[ ERROR ] Failed to extract .zip files of raw data. You need to do this manually using e.g. 7zip: https://www.7-zip.org/"
fi
rm data/__ALL__.zip
if [ $? -ne 0 ]
then 
    echo "[ ERROR ] Failed to delete combined .zip file of raw data: __ALL__.zip, you may delete this file manually."
fi

echo "[ INFO ] Continuing with repository cloning..."

echo '[ INFO ] Installing sysidpipeline from: https://github.com/Jaspervbeers/sysidpipeline.git'
git clone git@github.com:Jaspervbeers/sysidpipeline.git
if [ $? -ne 0 ]
then
    echo '[ ERROR ] Failed to install sysidpipeline. Make sure you have the correct permissions'
    exit 1
fi

echo '[ INFO ] Installing droneIdentification from: https://github.com/Jaspervbeers/droneidentification.git'
git clone git@github.com:Jaspervbeers/droneidentification.git
if [ $? -ne 0 ]
then
    echo '[ ERROR ] Failed to install droneidentification. Make sure you have the correct permissions'
    exit 1
fi


echo '[ INFO ] Installing droneSim from: https://github.com/Jaspervbeers/dronesim.git'
git clone git@github.com:Jaspervbeers/dronesim.git
if [ $? -ne 0 ]
then
    echo '[ ERROR ] Failed to install dronesim. Make sure you have the correct permissions'
    exit 1
fi


echo '[ INFO ] Installing droneViz from: https://github.com/Jaspervbeers/droneviz.git'
git clone git@github.com:Jaspervbeers/droneviz.git
if [ $? -ne 0 ]
then
    echo '[ WARNING ] Failed to install droneviz. This repository is not essential, but some visualizations may not work.'
    exit 2
fi

exit 0