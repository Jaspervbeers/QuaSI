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