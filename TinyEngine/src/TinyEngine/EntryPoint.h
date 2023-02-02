#pragma once

#ifdef TE_PLATFORM_WONDOWS

extern TE::Application* TE::CreateApplication();

int main(int argc, char** argv)
{
	TE::Log::Init();
	TE_CORE_WARN("Initialized Log!");
	int testNum = 5;
	TE_CORE_INFO("Hello! Var = {0}",testNum);

	//printf("*******Tiny Engine Start**********");
	auto app = TE::CreateApplication();
	app->Run();
	delete app;
}
#else
	#error TINYENGINE only support Windows 64-bit for now
#endif //TE_PLATFORM_WONDOWS
