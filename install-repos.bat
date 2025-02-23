@echo off

echo "[ INFO ] Installing sysidpipeline from: https://github.com/Jaspervbeers/sysidpipeline.git"
git "clone" "git@github.com:Jaspervbeers/sysidpipeline.git"
if errorlevel 1 goto sysidInstallFail

echo "[ INFO ] Installing droneIdentification from: https://github.com/Jaspervbeers/droneidentification.git"
git "clone" "git@github.com:Jaspervbeers/droneidentification.git"
if errorlevel 1 goto droneidInstallFail

echo "[ INFO ] Installing droneSim from: https://github.com/Jaspervbeers/dronesim.git"
git "clone" "git@github.com:Jaspervbeers/dronesim.git"
if errorlevel 1 goto dronesiminstallFail

echo "[ INFO ] Installing droneViz from: https://github.com/Jaspervbeers/droneviz.git"
git "clone" "git@github.com:Jaspervbeers/droneviz.git"
if errorlevel 1 goto dronevizinstallFail

exit /b 0


:sysidInstallFail
echo "[ ERROR ] Could not install sysidpipeline. Please check that you have the correct permissions."
exit /b 1

:droneidInstallFail
echo "[ ERROR ] Could not install droneidentification. Please check that you have the correct permissions."
exit /b 1

:dronesimInstallFail
echo "[ ERROR ] Could not install dronesim. Please check that you have the correct permissions."
exit /b 1

:dronevizInstallFail
echo "[ WARNING ] Could not install droneviz. This repository is not essential, but some visualizations may not work."
exit /b 2