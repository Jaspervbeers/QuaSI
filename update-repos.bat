@echo off

echo "[ INFO ] Updating sysidpipeline..."
cd sysidpipeline
git "pull" "origin" "main"
if errorlevel 1 goto sysidUpdateFail
cd ..

echo "[ INFO ] Updating droneidentification..."
cd droneidentification
git "pull" "origin" "main"
if errorlevel 1 goto droneidUpdateFail
cd ..

echo "[ INFO ] Updating dronesim..."
cd dronesim
git "pull" "origin" "main"
if errorlevel 1 goto dronesimUpdateFail
cd ..

echo "[ INFO ] Updating droneviz..."
cd droneviz
git "pull" "origin" "main"
if errorlevel 1 goto dronevizUpdateFail
cd ..

exit /b 0



:sysidUpdateFail
cd ..
echo "[ ERROR ] Failed to update sysidpipeline. Make sure the branch is correct."
exit /b 1

:droneidUpdateFail
cd ..
echo "[ ERROR ] Failed to update droneidentification. Make sure the branch is correct."
exit /b 1

:dronesimUpdateFail
cd ..
echo "[ ERROR ] Failed to update dronesim. Make sure the branch is correct."
exit /b 1

:dronevizUpdateFail
cd ..
echo "[ ERROR ] Failed to update droneviz. Make sure the branch is correct."
exit /b 1