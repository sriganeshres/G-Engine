workspace "GEngine"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release";
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-{cfg.system}-{cfg.architecture}"
project "GEngine"
	location "GEngine"
	kind "SharedLib"
	language "C++"

	targetdir("bin/" .. outputdir .. "/%{prj.name}")
	objdir("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/Source/**.h",
		"%{prj.name}/Source/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/Source",
		"%{prj.name}/Vendor/spdlog/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "on"
		systemversion "latest"

		defines
		{
			"GE_PLATFORM_WINDOWS",
			"GE_BUILD_DLL",
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}
	
	filter "configurations:Debug"
		defines "GE_DEBUG"
		symbols "on"
	filter "configurations:Release"
		defines "GE_RELEASE"
		optimize "on"
	filter "configurations:Dist"
		defines "GE_DIST"
		optimize "on"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir("bin/" .. outputdir .. "/%{prj.name}")
	objdir("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "Gepch.h"
	pchsource "GEngine/Source/Gepch.cpp"

	files
	{
		"%{prj.name}/Source/**.h",
		"%{prj.name}/Source/**.cpp"
	}

	includedirs
	{
		"GEngine/Vendor/spdlog/include",
		"GEngine/Source"
	}
	
	links
	{
		"GEngine"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "on"
		systemversion "latest"

		defines
		{
			"GE_PLATFORM_WINDOWS"
		}
	
	filter "configurations:Debug"
		defines "GE_DEBUG"
		symbols "on"
	filter "configurations:Release"
		defines "GE_RELEASE"
		optimize "on"
	filter "configurations:Dist"
		defines "GE_DIST"
		optimize "on"