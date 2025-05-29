cd UniverseLib
.\build.ps1
cd ..


# ----------- BepInEx Unity IL2CPP CoreCLR -----------
dotnet build src/UnityExplorer.sln -c Release_BIE_Unity_Cpp
$Path = "Release/UnityExplorer.BepInEx.Unity.IL2CPP.CoreCLR"
# ILRepack
lib/ILRepack.exe /target:library /lib:lib/net472/BepInEx/build647+ /lib:lib/net6/ /lib:lib/interop/ /lib:$Path /internalize /out:$Path/UnityExplorer.BIE.Unity.IL2CPP.CoreCLR.dll $Path/UnityExplorer.BIE.Unity.IL2CPP.CoreCLR.dll $Path/mcs.dll $Path/Tomlet.dll
# (cleanup and move files)
Remove-Item $Path/Tomlet.dll
Remove-Item $Path/mcs.dll
Remove-Item $Path/Iced.dll
Remove-Item $Path/Il2CppInterop.Common.dll
Remove-Item $Path/Il2CppInterop.Runtime.dll
Remove-Item $Path/Microsoft.Extensions.Logging.Abstractions.dll
Remove-Item $Path/UnityExplorer.BIE.Unity.IL2CPP.CoreCLR.deps.json
Remove-Item $Path/UnityExplorer.BIE.Unity.IL2CPP.CoreCLR.pdb
New-Item -Path "$Path" -Name "plugins" -ItemType "directory" -Force
New-Item -Path "$Path" -Name "plugins/sinai-dev-UnityExplorer" -ItemType "directory" -Force
Move-Item -Path $Path/UnityExplorer.BIE.Unity.IL2CPP.CoreCLR.dll -Destination $Path/plugins/sinai-dev-UnityExplorer -Force
Move-Item -Path $Path/UniverseLib.BIE.IL2CPP.Interop.dll -Destination $Path/plugins/sinai-dev-UnityExplorer -Force


# ----------- BepInEx 6 Unity Mono -----------
dotnet build src/UnityExplorer.sln -c Release_BIE6_Unity_Mono
$Path = "Release/UnityExplorer.BepInEx6.Unity.Mono"
# ILRepack
lib/ILRepack.exe /target:library /lib:lib/net35 /lib:lib/net35/BepInEx/build647+ /lib:$Path /internalize /out:$Path/UnityExplorer.BIE6.Unity.Mono.dll $Path/UnityExplorer.BIE6.Unity.Mono.dll $Path/mcs.dll $Path/Tomlet.dll
# (cleanup and move files)
Remove-Item $Path/Tomlet.dll
Remove-Item $Path/mcs.dll
Remove-Item $Path/UnityExplorer.BIE6.Unity.Mono.pdb
New-Item -Path "$Path" -Name "plugins" -ItemType "directory" -Force
New-Item -Path "$Path" -Name "plugins/sinai-dev-UnityExplorer" -ItemType "directory" -Force
Move-Item -Path $Path/UnityExplorer.BIE6.Unity.Mono.dll -Destination $Path/plugins/sinai-dev-UnityExplorer -Force
Move-Item -Path $Path/UniverseLib.Mono.dll -Destination $Path/plugins/sinai-dev-UnityExplorer -Force
