workspace "TinyEngine"
	architecture "x64"

	configurations
	{
		"Ddebug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "TinyEngine"
	location "TinyEngine"
	kind "SharedLib"
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
		"%{prj.name}/ThirdParty/spdlog/include"
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

		filter "configurations:Ddebug"
			defines "TE_DEBUG"
			symbols "On"
		
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

	filter "configurations:Ddebug"
			defines "TE_DEBUG"
			symbols "On"
		
	filter "configurations:Dist"
			defines "TE_DIST"
			symbols "On"