#pragma once
#include"Core.h"
namespace GEngine {
	class GENGINE_API Application
	{
	public:
		Application();
		virtual ~Application();
		void Run();
	};

	//To Be declared in Client
	Application* CreateApplication();
}