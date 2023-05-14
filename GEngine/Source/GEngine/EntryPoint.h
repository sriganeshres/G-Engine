#pragma once

#ifdef GE_PLATFORM_WINDOWS
	
extern GEngine::Application* GEngine::CreateApplication();
int main(int argc, char** argv)
{
	GEngine::Log::Init();
	GE_CORE_WARN("Intialized it");
	int a = 7;
	GE_INFO("HELLO {0}" ,a);

	auto app = GEngine::CreateApplication(); 
	app->Run();
	delete app;
}
#else
	#error GE is only for windows
#endif 
