project "EASTL"
	kind "StaticLib"
	language "C++"
	cppdialect "C++14"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin/" .. outputdir .. "/%{prj.name}")

	files {
		"source/*.cpp",
		"include/EASTL/**.h"
	}

	includedirs {
		"include",
		"../eabase/include/Common"
	}

	defines {
		"_CHAR16T",
		"_CRT_SECURE_NO_WARNINGS",
		"_SCL_SECURE_NO_WARNINGS",
		"EASTL_OPENSOURCE=0"
	}

	filter "system:windows"
		systemversion "latest"

		files {
			"doc/EASTL.natvis"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "speed"