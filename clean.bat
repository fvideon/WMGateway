:: Clean output folders

for /D /R %%i in (bin*) do (rd /s /q "%%i")
for /D /R %%i in (obj*) do (rd /s /q "%%i")
for /D /R %%i in (debug*) do (rd /s /q "%%i")
for /D /R %%i in (release*) do (rd /s /q "%%i")
