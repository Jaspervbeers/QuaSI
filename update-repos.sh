echo '[ INFO ] Updating sysidpipeline from: https://github.com/Jaspervbeers/sysidpipeline.git'
cd sysidpipeline
git pull origin main
if [ $? -ne 0 ]
then
    cd ..
    echo '[ ERROR ] Failed to update sysidpipeline. Make sure you have the correct permissions'
    exit 1
fi
cd ..

echo '[ INFO ] Updating droneIdentification from: https://github.com/Jaspervbeers/droneidentification.git'
cd droneidentification
git pull origin main
if [ $? -ne 0 ]
then
    cd ..
    echo '[ ERROR ] Failed to update droneidentification. Make sure you have the correct permissions'
    exit 1
fi
cd ..


echo '[ INFO ] Updating droneSim from: https://github.com/Jaspervbeers/dronesim.git'
cd dronesim
git pull origin main
if [ $? -ne 0 ]
then
    cd ..
    echo '[ ERROR ] Failed to update dronesim. Make sure you have the correct permissions'
    exit 1
fi
cd ..


echo '[ INFO ] Updating droneViz from: https://github.com/Jaspervbeers/droneviz.git'
cd droneviz
git pull origin main
if [ $? -ne 0 ]
then
    cd ..
    echo '[ WARNING ] Failed to update droneviz. This repository is not essential, but some visualizations may not work.'
    exit 2
fi
cd ..

exit 0