set produto=%1
set sistema=%2
set tipo=%3
set item=%4
set date=%date:~6%%date:~3,2%%date:~0,2%
set datetime=%date:~6%-%date:~3,2%-%date:~0,2% %time:~0,2%:%time:~3,2%:%time:~6,2%

e:
cd e:\MV\repo\git\soulmv-workspace-dev
md products\%produto%\%tipo%\WEB-INF\lib

cd e:\MV\repo\git\soulmv-workspace-dev\produtos_mv\bin

echo Manifest-Version: 1.0 >> MANIFEST.MF
echo Ant-Version: Apache Ant 1.9.8 >> MANIFEST.MF
echo Created-By: 1.8.0_252-b09 (Oracle Corporation) >> MANIFEST.MF
echo Built-By: root >> MANIFEST.MF
echo Built-Date: %datetime% >> MANIFEST.MF
echo Implementation-Title: com.mvsistemas.mv2000.%sistema%.%tipo%.%item% >> MANIFEST.MF
echo Implementation-Vendor: MV Sistemas S/A >> MANIFEST.MF
echo Product-Version: null >> MANIFEST.MF
echo SoulMV-Version: null >> MANIFEST.MF
echo ATX-Framework-Version: 2.1.25 (SHA 45e7c7fe) >> MANIFEST.MF

jar cvfm com.mvsistemas.mv2000.%sistema%.%tipo%.%item%.jar MANIFEST.MF com\mvsistemas\mv2000\%sistema%\%tipo%\%item%

del MANIFEST.MF /Q
move /Y com.mvsistemas.mv2000.%sistema%.%tipo%.%item%.jar e:\MV\repo\git\soulmv-workspace-dev\products\%produto%\%tipo%\WEB-INF\lib

if %tipo%==forms (
md e:\MV\repo\git\soulmv-workspace-dev\products\%produto%\%tipo%\flex\com\mvsistemas\mv2000\%sistema%\%tipo%\%item%\views
cd e:\MV\repo\git\soulmv-workspace-dev\WebApp\mv
xcopy flex\com\mvsistemas\mv2000\%sistema%\%tipo%\%item%\views e:\MV\repo\git\soulmv-workspace-dev\products\%produto%\%tipo%\flex\com\mvsistemas\mv2000\%sistema%\%tipo%\%item%\views /E /Y
)

cd e:\MV\repo\git\soulmv-workspace-dev
if exist _%date%_%sistema%.%tipo%.%item%.zip del _%date%_%sistema%.%tipo%.%item%.zip /Q
7z a _%date%_%sistema%.%tipo%.%item%.zip products

rd products /S /Q

explorer.exe E:\MV\repo\git\soulmv-workspace-dev
