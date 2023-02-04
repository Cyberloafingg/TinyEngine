workspace "TinyEngine"
	architecture "x64"

	configurations
	{
		"Ddebug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "TinyEngine/ThirdParty/GLFW/include"

include "TinyEngine/ThirdParty/GLFW"


project "TinyEngine"
	location "TinyEngine"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "tepch.h"
	pchsource "TinyEngine/src/tepch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/ThirdParty/spdlog/include",
		"%{IncludeDir.GLFW}"
	}

	links 
	{ 
		"GLFW",
		"opengl32.lib"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "10.0.19041.0"

		defines
		{
			"TE_PLATFORM_WONDOWS",
			"TE_BUILD_DLL"
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}

		filter "configurations:Release"
			defines "TE_RELEASE"
			symbols "On"
			buildoptions "/MD"

		filter "configurations:Ddebug"
			defines "TE_DEBUG"
			symbols "On"
			buildoptions "/MD"
		
		filter "configurations:Dist"
			defines "TE_DIST"
			symbols "On"


project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}
	
	includedirs
	{
		"TinyEngine/ThirdParty/spdlog/include",
		"TinyEngine/src"
	}

	links
	{
		"TinyEngine"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "10.0.19041.0"

		defines
		{
			"TE_PLATFORM_WONDOWS"
		}

	filter "configurations:Release"
			defines "TE_RELEASE"
			symbols "On"
			buildoptions "/MT"

	filter "configurations:Ddebug"
			defines "TE_DEBUG"
			symbols "On"
			buildoptions "/MT"
		
	filter "configurations:Dist"
			defines "TE_DIST"
			symbols "On"