#pragma once

#ifdef TE_PLATFORM_WONDOWS
	#ifdef TE_BUILD_DLL
		#define TE_API __declspec(dllexport)
	#else
		#define TE_API __declspec(dllimport)
	#endif 
#else
	#error TE only supports Windows!

#endif //TE_PLATFORM_WONDOWS
