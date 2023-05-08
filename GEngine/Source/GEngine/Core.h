#pragma once
#ifdef GE_PLATFORM_WINDOWS
	#ifdef GE_BUILD_DLL
		#define GENGINE_API __declspec(dllexport)
	#else
		#define GENGINE_API __declspec(dllimport)
	#endif
#else
	#error GE is only for windows
#endif
